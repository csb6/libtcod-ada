package body Actors is

    use Components;

    subtype Console_X is Libtcod.Console.X_Pos;
    subtype Console_Y is Libtcod.Console.Y_Pos;

    function create(id : Actor_Id; x : Maps.X_Pos; y : Maps.Y_Pos; ch : Wide_Character;
                    name : Actor_Name; color : Libtcod.Color.RGB_Color) return Actor is
    begin
        return self : Actor := (id, x, y, ch, color, name, blocks => True, attacker => <>, destructible => <>, ai => <>);
    end create;

    procedure update(self : in out Actor; engine : in out Engines.Engine) is
    begin
        AIs.update(self, engine);
    end update;

    procedure attack(self : in out Actor; target : in out Actor; engine : in out Engines.Engine) is
    begin
        Attackers.attack(self, target, engine);
    end attack;

    procedure render(self : Actor; screen : in out Libtcod.Console.Screen) is
    begin
        screen.put_char(Console_X(self.x), Console_Y(self.y), self.ch);
        screen.set_char_fg(Console_X(self.x), Console_Y(self.y), self.color);
    end render;

end Actors;