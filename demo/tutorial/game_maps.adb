with Libtcod.Color, Libtcod.Maps.FOV;

package body Game_Maps is

   dark_wall : constant Color.RGB_Color := Color.make_RGB_color(0, 0, 100);
   dark_ground : constant Color.RGB_Color := Color.make_RGB_color(50, 50, 150);
   light_wall : constant Color.RGB_Color := Color.make_RGB_color(130, 110, 50);
   light_ground : constant Color.RGB_Color := Color.make_RGB_color(200, 180, 50);

   -------------
   -- is_wall --
   -------------

   function is_wall(self : Game_Map; x : Maps.X_Pos; y : Maps.Y_Pos) return Boolean is
     (not self.map.is_walkable(x, y));

   -----------------
   -- is_explored --
   -----------------

   function is_explored(self : Game_Map; x : Maps.X_Pos; y : Maps.Y_Pos) return Boolean is
     (self.tiles(y, x).flags(Explored));

   ------------
   -- in_fov --
   ------------

   function in_fov(self : in out Game_Map; x : Maps.X_Pos; y : Maps.Y_Pos) return Boolean is
   begin
      if Maps.FOV.in_FOV(self.map, x, y) then
         self.tiles(y, x).flags(Explored) := True;
         return True;
      end if;
      return False;
   end in_fov;

   -----------------
   -- compute_fov --
   -----------------

   procedure compute_fov(self : in out Game_Map; source_x : Maps.X_Pos; source_y : Maps.Y_Pos;
                         radius : Maps.Radius) is
   begin
      Maps.FOV.compute_FOV(self.map, source_x, source_y, radius);
   end compute_fov;

   ---------
   -- dig --
   ---------

   procedure dig(self : in out Game_Map; x1 : Maps.X_Pos; y1 : Maps.Y_Pos;
                 x2 : Maps.X_Pos; y2 : Maps.Y_Pos) is
   begin
      for y in Maps.Y_Pos'Min(y1, y2) .. Maps.Y_Pos'Max(y1, y2) loop
         for x in Maps.X_Pos'Min(x1, x2) .. Maps.X_Pos'Max(x1, x2) loop
            self.map.set_properties(x, y, walkable => True, transparent => True);
         end loop;
      end loop;
   end dig;

   ---------------
   -- make_tile --
   ---------------

   function make_tile return Tile is
   begin
      return result : Tile;
   end make_tile;

   -------------------
   -- make_game_map --
   -------------------

   function make_game_map(w : Width; h : Height) return Game_Map is
   begin
      return map : Game_Map := (width => Maps.X_Pos(w),
                                height => Maps.Y_Pos(h), tiles => <>,
                                map => Maps.make_map(w, h));
   end make_game_map;

   ------------
   -- render --
   ------------

   procedure render(self : in out Game_Map; screen : in out Console.Screen) is
   begin
      for y in self.tiles'Range loop
         for x in self.tiles'Range(2) loop
            if self.in_fov(x, y) then
               screen.set_char_bg(Console.X_Pos(x), Console.Y_Pos(y),
                                  (if self.is_wall(x, y) then light_wall
                                   else light_ground));
            elsif self.is_explored(x, y) then
               screen.set_char_bg(Console.X_Pos(x), Console.Y_Pos(y),
                                  (if self.is_wall(x, y) then dark_wall
                                   else dark_ground));
            end if;
         end loop;
      end loop;
   end render;

end Game_Maps;
