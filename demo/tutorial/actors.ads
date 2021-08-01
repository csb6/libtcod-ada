limited with Engines;
with Ada.Containers.Vectors, Ada.Strings.Bounded;
with Libtcod.Maps, Libtcod.Color, Libtcod.Console;
with Components, Components.Destructibles, Components.Attackers, Components.AIs;
use Components, Components.Destructibles, Components.Attackers, Components.AIs;
use Libtcod;

package Actors is

   subtype RGB_Color is Libtcod.Color.RGB_Color;

   type Actor_Id is range 0 .. 100;

   package Actor_Names is new Ada.Strings.Bounded.Generic_Bounded_Length(Max => 16);
   subtype Actor_Name is Actor_Names.Bounded_String;

   type Actor is tagged record
      name : Actor_Name;
      x : aliased Maps.X_Pos;
      y : aliased Maps.Y_Pos;
      ch : Wide_Character;
      color : RGB_Color;
      blocks : Boolean;
      -- Components
      attacker : access Attackers.Attacker;
      destructible : access Destructibles.Destructible'Class;
      ai : access AIs.AI'Class;
   end record;

   -- Properties

   function get_name(self : Actor) return String with Inline;

   function is_attacker(self : Actor) return Boolean is (self.attacker /= null)
     with Inline;
   function is_destructible(self : Actor) return Boolean is (self.destructible /= null)
     with Inline;
   function is_ai(self : Actor) return Boolean is (self.ai /= null) with Inline;

   -- Operations

   procedure render(self : Actor; screen : in out Console.Screen);
   procedure update(self : in out Actor; engine : in out Engines.Engine);

   -- Constructors

   function make_player(x : Maps.X_Pos; y : Maps.Y_Pos; ch : Wide_Character;
                        name : String; color : RGB_Color;
                        defense_stat : Defense;
                        power, hp, max_hp : Health) return Actor
     with Pre => name'Length <= Actor_Names.Max_Length;

   function make_monster(x : Maps.X_Pos; y : Maps.Y_Pos; ch : Wide_Character;
                         name : String; color : RGB_Color;
                         defense_stat : Defense;
                         power, hp, max_hp : Health) return Actor
     with Pre => name'Length <= Actor_Names.Max_Length;

   -- Container

   package Actor_Vectors is new Ada.Containers.Vectors(Index_Type => Actor_Id,
                                                       Element_Type => Actor);
   subtype Actor_Vector is Actor_Vectors.Vector;
   subtype Actor_Ref is Actor_Vectors.Reference_Type;

end Actors;
