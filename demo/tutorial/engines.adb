with Libtcod.Input, Libtcod.Color, Libtcod.Maps.BSP, Ada.Numerics.Discrete_Random,
     Ada.Assertions, Ada.Text_IO;

package body Engines is

   use Ada.Assertions;
   use type Maps.X_Pos, Maps.Y_Pos;

   Max_Monsters_Per_Room : constant := 3;
   Max_Room_Size : constant := 12;
   Min_Room_Size : constant := 6;

   function get_actor(self : in out Engine; id : Actor_Id) return Actor_Ref is
     (self.actor_list.Reference(id));

   function player(self : in out Engine) return Actor_Ref is (self.get_actor(self.player_id));

   type Random_Int is new Natural;
   package Natural_Random is new Ada.Numerics.Discrete_Random(Random_Int);
   use Natural_Random;
   rand_nat_gen : Natural_Random.Generator;

   function one_of_n_chance(n : Random_Int) return Boolean is
     (Random(rand_nat_gen) mod n = 0);

   function k_of_n_chance(k, n : Random_Int) return Boolean is
     (Random(rand_nat_gen) mod n < k);

   function rand_range_int(start_n, end_n : Random_Int) return Random_Int is
     (Random(rand_nat_gen) mod (end_n - start_n) + start_n);

   function rand_range(start_n, end_n : Maps.X_Pos) return Random_Int is
     (Random(rand_nat_gen) mod (Random_Int(end_n) - Random_Int(start_n)) + Random_Int(start_n));

   function rand_range(start_n : Maps.X_Pos; end_n : Width) return Random_Int is
     (Random(rand_nat_gen) mod (Random_Int(end_n) - Random_Int(start_n)) + Random_Int(start_n));

   function rand_range(start_n, end_n : Maps.Y_Pos) return Random_Int is
     (Random(rand_nat_gen) mod (Random_Int(end_n) - Random_Int(start_n)) + Random_Int(start_n));

   function rand_range(start_n : Maps.Y_Pos; end_n : Height) return Random_Int is
     (Random(rand_nat_gen) mod (Random_Int(end_n) - Random_Int(start_n)) + Random_Int(start_n));

   --------------
   -- can_walk --
   --------------

   function can_walk(self : Engine; x : Maps.X_Pos; y : Maps.Y_Pos) return Boolean is
   begin
      if self.map.is_wall(x, y) then
         return False;
      end if;
      for a of self.actor_list loop
         if a.pos.x = x and then a.pos.y = y then
            -- Actor is present, cannot walk here
            return False;
         end if;
      end loop;
      return True;
   end can_walk;

   -----------------
   -- add_monster --
   -----------------

   procedure add_monster(self : in out Engine; x : Maps.X_Pos; y : Maps.Y_Pos) is
   begin
      if k_of_n_chance(k => 80, n => 100) then
         self.actor_list.Append(Actors.make_actor(x, y, 'o', "Orc", Color.desaturated_green));
      else
         self.actor_list.Append(Actors.make_actor(x, y, 'T', "Troll", Color.darker_green));
      end if;
   end add_monster;

   type Actor_Action is (Actor_No_Move, Actor_Move, Actor_Attack);

   --------------------
   -- move_or_attack --
   --------------------

   function move_or_attack(self : Engine; attacker : Actor_Ref;
                           target_x : Maps.X_Pos; target_y : Maps.Y_Pos) return Actor_Action is
   begin
      if self.map.is_wall(target_x, target_y) then
         return Actor_No_Move;
      end if;
      for each of self.actor_list loop
         if each.pos.x = target_x and then each.pos.y = target_y then
            Ada.Text_IO.Put_Line("The " & Actors.name(each) & " laughs at your puny efforts to attack them!");
            return Actor_Attack;
         end if;
      end loop;
      attacker.pos.x := target_x;
      attacker.pos.y := target_y;
      return Actor_Move;
   end move_or_attack;

   -----------------
   -- create_room --
   -----------------

   procedure create_room(self : in out Engine; first : Boolean;
                         x1 : Maps.X_Pos; y1 : Maps.Y_Pos;
                         x2 : Maps.X_Pos; y2 : Maps.Y_Pos) is
      monster_count : Random_Int := rand_range_int(0, Max_Monsters_Per_Room);
      monster_x : Maps.X_Pos;
      monster_y : Maps.Y_Pos;
   begin
      self.map.dig(x1, y1, x2, y2);
      if first then
         self.player.pos := (x => (x1+x2) / 2, y => (y1+y2) / 2);
      elsif one_of_n_chance(n => 4) then
         for i in 1 .. monster_count loop
            monster_x := Maps.X_Pos(rand_range(x1, x2));
            monster_y := Maps.Y_Pos(rand_range(y1, y2));
            if self.can_walk(monster_x, monster_y) then
               self.add_monster(monster_x, monster_y);
            end if;
         end loop;
      end if;
   end create_room;

   ---------------
   -- setup_map --
   ---------------

   procedure setup_map(self : in out Engine) is
      use Maps, Maps.BSP;
      bsp_builder : BSP_Tree := make_BSP(0, 0, Width(self.width), Height(self.height));
      room_num : Natural := 0;
      last_x : Maps.X_Pos;
      last_y : Maps.Y_Pos;

      function visit(node : in out BSP_Node) return Boolean is
         x : Maps.X_Pos;
         y : Maps.Y_Pos;
         w : Width;
         h : Height;
      begin
         if node.is_leaf then
            w := Width(rand_range(Min_Room_Size, node.w-2));
            h := Height(rand_range(Min_Room_Size, node.h-2));
            x := X_Pos(rand_range(node.x+1, Width(node.x)+node.w-w-1));
            y := Y_Pos(rand_range(node.y+1, Height(node.y)+node.h-h-1));

            self.create_room(room_num = 0, x, y, x+X_Pos(w)-1, y+Y_Pos(h)-1);
            if room_num /= 0 then
               self.map.dig(last_x, last_y, x+X_Pos(w)/2, last_y);
               self.map.dig(x+X_Pos(w)/2, last_y, x+X_Pos(w)/2, y+Y_Pos(h)/2);
            end if;
            last_x := x+X_Pos(w)/2;
            last_y := y+Y_Pos(h)/2;
            room_num := room_num + 1;
         end if;
         return True;
      end visit;

      not_exited_early : Boolean;
   begin
      bsp_builder.split_recursive(recursion_level => 8,
                                  min_w => Max_Room_Size, min_h => Max_Room_Size,
                                  min_wh_ratio => 1.5, min_hw_ratio => 1.5);
      not_exited_early := bsp_builder.traverse_inverted_level_order(visit'Access);
      Assert(not_exited_early);
      -- Calcluate player's initial FOV
      self.map.compute_fov(self.player.pos.x, self.player.pos.y, self.fov_radius);
   end setup_map;

   -----------------
   -- make_engine --
   -----------------

   function make_engine(w : Libtcod.Width; h : Libtcod.Height) return Engine is
   begin
      return self : Engine := (width => Maps.X_Pos(w), height => Maps.Y_Pos(h),
                               map => make_game_map(w, h),
                               player_id => Actor_Id'First,
                               status => Status_Idle,
                               fov_radius => 10,
                               others => <>) do
         self.actor_list.Append(make_actor(60, 13, '@', "Player", Color.yellow));
         setup_map(self);
      end return;
   end make_engine;

   ------------
   -- update --
   ------------

   procedure update(self : in out Engine) is
      use Input;
      use type Input.Event_Type, Maps.X_Diff, Maps.Y_Diff;

      k : aliased Key;
      event_kind : Event_Type := Input.check_for_event(Event_Key_Press, k);
      player_ref : Actor_Ref := self.player;

      dx : Maps.X_Diff := 0;
      dy : Maps.Y_Diff := 0;
   begin
      if event_kind = Event_Key_Press then
         case get_key_type(k) is
            when Key_Up => dy := -1;
            when Key_Down => dy := 1;
            when Key_Left => dx := -1;
            when Key_Right => dx := 1;
            when others => null;
         end case;

         if dx /= 0 or else dy /= 0 then
            self.status := Status_New_Turn;
            case self.move_or_attack(player_ref, Maps.add(player_ref.pos.x, dx),
                                     Maps.add(player_ref.pos.y, dy)) is
               when Actor_Move =>
                  self.map.compute_fov(player_ref.pos.x, player_ref.pos.y, self.fov_radius);
               when others => null;
            end case;
         end if;
      end if;

      case self.status is
         when Status_New_Turn =>
            for each of self.actor_list loop
               if each /= player_ref then
                  Actors.update(each);
               end if;
            end loop;
         when others => null;
      end case;
   end update;

   ------------
   -- render --
   ------------

   procedure render(self : in out Engine; screen : in out Console.Screen) is
   begin
      screen.clear;
      self.map.render(screen);

      for each of self.actor_list loop
         if self.map.in_fov(each.pos.x, each.pos.y) then
            Actors.render(each, screen);
         end if;
      end loop;
   end render;

end Engines;
