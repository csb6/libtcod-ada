with bresenham_h, fov_h, path_h, parser_h;
with Libtcod.Color, Libtcod.Console, Ada.Text_IO, Ada.Exceptions, Libtcod.Input,
     Libtcod.Maps.FOV, Libtcod.Maps.Paths, Libtcod.Clipboard, Libtcod.Maps.Lines;
use type Libtcod.Color.RGB_Color, Libtcod.Input.Event_Type;

procedure Keys is
   use Ada.Exceptions, Libtcod, Libtcod.Input;
   package IO renames Ada.Text_IO;

   context : Console.Context := Console.make_context(w => 100, h => 100, title => "Test");
   screen : Console.Screen := Console.make_screen(100, 100);
   mouse : aliased Input.Mouse;
   key : aliased Input.Key;
   event : Event_Type;
   map : Maps.Map := Maps.make_map(100, 100);
   path : Maps.Paths.Path := Maps.Paths.make_path(map, diagonal_cost => 1.0);
   status : Boolean;
   x : aliased Maps.X_Pos;
   y : aliased Maps.Y_Pos;
begin
   map.set_properties_all(walkable => True, transparent => False);
   status := Maps.Paths.compute(path, 0, 0, 10, 99);
   while Maps.Paths.walk(path, x, y) loop
      IO.Put_Line(x'Image & " " & y'Image);
   end loop;

   while not Console.is_window_closed loop
      event := check_for_event(Event_Key_Press, mouse, key);
      screen.put_char(x => 4, y => 25, ch => '@');
      if event = Event_Key_Press then
         case get_key_type(key) is
            when Function_Key_Type => IO.Put_Line("Function Key");
            when Key_Backspace => IO.Put_Line("Backspace");
            when Key_Text =>
               case get_char(key) is
                  when '0' .. '9' => IO.Put_Line("Digit: " & get_char(key)'Image);
                  when 'a' .. 'z' | 'A' .. 'Z' => IO.Put_Line("Letter: " & get_char(key)'Image);
                  when others => IO.Put_Line("Character: " & get_char(key)'Image);
               end case;
            when others => null;
         end case;
      end if;
      context.present(screen);
   end loop;
exception
   when err : others => IO.Put_Line(IO.Standard_Error, Exception_Information(err));
end Keys;
