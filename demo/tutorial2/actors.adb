package body Actors is

    subtype Console_X is Libtcod.Console.X_Pos;
    subtype Console_Y is Libtcod.Console.Y_Pos;

    function create(x : Maps.X_Pos; y : Maps.Y_Pos; ch : Wide_Character; color : Libtcod.Color.RGB_Color) return Actor is
    begin
        return self : Actor := (x, y, ch, color);
    end create;

    procedure render(self : Actor; screen : in out Libtcod.Console.Screen) is
    begin
        screen.put_char(Console_X(self.x), Console_Y(self.y), self.ch);
        screen.set_char_fg(Console_X(self.x), Console_Y(self.y), self.color);
    end render;

end Actors;