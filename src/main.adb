with bresenham_h, console_h, fov_h, path_h, parser_h;
with Libtcod.Color, Ada.Text_IO;

procedure Main is
   color : Libtcod.Color.RGB_Color := Libtcod.Color.make_RGB_color(25, 255, 255);
begin
   Ada.Text_IO.Put_Line(Libtcod.Color.get_red(color)'Image);
end Main;
