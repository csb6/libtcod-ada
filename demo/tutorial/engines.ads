with Actors, Components, Game_Maps, GUIs; use Actors, Components, Game_Maps;
with Libtcod, Libtcod.Console, Libtcod.Maps, Libtcod.Input; use Libtcod;

package Engines is

   type Game_Status is
     (Status_Idle, Status_New_Turn, Status_Victory, Status_Defeat);

   subtype Endgame_Status is Game_Status range Status_Victory .. Status_Defeat;

   subtype Valid_Key_Type is Input.Key_Type
     with Static_Predicate => Valid_Key_Type in Input.Arrow_Key_Type | Input.Key_Char;

   type Engine(map_width : Maps.X_Pos; map_height : Maps.Y_Pos) is tagged limited record
      map : Game_Map(map_width, map_height);
      main_screen : aliased Console.Screen;
      gui : GUIs.GUI;
      actor_list : Actor_Vector;
      player_id : Actor_Id;
      fov_radius : Maps.Radius;
      status : Game_Status;
      last_key_type : Valid_Key_Type;
      last_char : Character;
   end record;

   function make_engine(map_width : Width; map_height : Height;
                        screen_width : Width; screen_height : Height) return Engine;

   procedure update(self : in out Engine);

   procedure render(self : in out Engine);

   function can_walk(self : Engine; x : Maps.X_Pos; y : Maps.Y_Pos) return Boolean;

   function player(self : in out Engine) return Actor_Ref;

end Engines;
