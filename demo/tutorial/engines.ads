with Libtcod, Libtcod.Console, Libtcod.Maps; use Libtcod;
private with Ada.Containers.Vectors, Actors, Game_Maps, Libtcod.Maps;

package Engines is

   type Engine(<>) is tagged private;
   
   function make_engine(w : Libtcod.Width; h : Libtcod.Height) return Engine;
   
   procedure update(self : in out Engine);
   
   procedure render(self : Engine; screen : in out Console.Screen);
   
private
   use Actors, Game_Maps;
   
   type Engine(width : Maps.X_Pos; height : Maps.Y_Pos) is tagged record
      map : Game_Map(width, height);
      actor_list : Actor_Vector;
      player : Actor_Id;
   end record;

end Engines;
