with Ada.Containers, Ada.Containers.Bounded_Vectors, Ada.Strings.Bounded;
with Libtcod.Color, Libtcod.Console;
with Maps;

package Actors is
    pragma Suppress (Tampering_Check); -- To enable Actor_Set to be appended to from within callbacks

    -- Types
    package Actor_Names is new Ada.Strings.Bounded.Generic_Bounded_Length(Max => 10);
    subtype Actor_Name is Actor_Names.Bounded_String;
    type Actor_Id is range 0 .. 100;
    type Actor is record
        x : Maps.X_Pos;
        y : Maps.Y_Pos;
        ch : Wide_Character;
        color : Libtcod.Color.RGB_Color;
        name : Actor_Name;
    end record;

    Player_Id : constant Actor_Id := Actor_Id'First;
    Invalid_Actor_Id : constant Actor_Id := Actor_Id'Last;

    subtype Monster_Id is Actor_Id range Actor_Id'Succ(Player_Id) .. Actor_Id'Pred(Invalid_Actor_Id);

    package Actor_Sets is new Ada.Containers.Bounded_Vectors(Index_Type => Actor_Id, Element_Type => Actor);
    subtype Actor_Set is Actor_Sets.Vector(Capacity => Ada.Containers.Count_Type(Actor_Id'Last - Actor_Id'First));

    -- Constructors
    function create_name(name : String) return Actor_Name is (Actor_Names.To_Bounded_String(name));
    function create(x : Maps.X_Pos; y : Maps.Y_Pos; ch : Wide_Character; name : Actor_Name; color : Libtcod.Color.RGB_Color) return Actor;

    -- Actions
    procedure update(self : Actor);
    procedure render(self : Actor; screen : in out Libtcod.Console.Screen);
    procedure attack(self : Actor; target : Actor);

    function to_string(name : Actor_Name) return String is (Actor_Names.To_String(name));

end Actors;