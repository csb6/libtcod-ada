with bresenham_h, fov_h, path_h, parser_h;
with Libtcod.Color, Libtcod.Console, Ada.Text_IO, Ada.Exceptions, Libtcod.Input,
     Libtcod.Clipboard;
use type Libtcod.Color.RGB_Color, Libtcod.Input.Event_Type;

procedure Main is
   use Ada.Exceptions, Libtcod.Input;
   package IO renames Ada.Text_IO;

   root : Libtcod.Console.Root :=
     Libtcod.Console.init_root(w => 100, h => 100,
                               title => "Test",
                               fullscreen => False,
                               renderer => Libtcod.Console.Renderer_SDL2);
   screen : Libtcod.Console.Screen := Libtcod.Console.make_screen(100, 100);
   mouse : aliased Libtcod.Input.Mouse;
   key : aliased Libtcod.Input.Key;
   event : Event_Type;
begin
   while not Libtcod.Console.is_window_closed loop
      event := check_for_event(Event_Key_Press, mouse, key);
      if event = Event_Key_Press then
         case get_key_type(key) is
            when Function_Key_Type => IO.Put_Line("Function Key");
            when Digit_Key_Type => IO.Put_Line("Digit: " & get_char(key)'Image);
            when Key_Char => IO.Put_Line("Letter: " & get_char(key)'Image);
            when Key_Backspace => IO.Put_Line("Backspace");
            when others => null;
         end case;
      end if;
      Libtcod.Console.flush;
   end loop;
exception
   when err : others => IO.Put_Line(IO.Standard_Error, Exception_Information(err));
end Main;
