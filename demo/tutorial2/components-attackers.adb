with Ada.Text_IO;
with Actors, Components.Destructibles;

package body Components.Attackers is

    use Actors.Name_Operators;

    procedure attack(owner : Actors.Actor; target : in out Actors.Actor; engine : in out Engines.Engine) is
        damage_dealt : Health;
    begin
        if target.destructible = null or else Destructibles.is_dead(target.destructible.all) then
            -- Can't attack this target
            Ada.Text_IO.Put_Line(owner.name & " attacks " & target.name & " in vain.");
        elsif target.destructible.defense >= owner.attacker.damage then
            Ada.Text_IO.Put_Line(owner.name & " attacks " & target.name & " but it has no effect.");
        else
            damage_dealt := owner.attacker.damage - target.destructible.defense;
            Ada.Text_IO.Put_Line(owner.name & " attacks " & target.name & " for" & damage_dealt'Image & " damage!");
            damage_dealt := Destructibles.take_damage(target, owner.attacker.damage, engine);
        end if;
    end attack;

end Components.Attackers;