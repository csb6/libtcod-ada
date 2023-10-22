with Libtcod.Console;
with Maps, Actors, GUIs;

package Engines is

    -- Types
    subtype Console_X is Libtcod.Console.X_Pos;
    subtype Console_Y is Libtcod.Console.Y_Pos;

    type Game_Status is (Idle, New_Turn, Inventory_Menu, Victory, Defeat);
    type Engine(map_width : Maps.X_Pos; map_height : Maps.Y_Pos) is tagged limited record
        map : Maps.Map(map_width, map_height);
        gui : GUIs.GUI;
        actor_list : Actors.Actor_Set;
        status : Game_Status := Idle;
    end record;

    -- Constructors
    function create(screen_width : Console_X; screen_height : Console_Y) return Engine;

    -- Properties
    function game_over(self : Engine) return Boolean is (self.status = Victory or else self.status = Defeat);
    function get_actor_at_pos(self : Engine; x : Maps.X_Pos; y : Maps.Y_Pos) return Actors.Actor_Id;
    function get_pickable_at_pos(self : Engine; x : Maps.X_Pos; y : Maps.Y_Pos) return Actors.Actor_Id;

    -- Actions
    procedure update(self : in out Engine);
    procedure render(self : in out Engine; main_screen : in out Libtcod.Console.Screen);

end Engines;