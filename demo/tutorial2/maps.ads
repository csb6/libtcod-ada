with Libtcod.Maps, Libtcod.Console;

package Maps is

    -- Types
    subtype X_Pos is Libtcod.Maps.X_Pos;
    subtype Y_Pos is Libtcod.Maps.Y_Pos;
    subtype X_Diff is Libtcod.Maps.X_Diff;
    subtype Y_Diff is Libtcod.Maps.Y_Diff;
    subtype Width is Libtcod.Width;
    subtype Height is Libtcod.Height;

    --  type Tile is record
    --      can_walk : Boolean := True;
    --  end record;

    type Map(width : X_Pos; height : Y_Pos) is limited private;

    -- Constructors
    function create(w : Width; h : Height) return Map;

    -- Actions
    procedure render(self : in out Map; screen : in out Libtcod.Console.Screen);

    function is_wall(self : Map; x : X_Pos; y : Y_Pos) return Boolean;

    procedure set_wall(self : in out Map; x : X_Pos; y : Y_Pos);

private

    --  type Tile_Grid is array(Y_Pos range <>, X_Pos range <>) of Tile;

    type Map(width : X_Pos; height : Y_Pos) is limited record
        terrain_map : Libtcod.Maps.Map;
    end record;

end Maps;