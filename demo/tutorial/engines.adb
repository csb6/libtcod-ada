with Ada.Numerics.Discrete_Random, Ada.Assertions;
with Libtcod.Maps.BSP, Libtcod.Color;

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

   generic
      type A is range <>;
      type B is range <>;
   function generic_rand_range(start_n : A; end_n : B) return Random_Int;
   function generic_rand_range(start_n : A; end_n : B) return Random_Int is
     (Random(rand_nat_gen) mod (Random_Int(end_n) - Random_Int(start_n)) + Random_Int(start_n));

   function rand_range is new generic_rand_range(Random_Int, Random_Int);
   function rand_range is new generic_rand_range(Maps.X_Pos, Maps.X_Pos);
   function rand_range is new generic_rand_range(Maps.X_Pos, Width);
   function rand_range is new generic_rand_range(Maps.Y_Pos, Maps.Y_Pos);
   function rand_range is new generic_rand_range(Maps.Y_Pos, Height);

   --------------
   -- can_walk --
   --------------

   function can_walk(self : Engine; x : Maps.X_Pos; y : Maps.Y_Pos) return Boolean is
   begin
      if self.map.is_wall(x, y) then
         return False;
      end if;
      for a of self.actor_list loop
         if a.x = x and then a.y = y and then a.blocks then
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
         self.actor_list.Append(Actors.make_orc(x, y));
      else
         self.actor_list.Append(Actors.make_troll(x, y));
      end if;
   end add_monster;

   -----------------
   -- create_room --
   -----------------

   procedure create_room(self : in out Engine; first : Boolean;
                         x1 : Maps.X_Pos; y1 : Maps.Y_Pos;
                         x2 : Maps.X_Pos; y2 : Maps.Y_Pos) is
      monster_count : Random_Int := rand_range(Random_Int'(0), Max_Monsters_Per_Room);
      monster_x : Maps.X_Pos;
      monster_y : Maps.Y_Pos;
   begin
      self.map.dig(x1, y1, x2, y2);
      if first then
         self.player.x := (x1+x2) / 2;
         self.player.y := (y1+y2) / 2;
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
      bsp_builder : BSP_Tree := make_BSP(0, 0, Width(self.map.width), Height(self.map.height));
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
            x := X_Pos(rand_range(node.x+X_Pos'(1), Width(node.x)+node.w-w-1));
            y := Y_Pos(rand_range(node.y+Y_Pos'(1), Height(node.y)+node.h-h-1));

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
      self.map.compute_fov(self.player.x, self.player.y, self.fov_radius);
   end setup_map;

   -----------------
   -- make_engine --
   -----------------

   function make_engine(w : Libtcod.Width; h : Libtcod.Height) return Engine is
   begin
      return self : Engine := (width => Maps.X_Pos(w), height => Maps.Y_Pos(h),
                               map => make_game_map(w, h-GUIs.Panel_Height),
                               player_id => Actor_Id'First,
                               status => Status_Idle,
                               fov_radius => 10,
                               gui => GUIs.make_GUI(w),
                               others => <>) do
         self.actor_list.Append(make_player(60, 13, "Player",
                                defense_stat => 2, power  => 5,
                                hp           => 30, max_hp => 30));
         self.gui.log("Welcome stranger!" & ASCII.LF
                      & "Prepare to perish in the Tombs of the" & ASCII.LF
                      & "Ancient Kings", Libtcod.Color.red);
         setup_map(self);
      end return;
   end make_engine;

   ------------
   -- update --
   ------------

   procedure update(self : in out Engine) is
      use Input;
      use type Input.Event_Type;

      k : aliased Key;
      event_kind : Event_Type := Input.check_for_event(Event_Key_Press, k);
      last_key_type : Key_Type;
   begin
      if event_kind /= Event_Key_Press then
         return;
      end if;

      last_key_type := get_key_type(k);
      if last_key_type not in Valid_Key_Type then
         return;
      end if;

      self.last_key_type := last_key_type;

      self.status := Status_Idle;
      for each of self.actor_list loop
         each.update(self);
      end loop;
   end update;

   ------------
   -- render --
   ------------

   procedure render(self : in out Engine; screen : in out Console.Screen) is
   begin
      screen.clear;
      self.map.render(screen);

      for each of reverse self.actor_list loop
         if self.map.in_fov(each.x, each.y) then
            each.render(screen);
         end if;
      end loop;
      self.gui.render(screen, self);
   end render;

end Engines;
