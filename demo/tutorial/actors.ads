with Libtcod, Libtcod.Maps, Libtcod.Color, Libtcod.Console; use Libtcod, Libtcod.Color;

package Actors is
   subtype RGB_Color is Libtcod.Color.RGB_Color;
   
   type Actor_Id is range 0 .. 100;

   type Actor is record
      pos : Maps.Point;
      ch : Wide_Character;
      color : RGB_Color;
   end record;
   
   function make_actor(x : Maps.X_Pos; y : Maps.Y_Pos; ch : Wide_Character;
                       color : RGB_Color) return Actor;
   
   procedure render(self : Actor; screen : in out Console.Screen);

end Actors;
