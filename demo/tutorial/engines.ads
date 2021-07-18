with Libtcod, Libtcod.Console, Libtcod.Maps;
private with Ada.Containers.Vectors, Actors, Game_Maps, Libtcod.Maps;

package Engines is
   use Libtcod;

   type Engine(<>) is tagged limited private;

   function make_engine(w : Width; h : Height) return Engine;

   procedure update(self : in out Engine);

   procedure render(self : in out Engine; screen : in out Console.Screen);

private
   use Actors, Game_Maps;

   type Engine(width : Maps.X_Pos; height : Maps.Y_Pos) is tagged limited record
      map : Game_Map(width, height);
      actor_list : Actor_Vector;
      player_id : Actor_Id;
      compute_fov : Boolean;
      fov_radius : Maps.Radius;
   end record;

end Engines;
