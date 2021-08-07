with Actors, Engines, Components.Destructibles, Libtcod.Color;

package body Components.Attackers is

   use Destructibles;

   ------------
   -- attack --
   ------------

   procedure attack(self : in out Attacker; owner : in out Actors.Actor;
                    target : in out Actors.Actor; engine : in out Engines.Engine) is
      use Actors, Libtcod;

      real_damage : Health;
      target_destructible : access Destructible := target.destructible;
      msg_header : constant String := owner.get_name & " attacks " & target.get_name & " ";
      msg_color : constant RGB_Color := (if owner = engine.player then Color.red else Color.light_grey);
   begin
      if target.is_destructible and then not target_destructible.is_dead then
         real_damage := target_destructible.take_damage(target, self.power, engine);
         if real_damage = 0 then
            engine.gui.log(msg_header & "for no damage", msg_color);
         else
            engine.gui.log(msg_header & "for" & real_damage'Image & " damage", msg_color);
         end if;
      else
         engine.gui.log(msg_header & "in vain", msg_color);
      end if;
   end attack;

end Components.Attackers;
