with Ada.Numerics.Elementary_Functions;
with Libtcod.Maps, Libtcod.Input, Libtcod.Console, Libtcod.Color; use Libtcod;
with Actors, Engines, Components.Containers;

package body Components.AIs is

   use type Maps.X_Pos, Maps.Y_Pos, Maps.X_Diff, Maps.Y_Diff, Actors.Actor;
   package Float_Math renames Ada.Numerics.Elementary_Functions;

   Inventory_Screen_Width : constant := 50;
   Inventory_Screen_Height : constant := 28;

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

   function choose_from_inventory(owner : Actors.Actor; engine : in out Engines.Engine;
                                  selected_item_out : out Actor_Id) return Boolean is
      use type Console.X_Pos, Console.Y_Pos, Input.Event_Type, Input.Key_Type;

      inventory_screen : Console.Screen := Console.make_screen(Inventory_Screen_Width, Inventory_Screen_Height);
      shortcut : Character := 'a';
      y : Console.Y_Pos := 1;
      id : Actor_Id;
      event_kind : Input.Event_Type;
      k : aliased Input.Key;
   begin
      inventory_screen.set_default_fg(Color.make_RGB_color(200, 180, 50));
      inventory_screen.print(x => 0, y => 0, text => "Inventory");

      inventory_screen.set_default_fg(Color.white);
      for item in owner.inventory.Iterate loop
         id := Containers.Value_Of(item);
         inventory_screen.print(x => 2, y => y, text => "(" & shortcut & ") " & engine.actor_list(id).get_name);
         y := y + 1;
         shortcut := Character'Succ(shortcut);
      end loop;

      inventory_screen.blit(src_x => 0, src_y => 0,
                            w => Inventory_Screen_Width, h => Inventory_Screen_Height,
                            dest => engine.main_screen'Access,
                            dest_x => Console.X_Pos(engine.main_screen.get_width) / 2 - Inventory_Screen_Width / 2,
                            dest_y => Console.Y_Pos(engine.main_screen.get_height) / 2 - Inventory_Screen_Height / 2);
      
      event_kind := Input.check_for_event(Input.Event_Key_Press, k);
      if event_kind = Input.Event_Key_Press then
         if Input.get_key_type(k) = Input.Key_Char then
            shortcut := Input.get_char(k);
            if shortcut in 'a' .. 'z' then
               -- TODO: find index of this item
               selected_item_out := 0;
               return True;
            end if;
         end if;
      end if;
      return False;
   end choose_from_inventory;

   -----------------------
   -- handle_action_key --
   -----------------------

   procedure handle_action_key(owner : in out Actors.Actor; engine : in out Engines.Engine; ch : Character) is
      target_id : Actor_Id := Actor_Id'First;
      found : Boolean := False;
   begin
      case ch is
      when 'g' =>
         -- Pick up item
         for target of engine.actor_list loop
            if target.is_pickable and then target.x = owner.x and then target.y = owner.y then
               if target.pickable.pick(owner, target_id) then
                  engine.gui.log("You pick up the " & target.get_name & ".");
                  found := True;
               elsif not found then
                  engine.gui.log("Your inventory is full.", Color.red);
                  found := True;
               end if;
            end if;
            target_id := target_id + 1;
         end loop;

         if not found then
            engine.gui.log("There's nothing here that you can pick up.");
         end if;
      when 'i' =>
         -- Open inventory subscreen
         if choose_from_inventory(owner, engine, selected_item_out => target_id) then
            null;
         end if;
      when others => null;
      end case;
   end handle_action_key;

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
         when Key_Char => handle_action_key(owner, engine, engine.last_char);
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
