with Actors, Engines;

package body Components.Attackers is

   ------------
   -- attack --
   ------------

   procedure attack(self : in out Attacker; owner : in out Actors.Actor;
                    target : in out Actors.Actor; engine : in out Engines.Engine) is
      real_damage : Health;
      target_destructible : Actors.Destructible_Ref := target.destructible;
      use Actors;
   begin
      IO.Put(owner.get_name & " attacks " & target.get_name & " ");
      if target.is_destructible and then not target_destructible.is_dead then
         real_damage := target_destructible.take_damage(target, self.power, engine);
         if real_damage = 0 then
            IO.Put_Line("for no damage");
         else
            IO.Put_Line("for " & real_damage'Image & " damage");
         end if;
      else
         IO.Put_Line("in vain");
      end if;
   end attack;

end Components.Attackers;
