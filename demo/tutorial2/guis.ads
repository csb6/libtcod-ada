with Ada.Containers.Bounded_Vectors, Ada.Strings.Unbounded;
with Libtcod.Console, Libtcod.Color;
limited with Engines;
with Components, Components.Inventories;

package GUIs is

    -- Constants

    Panel_Height : constant := 7;
    Bar_Width : constant := 20;
    Log_X : constant := Bar_Width + 2;
    Log_Height : constant := Panel_Height - 1;

    -- Types

    subtype Console_X is Libtcod.Console.X_Pos;
    subtype Console_Y is Libtcod.Console.Y_Pos;

    type Message is record
        text : Ada.Strings.Unbounded.Unbounded_String;
        color : Libtcod.Color.RGB_Color;
    end record;

    package Message_Logs is new Ada.Containers.Bounded_Vectors(Index_Type => Natural, Element_Type => Message);

    type GUI is tagged limited record
        bottom_panel, inventory : Libtcod.Console.Screen;
        msg_log : Message_Logs.Vector(Capacity => Log_Height);
    end record;

    -- Constructors

    function create(main_screen_width : Console_X) return GUI;

    -- Actions

    procedure log(self : in out GUI; text : String; color : Libtcod.Color.RGB_Color := Libtcod.Color.white);
    procedure render_health_bar(self : in out GUI; x : Console_X; y : Console_Y; value, max_value : Components.Health);
    procedure render_log(self : in out GUI; x : Console_X; y : Console_Y);
    procedure render_inventory(self : in out GUI; inventory : Components.Inventories.Inventory; engine : Engines.Engine);
    procedure clear(self : in out GUI);
    procedure blit_panel(self : GUI; main_screen : in out Libtcod.Console.Screen);
    procedure blit_inventory(self : GUI; main_screen : in out Libtcod.Console.Screen);

end GUIs;