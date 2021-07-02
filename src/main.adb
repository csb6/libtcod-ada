with bresenham_h, console_h, fov_h, path_h, parser_h;
with Libtcod.Color, Ada.Text_IO;
use type Libtcod.Color.RGB_Color;

procedure Main is
   color : Libtcod.Color.RGB_Color := Libtcod.Color.make_RGB_color(25, 255, 5);
begin
   Ada.Text_IO.Put_Line(Libtcod.Color.get_blue(color)'Image);
   color := color + color;
   Ada.Text_IO.Put_Line(Libtcod.Color.get_blue(color)'Image);
end Main;
