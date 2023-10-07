with Libtcod.Color, Libtcod.Maps.FOV;

package body Maps is

    subtype Console_X is Libtcod.Console.X_Pos;
    subtype Console_Y is Libtcod.Console.Y_Pos;

    dark_wall : constant Libtcod.Color.RGB_Color := Libtcod.Color.make_RGB_color(0, 0, 100);
    dark_ground : constant Libtcod.Color.RGB_Color := Libtcod.Color.make_RGB_color(50, 50, 150);
    light_wall : constant Libtcod.Color.RGB_Color := Libtcod.Color.make_RGB_color(130,110,50);
    light_ground : constant Libtcod.Color.RGB_Color := Libtcod.Color.make_RGB_color(200,180,50);

    -- FOV constants
    FOV_Radius : constant := 10;

    -- Subprogram definitions

    function create(w : Width; h : Height) return Map is
    begin
        return self : Map := (width => X_Pos(w), height => Y_Pos(h), terrain_map => Libtcod.Maps.make_map(w, h), explored => <>) do
            self.terrain_map.set_properties_all(transparent => False, walkable => False);
        end return;
    end create;

    function is_wall(self : Map; x : X_Pos; y : Y_Pos) return Boolean is (not self.terrain_map.is_walkable(x, y));

    function is_explored(self : Map; x : X_Pos; y : Y_Pos) return Boolean is (self.explored(y, x));

    function in_fov(self : in out Map; x : X_Pos; y : Y_Pos) return Boolean is
    begin
        if Libtcod.Maps.FOV.in_FOV(self.terrain_map, x, y) then
            self.explored(y, x) := True;
            return True;
        end if;
        return False;
    end in_fov;

    procedure render(self : in out Map; screen : in out Libtcod.Console.Screen) is
        bg_color : Libtcod.Color.RGB_Color;
    begin
        for y in Y_Pos'First .. self.height loop
            for x in X_Pos'First .. self.width loop
                if in_fov(self, x, y) then
                    bg_color := (if is_wall(self, x, y) then light_wall else light_ground);
                elsif is_explored(self, x, y) then
                    bg_color := (if is_wall(self, x, y) then dark_wall else dark_ground);
                else
                    bg_color := dark_wall;
                end if;
                screen.set_char_bg(Console_X(x), Console_Y(y), bg_color);
            end loop;
        end loop;
    end render;

    procedure dig(self : in out Map; x1 : X_Pos; y1 : Y_Pos; x2 : X_Pos; y2 : Y_Pos) is
    begin
        for y in Y_Pos'Min(y1, y2) .. Y_Pos'Max(y1, y2) loop
            for x in X_Pos'Min(x1, x2) .. X_Pos'Max(x1, x2) loop
                self.terrain_map.set_properties(x, y, transparent => True, walkable => True);
            end loop;
        end loop;
    end dig;

    procedure compute_fov(self : in out Map; pov_x : X_Pos; pov_y : Y_Pos) is
    begin
        Libtcod.Maps.FOV.compute_FOV(self.terrain_map, pov_x, pov_y, max_radius => FOV_Radius);
    end compute_fov;

end Maps;