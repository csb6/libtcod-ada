with Ada.Containers, Ada.Assertions; use Ada.Assertions;
with Libtcod.Color;
with Maps, Engines, Actors, Components.Destructibles, Components.Inventories;

package body Components.Pickables is

    use Actors.Name_Operators;
    use type Ada.Containers.Count_Type, Actors.Actor_Id;

    function pick(owner : in out Actors.Actor; picker : in out Actors.Actor) return Boolean is
    begin
        if picker.inventory = null or else picker.inventory.Length = picker.inventory.Capacity then
            return False;
        end if;

        owner.x := Maps.X_Pos'Last;
        owner.y := Maps.Y_Pos'Last;
        picker.inventory.Append(owner.id);
        return True;
    end pick;

    procedure consume(owner : in out Actors.Actor; wearer : in out Actors.Actor; engine : in out Engines.Engine) is
        inventory_index : Integer;
        target_id : Actors.Actor_Id;
        target_actor : Actors.Actor;
        damage_dealt : Health;
    begin
        inventory_index := wearer.inventory.Find_Index(owner.id);
        Assert(inventory_index /= Inventories.Invalid_Index);

        case owner.pickable.kind is
            when Kind_Health =>
                if Destructibles.heal(wearer, owner.pickable.hp) > 0 then
                    wearer.inventory.Delete(inventory_index);
                else
                    engine.gui.log("You cannot use that now", Libtcod.Color.yellow);
                end if;

            when Kind_Lightning_Bolt =>
                target_id := engine.get_closest_destructible_actor(wearer.x, wearer.y, max_distance => owner.pickable.bolt_range);
                if target_id = Actors.Invalid_Actor_Id
                   or else not Maps.in_fov(engine.map, engine.actor_list(target_id).x, engine.actor_list(target_id).y) then
                    engine.gui.log("No enemy close enough to strike", Libtcod.Color.light_grey);
                else
                    target_actor := engine.actor_list(target_id);
                    damage_dealt := Destructibles.take_damage(target_actor, owner.pickable.bolt_damage, engine);
                    engine.gui.log("A lightning bolt struck the " & engine.actor_list(target_id).name &
                        " for" & damage_dealt'Image & " damage!", Libtcod.Color.light_blue);
                    engine.actor_list(target_id) := target_actor;
                    wearer.inventory.Delete(inventory_index);
                end if;
        end case;
    end consume;

end Components.Pickables;