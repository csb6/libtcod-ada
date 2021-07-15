with bresenham_h, fov_h, path_h, parser_h;
with Libtcod.Color, Libtcod.Console, Ada.Text_IO, Ada.Exceptions, Libtcod.Input,
     Libtcod.Maps.FOV, Libtcod.Maps.Paths, Libtcod.Clipboard, Libtcod.Maps.Lines;
use type Libtcod.Color.RGB_Color, Libtcod.Input.Event_Type;

procedure Keys is
   use Ada.Exceptions, Libtcod.Input;
   package IO renames Ada.Text_IO;

   context : Libtcod.Console.Context :=
     Libtcod.Console.make_context(w => 100, h => 100, title => "Test");
   screen : Libtcod.Console.Screen := Libtcod.Console.make_screen(100, 100);
   mouse : aliased Libtcod.Input.Mouse;
   key : aliased Libtcod.Input.Key;
   event : Event_Type;
   map : Libtcod.Maps.Map := Libtcod.Maps.make_map(100, 100);
   path : Libtcod.Maps.Paths.Path := Libtcod.Maps.Paths.make_path(map, diagonal_cost => 1.0);
   status : Boolean;
   point : Libtcod.Maps.Point;
begin
   map.set_properties_all(walkable => True, transparent => False);
   status := Libtcod.Maps.Paths.compute(path, 0, 0, 10, 99);
   while Libtcod.Maps.Paths.walk(path, point.x, point.y) loop
      IO.Put_Line(point.x'Image & " " & point.y'Image);
   end loop;

   while not Libtcod.Console.is_window_closed loop
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
