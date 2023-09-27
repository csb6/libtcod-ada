with Libtcod.Color;

package body Maps is

    subtype Console_X is Libtcod.Console.X_Pos;
    subtype Console_Y is Libtcod.Console.Y_Pos;

    dark_wall : constant Libtcod.Color.RGB_Color := Libtcod.Color.make_RGB_color(0, 0, 100);
    dark_ground : constant Libtcod.Color.RGB_Color := Libtcod.Color.make_RGB_color(50, 50, 150);

    function create(w : Width; h : Height) return Map is
    begin
        return self : Map := (width => X_Pos(w), height => Y_Pos(h), terrain_map => Libtcod.Maps.make_map(w, h));
    end create;

    procedure render(self : in out Map; screen : in out Libtcod.Console.Screen) is
    begin
        for y in Y_Pos'First .. self.height loop
            for x in X_Pos'First .. self.width loop
                screen.set_char_bg(Console_X(x), Console_Y(y), (if is_wall(self, x, y) then dark_wall else dark_ground));
            end loop;
        end loop;
    end render;

    function is_wall(self : Map; x : X_Pos; y : Y_Pos) return Boolean is
    begin
        return self.terrain_map.is_walkable(x, y);
    end is_wall;

    procedure set_wall(self : in out Map; x : X_Pos; y : Y_Pos) is
    begin
        self.terrain_map.set_properties(x, y, transparent => False, walkable => False);
    end set_wall;

end Maps;