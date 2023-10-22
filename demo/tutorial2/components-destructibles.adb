with Libtcod.Color;
with Actors, Engines;

package body Components.Destructibles is

    use Actors.Name_Operators;

    function take_damage(owner : in out Actors.Actor; damage : Health; engine : in out Engines.Engine) return Health is
        damage_taken : Health := 0;
    begin
        if damage > owner.destructible.defense then
            damage_taken := damage - owner.destructible.defense;
            if damage_taken >= owner.destructible.hp then
                owner.destructible.hp := 0;
                die(owner, engine);
            else
                owner.destructible.hp := owner.destructible.hp - damage_taken;
            end if;
        end if;
        return damage_taken;
    end take_damage;

    procedure die(owner : in out Actors.Actor; engine : in out Engines.Engine) is
    begin
        owner.ch := '%';
        owner.color := Libtcod.Color.crimson;
        owner.blocks := False;
        case owner.destructible.kind is
            when Kind_Player =>
                engine.gui.log("You died!", Libtcod.Color.red);
                engine.status := Engines.Defeat;
            when Kind_Monster =>
                engine.gui.log(owner.name & " died!", Libtcod.Color.red);
        end case;
        owner.name := owner.name & Actors.create_name(" Corpse");
    end die;

end Components.Destructibles;