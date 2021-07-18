with Actors, Libtcod, Libtcod.Maps, Libtcod.Console;

package Game_Maps is
   use Libtcod;

   type Tile_Flag is (Explored);

   type Tile_Flag_Set is array(Tile_Flag) of Boolean
     with Pack;

   type Tile is record
      flags : Tile_Flag_Set := (Explored => False);
   end record;

   function make_tile return Tile;


   type Game_Map(width : Maps.X_Pos; height : Maps.Y_Pos) is tagged limited private;

   function make_game_map(w : Width; h : Height) return Game_Map;

   procedure render(self : in out Game_Map; screen : in out Console.Screen);

   function is_wall(self : Game_Map; x : Maps.X_Pos; y : Maps.Y_Pos) return Boolean
     with Inline;

   function is_explored(self : Game_Map; x : Maps.X_Pos; y : Maps.Y_Pos) return Boolean
     with Inline;

   function in_fov(self : in out Game_Map; x : Maps.X_Pos; y : Maps.Y_Pos) return Boolean;

   procedure compute_fov(self : in out Game_Map; source_x : Maps.X_Pos; source_y : Maps.Y_Pos;
                         radius : Maps.Radius);

   procedure dig(self : in out Game_Map; x1 : Maps.X_Pos; y1 : Maps.Y_Pos;
                 x2 : Maps.X_Pos; y2 : Maps.Y_Pos);

private

   type Tile_Grid is array(Maps.Y_Pos range <>, Maps.X_Pos range <>) of Tile;

   type Game_Map(width : Maps.X_Pos; height : Maps.Y_Pos) is tagged limited record
      tiles : Tile_Grid(0..height, 0..width);
      map : Maps.Map;
   end record;

end Game_Maps;
