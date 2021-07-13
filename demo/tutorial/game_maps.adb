with Libtcod.Color;

package body Game_Maps is

   --------------
   -- set_wall --
   --------------

   procedure set_wall(self : in out Game_Map; x : Maps.X_Pos; y : Maps.Y_Pos) is
   begin
      self.tiles(y, x).flags(Can_Walk) := False;
   end set_wall;

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
                                height => Maps.Y_Pos(h), tiles => <>) do
         set_wall(map, x => 30, y => 22);
         set_wall(map, x => 50, y => 22);
      end return;
   end make_game_map;

   ------------
   -- render --
   ------------

   procedure render (self : Game_Map; screen : in out Console.Screen) is
   begin
      for y in self.tiles'Range loop
         for x in self.tiles'Range(2) loop
            screen.set_char_bg(Console.X_Pos(x), Console.Y_Pos(y),
                               (if self.is_wall(x, y) then Color.darkest_grey
                                else Color.light_grey));
         end loop;
      end loop;
   end render;

   -------------
   -- is_wall --
   -------------

   function is_wall(self : Game_Map; x : Maps.X_Pos; y : Maps.Y_Pos) return Boolean is
     (not self.tiles(y, x).flags(Can_Walk));

end Game_Maps;
