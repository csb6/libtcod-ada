with Libtcod.Console;
with Maps, Actors;

package Engines is

    -- Types
    type Game_Status is (Idle, New_Turn, Victory, Defeat);
    type Engine(map_width : Maps.X_Pos; map_height : Maps.Y_Pos) is tagged limited record
        map : Maps.Map(map_width, map_height);
        actor_list : Actors.Actor_Set;
        status : Game_Status := Idle;
        last_living_actor_id : Actors.Actor_Id := Actors.Actor_Id'First;
    end record;

    -- Constructors
    function create(w : Maps.Width; h : Maps.Height) return Engine;

    -- Properties
    function game_over(self : Engine) return Boolean is (self.status = Victory or else self.status = Defeat);
    function get_actor_at_pos(self : Engine; x : Maps.X_Pos; y : Maps.Y_Pos) return Actors.Actor_Id;
    function is_walkable(self : Engine; x : Maps.X_Pos; y : Maps.Y_Pos) return Boolean;
    procedure move_to_back(self : in out Engine; id : Actors.Actor_Id);

    -- Actions
    procedure update(self : in out Engine);
    procedure render(self : in out Engine; screen : in out Libtcod.Console.Screen);

end Engines;