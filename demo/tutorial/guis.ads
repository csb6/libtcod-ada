with Libtcod, Libtcod.Console;
limited with Engines;

package GUIs is

   use Libtcod;

   Panel_Height : constant Height := 7;
   Bar_Width : constant Width := 30;

   type GUI is tagged limited private;

   procedure render(self : in out GUI; main_screen : in out Console.Screen;
                    engine : in out Engines.Engine);

   function make_GUI(screen_w : Width) return GUI;

private

   type GUI is tagged limited record
      screen : Libtcod.Console.Screen;
   end record;

end GUIs;
