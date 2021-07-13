with Libtcod, Libtcod.Console; use Libtcod;
private with Ada.Containers.Vectors, Actors, Game_Maps, Libtcod.Maps;

package Engines is

   type Engine(<>) is tagged private;
   
   function make_engine(w : Libtcod.Width; h : Libtcod.Height) return Engine;
   
   procedure update(self : in out Engine);
   
   procedure render(self : Engine; screen : in out Console.Screen);
   
private
   use Actors, Game_Maps;
   
   package Actor_Vectors is new Ada.Containers.Vectors(Index_Type => Actor_Id,
                                                       Element_Type => Actor);
   subtype Actor_Vector is Actor_Vectors.Vector;
   subtype Actor_Ref is Actor_Vectors.Reference_Type;
   
   type Engine(width : Maps.X_Pos; height : Maps.Y_Pos) is tagged record
      map : Game_Map(width, height);
      actor_list : Actor_Vector;
      player : Actor_Id;
   end record;

end Engines;
