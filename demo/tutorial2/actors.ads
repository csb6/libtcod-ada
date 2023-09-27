with Ada.Containers, Ada.Containers.Bounded_Vectors;
with Libtcod.Color, Libtcod.Console;
with Maps;

package Actors is

    -- Types
    type Actor is record
        x : Maps.X_Pos;
        y : Maps.Y_Pos;
        ch : Wide_Character;
        color : Libtcod.Color.RGB_Color;
    end record;

    type Actor_Id is range 0 .. 100;

    Player_Id : constant Actor_Id := Actor_Id'First;

    subtype Monster_Id is Actor_Id range Actor_Id'Succ(Player_Id) .. Actor_Id'Last;

    package Actor_Sets is new Ada.Containers.Bounded_Vectors(Index_Type => Actor_Id, Element_Type => Actor);
    subtype Actor_Set is Actor_Sets.Vector(Capacity => Ada.Containers.Count_Type(Actor_Id'Last - Actor_Id'First));

    -- Constructors
    function create(x : Maps.X_Pos; y : Maps.Y_Pos; ch : Wide_Character; color : Libtcod.Color.RGB_Color) return Actor;

    -- Actions
    procedure render(self : Actor; screen : in out Libtcod.Console.Screen);

end Actors;