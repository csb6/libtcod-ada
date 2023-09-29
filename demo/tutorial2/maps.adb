with Libtcod.Color;

package body Maps is

    subtype Console_X is Libtcod.Console.X_Pos;
    subtype Console_Y is Libtcod.Console.Y_Pos;

    dark_wall : constant Libtcod.Color.RGB_Color := Libtcod.Color.make_RGB_color(0, 0, 100);
    dark_ground : constant Libtcod.Color.RGB_Color := Libtcod.Color.make_RGB_color(50, 50, 150);

    -- Subprogram definitions

    function create(w : Width; h : Height) return Map is
    begin
        return self : Map := (width => X_Pos(w), height => Y_Pos(h), terrain_map => Libtcod.Maps.make_map(w, h)) do
            self.terrain_map.set_properties_all(transparent => False, walkable => False);
        end return;
    end create;

    function is_walkable(self : Map; x : X_Pos; y : Y_Pos) return Boolean is (self.terrain_map.is_walkable(x, y));

    procedure render(self : in out Map; screen : in out Libtcod.Console.Screen) is
    begin
        for y in Y_Pos'First .. self.height loop
            for x in X_Pos'First .. self.width loop
                screen.set_char_bg(Console_X(x), Console_Y(y), (if is_walkable(self, x, y) then dark_wall else dark_ground));
            end loop;
        end loop;
    end render;

    procedure dig(self : in out Map; x1 : X_Pos; y1 : Y_Pos; x2 : X_Pos; y2 : Y_Pos) is
    begin
        for y in Y_Pos'Min(y1, y2) .. Y_Pos'Max(y1, y2) loop
            for x in X_Pos'Min(x1, x2) .. X_Pos'Max(x1, x2) loop
                self.terrain_map.set_properties(x, y, transparent => False, walkable => True);
            end loop;
        end loop;
    end dig;

end Maps;