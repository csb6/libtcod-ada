limited with Engines;
with Ada.Containers.Vectors, Ada.Strings.Bounded, Ada.Containers.Indefinite_Holders;
with Libtcod, Libtcod.Maps, Libtcod.Color, Libtcod.Console;
with Components, Components.Destructibles, Components.Attackers, Components.AIs;
use Components, Components.Destructibles, Components.Attackers, Components.AIs;
use Libtcod;

package Actors is

   subtype RGB_Color is Libtcod.Color.RGB_Color;

   type Actor_Id is range 0 .. 100;

   package Actor_Names is new Ada.Strings.Bounded.Generic_Bounded_Length(Max => 16);
   subtype Actor_Name is Actor_Names.Bounded_String;

   -- Component holders

   package Attacker_Holders is new Ada.Containers.Indefinite_Holders(Attacker'Class);
   subtype Attacker_Holder is Attacker_Holders.Holder;
   subtype Attacker_Ref is Attacker_Holders.Reference_Type;

   package Destructible_Holders is new Ada.Containers.Indefinite_Holders(Destructible'Class);
   subtype Destructible_Holder is Destructible_Holders.Holder;
   subtype Destructible_Ref is Destructible_Holders.Reference_Type;

   package AI_Holders is new Ada.Containers.Indefinite_Holders(AI'Class);
   subtype AI_Holder is AI_Holders.Holder;
   subtype AI_Ref is AI_Holders.Reference_Type;

   type Actor is tagged record
      name : Actor_Name;
      x : aliased Maps.X_Pos;
      y : aliased Maps.Y_Pos;
      ch : Wide_Character;
      color : RGB_Color;
      blocks : Boolean;
      -- Components
      attacker_h : Attacker_Holder;
      destructible_h : Destructible_Holder;
      ai_h : AI_Holder;
   end record;

   -- Properties

   function get_name(self : Actor) return String with Inline;
   function attacker(self : in out Actor) return Attacker_Ref is
     (self.attacker_h.Reference) with Inline;
   function destructible(self : in out Actor) return Destructible_Ref is
     (self.destructible_h.Reference) with Inline;
   function ai(self : in out Actor) return AI_Ref is (self.ai_h.Reference) with Inline;

   function is_attacker(self : Actor) return Boolean is (not self.attacker_h.Is_Empty)
     with Inline;
   function is_destructible(self : Actor) return Boolean is (not self.destructible_h.Is_Empty)
     with Inline;
   function is_ai(self : Actor) return Boolean is (not self.ai_h.Is_Empty) with Inline;

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
