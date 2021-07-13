with Libtcod.Input, Libtcod.Color;

package body Engines is

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
      player_ref : Actor_Ref := get_actor(self, self.player);
   begin
      if event_kind = Event_Key_Press then
         case get_key_type(k) is
            when Key_Up =>
               if not self.map.is_wall(player_ref.x, player_ref.y-1) then
                  player_ref.y := player_ref.y - 1;
               end if;
            when Key_Down =>
               if not self.map.is_wall(player_ref.x, player_ref.y+1) then
                  player_ref.y := player_ref.y + 1;
               end if;
            when Key_Left =>
               if not self.map.is_wall(player_ref.x-1, player_ref.y) then
                  player_ref.x := player_ref.x - 1;
               end if;
            when Key_Right =>
               if not self.map.is_wall(player_ref.x+1, player_ref.y) then
                  player_ref.x := player_ref.x + 1;
               end if;
            when others => null;
         end case;
      end if;
   end update;

   ------------
   -- render --
   ------------

   procedure render (self : Engine; screen : in out Console.Screen) is
   begin
      screen.clear;
      self.map.render(screen);

      for each of self.actor_list loop
         Actors.render(each, screen);
      end loop;
   end render;

end Engines;
