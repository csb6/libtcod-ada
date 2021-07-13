with Libtcod, Libtcod.Maps, Libtcod.Console;

package Game_Maps is
   use Libtcod;
   
   type Tile_Flag is (Can_Walk);
   
   type Tile_Flag_Set is array(Tile_Flag) of Boolean
     with Pack;

   type Tile is record
      flags : Tile_Flag_Set := (Can_Walk => True);
   end record;
   
   function make_tile return Tile;
   
   
   type Game_Map(width : Maps.X_Pos; height : Maps.Y_Pos) is tagged private;
   
   function make_game_map(w : Width; h : Height) return Game_Map;
   
   procedure render(self : Game_Map; screen : in out Console.Screen);
   
   function is_wall(self : Game_Map;
                    x : Maps.X_Pos; y : Maps.Y_Pos) return Boolean;
   
private
   
   type Tile_Grid is array(Maps.Y_Pos range <>, Maps.X_Pos range <>) of Tile;
   
   type Game_Map(width : Maps.X_Pos; height : Maps.Y_Pos) is tagged record
      tiles : Tile_Grid(0..height, 0..width);
   end record;

end Game_Maps;
