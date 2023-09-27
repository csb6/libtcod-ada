with Libtcod.Console;
with Maps, Actors;

package Engines is

    -- Types
    type Engine(map_width : Maps.X_Pos; map_height : Maps.Y_Pos) is tagged limited private;

    -- Constructors
    function create(w : Maps.Width; h : Maps.Height) return Engine;

    -- Properties
    function is_running(self : Engine) return Boolean;

    -- Actions
    procedure update(self : in out Engine);

    procedure render(self : in out Engine; screen : in out Libtcod.Console.Screen);

private

    type Engine(map_width : Maps.X_Pos; map_height : Maps.Y_Pos) is tagged limited record
        map : Maps.Map(map_width, map_height);
        actor_list : Actors.Actor_Set;
        running : Boolean := True;
    end record;

    function is_running(self : Engine) return Boolean is (self.running);

end Engines;