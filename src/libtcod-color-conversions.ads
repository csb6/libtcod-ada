with color_h; use color_h;

package Libtcod.Color.Conversions is

   function To_TCOD_ColorRGB(color : RGB_Color) return TCOD_ColorRGB with Inline;
   function To_RGB_Color(color : TCOD_ColorRGB) return RGB_Color with Inline;
   
private
   
   function To_TCOD_ColorRGB(color : RGB_Color) return TCOD_ColorRGB is
     (TCOD_ColorRGB(color));
   
   function To_RGB_Color(color : TCOD_ColorRGB) return RGB_Color is
     (RGB_Color(color));

end Libtcod.Color.Conversions;
