with Libtcod.Input, Libtcod.Color, Libtcod.Maps.BSP, Ada.Numerics.Discrete_Random;

package body Engines is

   type Random_Int is mod 2**32;
   package Natural_Random is new Ada.Numerics.Discrete_Random(Random_Int);
   use Natural_Random;
   rand_nat_gen : Natural_Random.Generator;

   function one_of_n_chance(n : Random_Int) return Boolean is
     (Random(rand_nat_gen) mod n = 0);

   function rand_range(start_n : Maps.X_Pos; end_n : Width) return Random_Int is
     (Random(rand_nat_gen) mod (Random_Int(end_n) - Random_Int(start_n)) + Random_Int(start_n));

   function rand_range(start_n : Maps.Y_Pos; end_n : Height) return Random_Int is
     (Random(rand_nat_gen) mod (Random_Int(end_n) - Random_Int(start_n)) + Random_Int(start_n));

   procedure create_room(self : in out Engine; first : Boolean;
                         x1 : Maps.X_Pos; y1 : Maps.Y_Pos;
                         x2 : Maps.X_Pos; y2 : Maps.Y_Pos) is
      use type Maps.X_Pos, Maps.Y_Pos;
   begin
      self.map.dig(x1, y1, x2, y2);
      if first then
         self.actor_list(self.player).pos := (x => (x1+x2) / 2, y => (y1+y2) / 2);
      elsif one_of_n_chance(n => 4) then
         self.actor_list.Append(Actors.make_actor((x1+x2) / 2, (y1+y2) / 2, '@',
                                Color.yellow));
      end if;
   end create_room;

   procedure setup_map(self : in out Engine) is
      use Maps, Maps.BSP;
      use type Maps.X_Pos, Maps.Y_Pos;
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
         if is_leaf(node) then
            w := Width(rand_range(Min_Room_Size, node.w-2));
            h := Height(rand_range(Min_Room_Size, node.h-2));
            x := X_Pos(rand_range(node.x+1, Width(node.x)+node.w-w-1));
            y := Y_Pos(rand_range(node.y+1, Height(node.y)+node.h-h-1));

            create_room(self, room_num = 0, x, y, x+X_Pos(w)-1, y+Y_Pos(h)-1);
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

      result : Boolean;
   begin
      split_recursive(bsp_builder, 8, Max_Room_Size, Max_Room_Size, 1.5, 1.5);
      result := traverse_inverted_level_order(bsp_builder, visit'Access);
   end setup_map;

   -----------------
   -- make_engine --
   -----------------

   function make_engine(w : Libtcod.Width; h : Libtcod.Height) return Engine is
   begin
      return self : Engine := (width => Maps.X_Pos(w), height => Maps.Y_Pos(h),
                               map => make_game_map(w, h),
                               player => Actor_Id'First,
                               others => <>) do
         self.actor_list.Append(make_actor(60, 13, '@', Color.yellow));
         setup_map(self);
      end return;
   end make_engine;

   function get_actor(self : in out Engine; id : Actor_Id) return Actor_Ref is
     (self.actor_list.Reference(id));

   ------------
   -- update --
   ------------

   procedure update (self : in out Engine) is
      use Input;
      use type Input.Event_Type, Maps.X_Pos, Maps.Y_Pos;

      k : aliased Key;
      event_kind : Event_Type := Input.check_for_event(Event_Key_Press, k);
      player_ref : Actor_Ref := self.get_actor(self.player);
   begin
      if event_kind = Event_Key_Press then
         case get_key_type(k) is
            when Key_Up =>
               if not self.map.is_wall(player_ref.pos.x, player_ref.pos.y-1) then
                  player_ref.pos.y := player_ref.pos.y - 1;
               end if;
            when Key_Down =>
               if not self.map.is_wall(player_ref.pos.x, player_ref.pos.y+1) then
                  player_ref.pos.y := player_ref.pos.y + 1;
               end if;
            when Key_Left =>
               if not self.map.is_wall(player_ref.pos.x-1, player_ref.pos.y) then
                  player_ref.pos.x := player_ref.pos.x - 1;
               end if;
            when Key_Right =>
               if not self.map.is_wall(player_ref.pos.x+1, player_ref.pos.y) then
                  player_ref.pos.x := player_ref.pos.x + 1;
               end if;
            when others => null;
         end case;
      end if;
   end update;

   ------------
   -- render --
   ------------

   procedure render(self : Engine; screen : in out Console.Screen) is
   begin
      screen.clear;
      self.map.render(screen);

      for each of self.actor_list loop
         Actors.render(each, screen);
      end loop;
   end render;

end Engines;
