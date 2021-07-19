with Ada.Containers.Vectors, Ada.Strings.Bounded, Libtcod, Libtcod.Maps, Libtcod.Color,
     Libtcod.Console;
use Libtcod, Libtcod.Color;

package Actors is
   subtype RGB_Color is Libtcod.Color.RGB_Color;

   type Actor_Id is range 0 .. 100;

   package Actor_Names is new Ada.Strings.Bounded.Generic_Bounded_Length(Max => 16);
   subtype Actor_Name is Actor_Names.Bounded_String;

   type Actor is record
      name : Actor_Name;
      pos : Maps.Point;
      ch : Wide_Character;
      color : RGB_Color;
   end record;

   package Actor_Vectors is new Ada.Containers.Vectors(Index_Type => Actor_Id,
                                                       Element_Type => Actor);
   subtype Actor_Vector is Actor_Vectors.Vector;
   subtype Actor_Ref is Actor_Vectors.Reference_Type;

   function make_actor(x : Maps.X_Pos; y : Maps.Y_Pos; ch : Wide_Character;
                       name : String; color : RGB_Color) return Actor
     with Pre => name'Length <= Actor_Names.Max_Length;

   -- Properties

   function name(self : Actor) return String with Inline;

   -- Operations

   procedure render(self : Actor; screen : in out Console.Screen);

   procedure update(self : in out Actor);

end Actors;
