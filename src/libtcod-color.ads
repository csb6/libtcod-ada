with Interfaces.C;
private with color_h;

package Libtcod.Color is

   type RGB_Component is new Interfaces.C.unsigned_char;
   type Alpha is new Interfaces.C.unsigned_char;
   type Hue is new Interfaces.C.C_float range 0.0 .. 360.0;
   type Saturation is new Interfaces.C.C_float range 0.0 .. 1.0;
   type Value is new Interfaces.C.C_float range 0.0 .. 1.0;
   type Color_Factor is new Interfaces.C.C_float;
   

   -- A three channel color struct
   type RGB_Color is private;
   
   type Color_Index is new Interfaces.C.int;
   type Color_Array is array(Color_Index range <>) of aliased RGB_Color
     with Convention => C, Dynamic_Predicate => Color_Array'Length > 0;
   type Color_Index_Array is array(Color_Index range <>) of aliased Color_Index
     with Convention => C, Dynamic_Predicate => Color_Index_Array'Length > 0;

   
   -- Constructors --
   
   function make_RGB_color(r, g, b : RGB_Component) return RGB_Color;

   function make_HSV_color(h : Hue; s : Saturation; v : Value) return RGB_Color;


   -- Setters/getters --
   procedure set_RGB(color : in out RGB_Color; r, g, b : RGB_Component);

   procedure set_red(color : in out RGB_Color; r : RGB_Component)
     with Inline;
   function get_red(color : RGB_Color) return RGB_Component
     with Inline;

   procedure set_green(color : in out RGB_Color; g : RGB_Component)
     with Inline;
   function get_green(color : RGB_Color) return RGB_Component
     with Inline;

   procedure set_blue(color : in out RGB_Color; b : RGB_Component)
     with Inline;
   function get_blue(color : RGB_Color) return RGB_Component
     with Inline;


   procedure set_HSV(color : aliased in out RGB_Color;
                     h : Hue; s : Saturation; v : Value);

   procedure set_hue(color : aliased in out RGB_Color; h : Hue);
   function get_hue(color : RGB_Color) return Hue;
   
   procedure set_saturation(color : aliased in out RGB_Color; s : Saturation);
   function get_saturation(color : RGB_Color) return Saturation;
   
   procedure set_value(color : aliased in out RGB_Color; v : Value);
   function get_value(color : RGB_Color) return Value;

   
   -- Operators --
   
   function "="(a, b : RGB_Color) return Boolean;
   function "-"(a, b : RGB_Color) return RGB_Color;
   function "+"(a, b : RGB_Color) return RGB_Color;
   function "*"(a, b : RGB_Color) return RGB_Color;
   function "*"(a : RGB_Color; scalar : Color_Factor) return RGB_Color;
   
   
   -- Operations --
   
   function interpolate(a, b : RGB_Color; coeff : Color_Factor) return RGB_Color;
   procedure shift_hue(color : aliased in out RGB_Color; shift : Hue);
   procedure scale_HSV(color : aliased in out RGB_Color;
                       sat_coeff : Saturation; value_coeff : Value);
   
   -- Constants --

   -- grey levels  
   black : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_black";

   darkest_grey : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darkest_grey";

   darker_grey : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darker_grey";

   dark_grey : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_dark_grey";

   grey : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_grey";

   light_grey : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_light_grey";

   lighter_grey : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lighter_grey";

   lightest_grey : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lightest_grey";

   darkest_gray : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darkest_gray";

   darker_gray : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darker_gray";

   dark_gray : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_dark_gray";

   gray : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_gray";

   light_gray : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_light_gray";

   lighter_gray : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lighter_gray";

   lightest_gray : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lightest_gray";

   white : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_white";

   -- sepia  
   darkest_sepia : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darkest_sepia";

   darker_sepia : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darker_sepia";

   dark_sepia : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_dark_sepia";

   sepia : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_sepia";

   light_sepia : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_light_sepia";

   lighter_sepia : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lighter_sepia";

   lightest_sepia : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lightest_sepia";

   -- standard colors
   red : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_red";

   flame : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_flame";

   orange : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_orange";

   amber : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_amber";

   yellow : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_yellow";

   lime : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lime";

   chartreuse : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_chartreuse";

   green : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_green";

   sea : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_sea";

   turquoise : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_turquoise";

   cyan : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_cyan";

   sky : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_sky";

   azure : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_azure";

   blue : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_blue";

   han : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_han";

   violet : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_violet";

   purple : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_purple";

   fuchsia : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_fuchsia";

   magenta : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_magenta";

   pink : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_pink";

   crimson : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_crimson";

   -- dark colors  
   dark_red : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_dark_red";

   dark_flame : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_dark_flame";

   dark_orange : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_dark_orange";

   dark_amber : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_dark_amber";

   dark_yellow : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_dark_yellow";

   dark_lime : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_dark_lime";

   dark_chartreuse : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_dark_chartreuse";

   dark_green : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_dark_green";

   dark_sea : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_dark_sea";

   dark_turquoise : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_dark_turquoise";

   dark_cyan : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_dark_cyan";

   dark_sky : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_dark_sky";

   dark_azure : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_dark_azure";

   dark_blue : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_dark_blue";

   dark_han : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_dark_han";

   dark_violet : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_dark_violet";

   dark_purple : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_dark_purple";

   dark_fuchsia : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_dark_fuchsia";

   dark_magenta : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_dark_magenta";

   dark_pink : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_dark_pink";

   dark_crimson : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_dark_crimson";

   -- darker colors  
   darker_red : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darker_red";

   darker_flame : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darker_flame";

   darker_orange : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darker_orange";

   darker_amber : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darker_amber";

   darker_yellow : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darker_yellow";

   darker_lime : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darker_lime";

   darker_chartreuse : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darker_chartreuse";

   darker_green : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darker_green";

   darker_sea : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darker_sea";

   darker_turquoise : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darker_turquoise";

   darker_cyan : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darker_cyan";

   darker_sky : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darker_sky";

   darker_azure : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darker_azure";

   darker_blue : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darker_blue";

   darker_han : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darker_han";

   darker_violet : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darker_violet";

   darker_purple : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darker_purple";

   darker_fuchsia : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darker_fuchsia";

   darker_magenta : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darker_magenta";

   darker_pink : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darker_pink";

   darker_crimson : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darker_crimson";

   -- darkest colors  
   darkest_red : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darkest_red";

   darkest_flame : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darkest_flame";

   darkest_orange : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darkest_orange";

   darkest_amber : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darkest_amber";

   darkest_yellow : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darkest_yellow";

   darkest_lime : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darkest_lime";

   darkest_chartreuse : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darkest_chartreuse";

   darkest_green : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darkest_green";

   darkest_sea : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darkest_sea";

   darkest_turquoise : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darkest_turquoise";

   darkest_cyan : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darkest_cyan";

   darkest_sky : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darkest_sky";

   darkest_azure : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darkest_azure";

   darkest_blue : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darkest_blue";

   darkest_han : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darkest_han";

   darkest_violet : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darkest_violet";

   darkest_purple : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darkest_purple";

   darkest_fuchsia : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darkest_fuchsia";

   darkest_magenta : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darkest_magenta";

   darkest_pink : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darkest_pink";

   darkest_crimson : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_darkest_crimson";

   -- light colors  
   light_red : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_light_red";

   light_flame : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_light_flame";

   light_orange : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_light_orange";

   light_amber : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_light_amber";

   light_yellow : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_light_yellow";

   light_lime : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_light_lime";

   light_chartreuse : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_light_chartreuse";

   light_green : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_light_green";

   light_sea : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_light_sea";

   light_turquoise : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_light_turquoise";

   light_cyan : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_light_cyan";

   light_sky : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_light_sky";

   light_azure : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_light_azure";

   light_blue : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_light_blue";

   light_han : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_light_han";

   light_violet : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_light_violet";

   light_purple : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_light_purple";

   light_fuchsia : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_light_fuchsia";

   light_magenta : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_light_magenta";

   light_pink : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_light_pink";

   light_crimson : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_light_crimson";

   -- lighter colors  
   lighter_red : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lighter_red";

   lighter_flame : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lighter_flame";

   lighter_orange : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lighter_orange";

   lighter_amber : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lighter_amber";

   lighter_yellow : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lighter_yellow";

   lighter_lime : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lighter_lime";

   lighter_chartreuse : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lighter_chartreuse";

   lighter_green : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lighter_green";

   lighter_sea : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lighter_sea";

   lighter_turquoise : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lighter_turquoise";

   lighter_cyan : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lighter_cyan";

   lighter_sky : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lighter_sky";

   lighter_azure : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lighter_azure";

   lighter_blue : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lighter_blue";

   lighter_han : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lighter_han";

   lighter_violet : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lighter_violet";

   lighter_purple : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lighter_purple";

   lighter_fuchsia : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lighter_fuchsia";

   lighter_magenta : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lighter_magenta";

   lighter_pink : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lighter_pink";

   lighter_crimson : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lighter_crimson";

   -- lightest colors  
   lightest_red : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lightest_red";

   lightest_flame : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lightest_flame";

   lightest_orange : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lightest_orange";

   lightest_amber : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lightest_amber";

   lightest_yellow : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lightest_yellow";

   lightest_lime : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lightest_lime";

   lightest_chartreuse : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lightest_chartreuse";

   lightest_green : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lightest_green";

   lightest_sea : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lightest_sea";

   lightest_turquoise : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lightest_turquoise";

   lightest_cyan : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lightest_cyan";

   lightest_sky : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lightest_sky";

   lightest_azure : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lightest_azure";

   lightest_blue : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lightest_blue";

   lightest_han : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lightest_han";

   lightest_violet : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lightest_violet";

   lightest_purple : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lightest_purple";

   lightest_fuchsia : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lightest_fuchsia";

   lightest_magenta : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lightest_magenta";

   lightest_pink : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lightest_pink";

   lightest_crimson : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_lightest_crimson";

   -- desaturated  
   desaturated_red : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_desaturated_red";

   desaturated_flame : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_desaturated_flame";

   desaturated_orange : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_desaturated_orange";

   desaturated_amber : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_desaturated_amber";

   desaturated_yellow : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_desaturated_yellow";

   desaturated_lime : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_desaturated_lime";

   desaturated_chartreuse : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_desaturated_chartreuse";

   desaturated_green : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_desaturated_green";

   desaturated_sea : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_desaturated_sea";

   desaturated_turquoise : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_desaturated_turquoise";

   desaturated_cyan : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_desaturated_cyan";

   desaturated_sky : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_desaturated_sky";

   desaturated_azure : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_desaturated_azure";

   desaturated_blue : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_desaturated_blue";

   desaturated_han : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_desaturated_han";

   desaturated_violet : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_desaturated_violet";

   desaturated_purple : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_desaturated_purple";

   desaturated_fuchsia : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_desaturated_fuchsia";

   desaturated_magenta : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_desaturated_magenta";

   desaturated_pink : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_desaturated_pink";

   desaturated_crimson : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_desaturated_crimson";

   -- metallic  
   brass : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_brass";

   copper : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_copper";

   gold : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_gold";

   silver : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_silver";

   -- miscellaneous  
   celadon : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_celadon";

   peach : aliased constant RGB_Color
     with Import => True, 
     Convention => C, 
     External_Name => "TCOD_peach";
   
private
   
   type RGB_Color is new color_h.TCOD_ColorRGB;

end Libtcod.Color;
