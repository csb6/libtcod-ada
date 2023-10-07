with Libtcod.Maps, Libtcod.Console;

package Maps is

    -- Types
    subtype X_Pos is Libtcod.Maps.X_Pos;
    subtype Y_Pos is Libtcod.Maps.Y_Pos;
    subtype X_Diff is Libtcod.Maps.X_Diff;
    subtype Y_Diff is Libtcod.Maps.Y_Diff;
    subtype Width is Libtcod.Width;
    subtype Height is Libtcod.Height;
    subtype Radius is Libtcod.Maps.Radius;

    type Map(width : X_Pos; height : Y_Pos) is limited private;

    -- Constructors
    function create(w : Width; h : Height) return Map;

    -- Properties
    function is_wall(self : Map; x : X_Pos; y : Y_Pos) return Boolean;
    function is_explored(self : Map; x : X_Pos; y : Y_Pos) return Boolean;
    function in_fov(self : in out Map; x : X_Pos; y : Y_Pos) return Boolean;

    -- Actions
    procedure render(self : in out Map; screen : in out Libtcod.Console.Screen);
    procedure dig(self : in out Map; x1 : X_Pos; y1 : Y_Pos; x2 : X_Pos; y2 : Y_Pos);
    procedure compute_fov(self : in out Map; pov_x : X_Pos; pov_y : Y_Pos);

private

    type Boolean_Grid is array(Y_Pos range <>, X_Pos range <>) of Boolean
        with Default_Component_Value => False;

    type Map(width : X_Pos; height : Y_Pos) is limited record
        explored : Boolean_Grid(Y_Pos'First..height, X_Pos'First..width);
        terrain_map : Libtcod.Maps.Map;
    end record;

end Maps;