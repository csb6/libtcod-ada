with bresenham_h, fov_h, path_h, parser_h;
with Libtcod.Color, Libtcod.Console, Ada.Text_IO, Ada.Exceptions, Libtcod.Input,
     Libtcod.Clipboard;
use type Libtcod.Color.RGB_Color;

procedure Main is
   package IO renames Ada.Text_IO;

   root : Libtcod.Console.Root :=
     Libtcod.Console.init_root(w => 100, h => 100,
                               title => "Test",
                               fullscreen => False,
                               renderer => Libtcod.Console.Renderer_SDL2);
   screen : Libtcod.Console.Screen := Libtcod.Console.make_screen(100, 100);
   mouse : aliased Libtcod.Input.Mouse;
   key : aliased Libtcod.Input.Key;

   use Ada.Exceptions;
begin
   Libtcod.Clipboard.set("Hello there!");
   IO.Put_Line(Libtcod.Clipboard.get);

   while not Libtcod.Console.is_window_closed loop
      case Libtcod.Input.check_for_event(mouse, key) is
         when others => null;
      end case;
      Libtcod.Console.flush;
   end loop;
exception
   when err : others => IO.Put_Line(IO.Standard_Error, Exception_Information(err));
end Main;
