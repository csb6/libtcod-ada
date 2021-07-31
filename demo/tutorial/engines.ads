with Actors, Ada.Containers.Vectors, Game_Maps, Libtcod.Maps;
with Libtcod, Libtcod.Console, Libtcod.Maps, Libtcod.Input;
use Actors, Game_Maps, Libtcod;

package Engines is

   type Game_Status is
     (Status_Idle, Status_New_Turn, Status_Victory, Status_Defeat);

   subtype Endgame_Status is Game_Status range Status_Victory .. Status_Defeat;

   subtype Valid_Key_Type is Input.Key_Type
     with Static_Predicate => Valid_Key_Type in Input.Arrow_Key_Type;

   type Engine(width : Maps.X_Pos; height : Maps.Y_Pos) is tagged limited record
      map : Game_Map(width, height);
      actor_list : Actor_Vector;
      player_id : Actor_Id;
      fov_radius : Maps.Radius;
      status : Game_Status;
      last_key_type : Valid_Key_Type;
   end record;

   function make_engine(w : Width; h : Height) return Engine;

   procedure update(self : in out Engine);

   procedure render(self : in out Engine; screen : in out Console.Screen);

   function can_walk(self : Engine; x : Maps.X_Pos; y : Maps.Y_Pos) return Boolean;

   function player(self : in out Engine) return Actor_Ref;

end Engines;
