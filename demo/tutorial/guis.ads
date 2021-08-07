with Libtcod, Libtcod.Console, Libtcod.Color;
limited with Engines;
private with Ada.Strings.Bounded, Ada.Containers.Vectors;

package GUIs is

   use Libtcod;

   Panel_Height : constant := 7;
   Bar_Width : constant := 30;

   subtype RGB_Color is Libtcod.Color.RGB_Color;

   type GUI is tagged limited private;

   procedure render(self : in out GUI; main_screen : in out Console.Screen;
                    engine : in out Engines.Engine);

   procedure log(self : in out GUI; text : String; color : RGB_Color := Libtcod.Color.light_grey);

   function make_GUI(screen_w : Width) return GUI;

private

   package Log_Strings is new Ada.Strings.Bounded.Generic_Bounded_Length(Max => 40);
   subtype Log_String is Log_Strings.Bounded_String;

   type Log_Message is record
      text : Log_String;
      color : RGB_Color;
   end record;

   package Log_Message_Vectors is new Ada.Containers.Vectors(Index_Type   => Natural,
                                                             Element_Type => Log_Message);
   use type Ada.Containers.Count_Type;
   subtype Log_Message_Vector is Log_Message_Vectors.Vector;

   type GUI is tagged limited record
      screen : Libtcod.Console.Screen;
      log : Log_Message_Vector;
   end record;

end GUIs;
