with Ada.Numerics.Elementary_Functions;
with Libtcod.Maps, Libtcod.Input, Libtcod.Console, Libtcod.Color; use Libtcod;
with Actors, Engines, Components.Containers;

package body Components.AIs is

   use type Maps.X_Pos, Maps.Y_Pos, Maps.X_Diff, Maps.Y_Diff, Actors.Actor;
   package Float_Math renames Ada.Numerics.Elementary_Functions;

   ---------------------------
   -- player_move_or_attack --
   ---------------------------

   function player_move_or_attack(owner : in out Actors.Actor;
                                  target_x : Maps.X_Pos; target_y : Maps.Y_Pos;
                                  engine : in out Engines.Engine) return Boolean is
      procedure move_to_target is
      begin
         owner.x := target_x;
         owner.y := target_y;
      end move_to_target;
   begin
      if engine.map.is_wall(target_x, target_y) then
         return False;
      end if;

      for target of engine.actor_list loop
         if target.x = target_x and then target.y = target_y and then target /= owner then
            if target.is_destructible then
               if target.destructible.is_dead then
                  engine.gui.log("There is a " & target.get_name & " corpse here.");
                  move_to_target;
                  return True;
               else
                  owner.attacker.attack(owner, target, engine);
                  return False;
               end if;
            elsif target.is_pickable then
               engine.gui.log("There is a " & target.get_name & " here.");
               move_to_target;
               return True;
            end if;
         end if;
      end loop;
      -- Space is free to move to
      move_to_target;
      return True;
   end player_move_or_attack;

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
         if player_move_or_attack(owner, owner.x + dx, owner.y + dy, engine) then
            engine.map.compute_fov(owner.x, owner.y, engine.fov_radius);
         end if;
      end if;
   end update;

   ----------------------------
   -- monster_move_or_attack --
   ----------------------------

   procedure monster_move_or_attack(owner : in out Actors.Actor;
                                    target_x : Maps.X_Pos; target_y : Maps.Y_Pos;
                                    engine : in out Engines.Engine) is
      dx, step_x : Maps.X_Diff;
      dy, step_y : Maps.Y_Diff;
      distance : Float;
   begin
      if engine.map.is_wall(target_x, target_y) then
         return;
      end if;

      dx := target_x - owner.x;
      dy := target_y - owner.y;
      step_x := (if dx > 0 then 1 else -1);
      step_y := (if dy > 0 then 1 else -1);
      distance := Float_Math.Sqrt(Float(Integer(dx**2) + Integer(dy**2)));
      if distance >= 2.0 then
         dx := Maps.X_Diff(Float'Rounding(Float(dx) / distance));
         dy := Maps.Y_Diff(Float'Rounding(Float(dy) / distance));
         if engine.can_walk(owner.x + dx, owner.y + dy) then
            owner.x := owner.x + dx;
            owner.y := owner.y + dy;
         elsif engine.can_walk(owner.x + step_x, owner.y) then
           owner.x := owner.x + step_x;
         elsif engine.can_walk(owner.x, owner.y + step_y) then
            owner.y := owner.y + step_y;
         end if;
      elsif owner.is_attacker then
         owner.attacker.attack(owner, engine.player, engine);
      end if;
   end monster_move_or_attack;

   ------------
   -- update --
   ------------

   overriding
   procedure update(self : in out Monster_AI; owner : in out Actors.Actor; engine : in out Engines.Engine) is
   begin
      if owner.is_destructible and then owner.destructible.is_dead then
         return;
      end if;

      if engine.map.in_fov(owner.x, owner.y) then
         self.move_count := Turns_To_Track;
      elsif self.move_count = 0 then
         return;
      else
         self.move_count := self.move_count - 1;
      end if;

      monster_move_or_attack(owner, engine.player.x, engine.player.y, engine);
   end update;

end Components.AIs;
