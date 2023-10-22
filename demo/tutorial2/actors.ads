with Ada.Containers, Ada.Containers.Bounded_Vectors, Ada.Strings.Bounded;
with Libtcod.Color, Libtcod.Console;
limited with Engines;
with Actor_Ids, Maps, Components.Destructibles, Components.Attackers, Components.AIs, Components.Pickables,
    Components.Inventories;

package Actors is
    pragma Suppress (Tampering_Check); -- To enable Actor_Set to be appended to from within callbacks

    -- Types
    package Actor_Names is new Ada.Strings.Bounded.Generic_Bounded_Length(Max => 16);
    subtype Actor_Name is Actor_Names.Bounded_String;
    function create_name(name : String) return Actor_Name is (Actor_Names.To_Bounded_String(name));
    function name_to_string(name : Actor_Name) return String is (Actor_Names.To_String(name));
    package Name_Operators is
        function "&"(name : Actor_Name; s : String) return String is (Actor_Names.To_String(name) & s);
        function "&"(s : String; name : Actor_Name) return String is (s & Actor_Names.To_String(name));
        function "&"(c : Character; name : Actor_Name) return String is (c & Actor_Names.To_String(name));
        function "&"(a, b : Actor_Name) return Actor_Name is (Actor_Names."&"(a, b));
    end;

    subtype Actor_Id is Actor_Ids.Actor_Id;
    Player_Id : Actor_Id renames Actor_Ids.Player_Id;
    Invalid_Actor_Id : Actor_Id renames Actor_Ids.Invalid_Actor_Id;
    subtype Monster_Id is Actor_Ids.Monster_Id;
    use type Actor_Id;

    type Actor is record
        id : Actor_Id;
        x : Maps.X_Pos;
        y : Maps.Y_Pos;
        ch : Wide_Character;
        color : Libtcod.Color.RGB_Color;
        name : Actor_Name;
        blocks : Boolean;

        -- Components
        destructible : access Components.Destructibles.Destructible;
        attacker : access Components.Attackers.Attacker;
        ai : access Components.AIs.AI;
        pickable : access Components.Pickables.Pickable;
        inventory : access Components.Inventories.Inventory;
    end record;

    package Actor_Sets is new Ada.Containers.Bounded_Vectors(Index_Type => Actor_Id, Element_Type => Actor);
    subtype Actor_Set is Actor_Sets.Vector(Capacity => Ada.Containers.Count_Type(Actor_Id'Last - Actor_Id'First));

    -- Constructors
    function create(id : Actor_Id; x : Maps.X_Pos; y : Maps.Y_Pos; ch : Wide_Character;
                    name : Actor_Name; color : Libtcod.Color.RGB_Color) return Actor;

    -- Actions
    procedure update(self : in out Actor; engine : in out Engines.Engine);
    procedure attack(self : in out Actor; target : in out Actor; engine : in out Engines.Engine);
    procedure render(self : Actor; screen : in out Libtcod.Console.Screen);

    procedure add_player(self : in out Engines.Engine);
    procedure add_orc(self : in out Engines.Engine; x : Maps.X_Pos; y : Maps.Y_Pos);
    procedure add_troll(self : in out Engines.Engine; x : Maps.X_Pos; y : Maps.Y_Pos);
    procedure add_item(self : in out Engines.Engine; x : Maps.X_Pos; y : Maps.Y_Pos);

end Actors;