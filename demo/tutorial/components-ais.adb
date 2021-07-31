with Actors, Engines, Libtcod.Maps, Libtcod.Input, Ada.Numerics.Elementary_Functions;
use Libtcod;

package body Components.AIs is

   package Float_Math renames Ada.Numerics.Elementary_Functions;

   --------------------
   -- move_or_attack --
   --------------------

   function move_or_attack(self : in out Player_AI; owner : in out Actors.Actor;
                           target_x : Maps.X_Pos; target_y : Maps.Y_Pos;
                           engine : in out Engines.Engine) return Boolean is
      use type Maps.X_Pos, Maps.Y_Pos, Actors.Actor, Actors.Actor_Vector;
      procedure move_to_target is
      begin
         owner.pos.x := target_x;
         owner.pos.y := target_y;
      end move_to_target;
   begin
      if engine.map.is_wall(target_x, target_y) then
         return False;
      end if;

      for target of engine.actor_list loop
         if target.pos.x = target_x and then target.pos.y = target_y and then target.is_destructible
           and then target /= owner then
            if target.destructible.is_dead then
               IO.Put_Line("There is a " & target.get_name & " corpse here");
               move_to_target;
               return True;
            else
               owner.attacker.attack(owner, target, engine);
               return False;
            end if;
         end if;
      end loop;
      -- Space is free to move to
      move_to_target;
      return True;
   end move_or_attack;

   ------------
   -- update --
   ------------

   overriding
   procedure update(self : in out Player_AI; owner : in out Actors.Actor; engine : in out Engines.Engine) is
      dx : Maps.X_Diff := 0;
      dy : Maps.Y_Diff := 0;
      use Libtcod.Input, Maps;
   begin
      if owner.is_destructible and then owner.destructible.is_dead then
         return;
      end if;

      case engine.last_key_type is
         when Key_Up => dy := -1;
         when Key_Down => dy := 1;
         when Key_Left => dx := -1;
         when Key_Right => dx := 1;
      end case;

      if dx /= 0 or else dy /= 0 then
         engine.status := Engines.Status_New_Turn;
         if self.move_or_attack(owner, owner.pos.x + dx, owner.pos.y + dy, engine) then
            engine.map.compute_fov(owner.pos.x, owner.pos.y, engine.fov_radius);
         end if;
      end if;
   end update;

   --------------------
   -- move_or_attack --
   --------------------

   procedure move_or_attack(self : in out Monster_AI; owner : in out Actors.Actor;
                           target_x : Maps.X_Pos; target_y : Maps.Y_Pos;
                           engine : in out Engines.Engine) is
      use type Maps.X_Pos, Maps.Y_Pos, Maps.X_Diff, Maps.Y_Diff;
      dx, step_x : Maps.X_Diff;
      dy, step_y : Maps.Y_Diff;
      distance : Float;
   begin
      if engine.map.is_wall(target_x, target_y) then
         return;
      end if;

      dx := target_x - owner.pos.x;
      dy := target_y - owner.pos.y;
      step_x := (if dx > 0 then 1 else -1);
      step_y := (if dy > 0 then 1 else -1);
      distance := Float_Math.Sqrt(Float(Integer(dx**2) + Integer(dy**2)));
      if distance >= 2.0 then
         dx := Maps.X_Diff(Float'Rounding(Float(dx) / distance));
         dy := Maps.Y_Diff(Float'Rounding(Float(dy) / distance));
         if engine.can_walk(owner.pos.x + dx, owner.pos.y + dy) then
            owner.pos.x := owner.pos.x + dx;
            owner.pos.y := owner.pos.y + dy;
         elsif engine.can_walk(owner.pos.x + step_x, owner.pos.y) then
           owner.pos.x := owner.pos.x + step_x;
         elsif engine.can_walk(owner.pos.x, owner.pos.y + step_y) then
            owner.pos.y := owner.pos.y + step_y;
         end if;
      elsif owner.is_attacker then
         owner.attacker.attack(owner, engine.player, engine);
      end if;
   end move_or_attack;

   ------------
   -- update --
   ------------

   overriding
   procedure update(self : in out Monster_AI; owner : in out Actors.Actor; engine : in out Engines.Engine) is
   begin
      if owner.is_destructible and then owner.destructible.is_dead then
         return;
      end if;

      if engine.map.in_fov(owner.pos.x, owner.pos.y) then
         self.move_count := Turns_To_Track;
      elsif self.move_count = 0 then
         return;
      else
         self.move_count := self.move_count - 1;
      end if;

      self.move_or_attack(owner, engine.player.pos.x, engine.player.pos.y, engine);
   end update;

end Components.AIs;
