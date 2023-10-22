with Ada.Containers;
with Maps, Actors, Components.Destructibles, Components.Inventories;

package body Components.Pickables is

    use type Ada.Containers.Count_Type;

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

    function consume(owner : in out Actors.Actor; target : in out Actors.Actor) return Boolean is
        inventory_index : Integer;
    begin
        if owner.pickable = null then
            return False;
        end if;

        case owner.pickable.kind is
            when Kind_Health =>
                if target.destructible = null or else target.inventory = null then
                    return False;
                end if;

                inventory_index := target.inventory.Find_Index(owner.id);
                if inventory_index = Inventories.Invalid_Index then
                    return False;
                end if;

                if Destructibles.heal(target, owner.pickable.hp) > 0 then
                    target.inventory.Delete(inventory_index);
                    return True;
                end if;
        end case;
        return False;
    end consume;

end Components.Pickables;