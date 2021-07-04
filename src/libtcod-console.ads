with Libtcod.Color, Libtcod.Input, Interfaces.C;
private with console_h, Ada.Finalization;
use Libtcod, Libtcod.Color;

package Libtcod.Console is

   -- Basic types --

   type Unicode_Char is new Interfaces.C.int;
   type Width is new Interfaces.C.int range 0 .. Interfaces.C.int'Last;
   type Height is new Interfaces.C.int range 0 .. Interfaces.C.int'Last;
   type X_Pos is new Interfaces.C.int range 0 .. Interfaces.C.int'Last;
   type Y_Pos is new Interfaces.C.int range 0 .. Interfaces.C.int'Last;
   type Fade is new Interfaces.C.int range 0 .. 255;

   Error : exception;

   type Renderer_Type is
     (Renderer_GLSL,
      Renderer_OPENGL,
      Renderer_SDL,
      Renderer_SDL2,
      Renderer_OpenGL2)
     with Convention => C;

   -- Background color blend modes
   type Background_Mode is
     (Background_None,
      Background_Set,
      Background_Multiply,
      Background_Lighten,
      Background_Darken,
      Background_Screen,
      Background_Color_Dodge,
      Background_Color_Burn,
      Background_Add,
      Background_Adda,
      Background_Burn,
      Background_Overlay,
      Background_Alpha,
      Background_Default)
     with Convention => C;

   -- Justification options
   type Alignment_Type is 
     (Alignment_Left,
      Alignment_Right,
      Alignment_Center)
     with Convention => C;

   -- Root (Manages global state)
   type Root is tagged limited private;

   -- Screen --
   type Screen is tagged limited private;

   -- Constructors --
   function init_root(w : Width; h : Height; title : String;
                      fullscreen : Boolean; renderer : Renderer_Type) return Root;
   function make_screen(w : Width; h : Height) return Screen;

   -- Operations --
   function is_window_closed return Boolean with Inline;

   procedure check_for_event(mouse : aliased out Input.Mouse;
                             key : aliased out Input.Key);
   procedure flush;

   function get_width(s : Screen) return Width with Inline;
   function get_height(s : Screen) return Height with Inline;

   function has_key_color(s : Screen) return Boolean with Inline;
   procedure set_key_color(s : in out Screen; key_color : RGB_Color) with Inline;
   function get_key_color(s : Screen) return RGB_Color with Inline;

   procedure set_default_fg(s : in out Screen; fg : RGB_Color) with Inline;
   function get_default_fg(s : Screen) return RGB_Color with Inline;

   procedure set_default_bg(s : in out Screen; bg : RGB_Color) with Inline;
   function get_default_bg(s : Screen) return RGB_Color with Inline;

   procedure clear(s : in out Screen) with Inline;
   procedure resize(s : in out Screen; w : Width; h : Height) with Inline;

   procedure put_char(s : in out Screen; x : X_Pos; y : Y_Pos; ch : Unicode_Char)
     with Inline;
   procedure put_char(s : in out Screen; x : X_Pos; y : Y_Pos; ch : Unicode_Char;
                      mode : Background_Mode) with Inline;
   procedure put_char(s : in out Screen; x : X_Pos; y : Y_Pos; ch : Unicode_Char;
                      fg_color, bg_color : RGB_Color) with Inline;

   function get_char(s : Screen; x : X_Pos; y : Y_Pos) return Unicode_Char with Inline;

   procedure set_char_fg(s : in out Screen; x : X_Pos; y : Y_Pos; color : RGB_Color)
     with Inline;
   function get_char_fg(s : Screen; x : X_Pos; y : Y_Pos) return RGB_Color with Inline;

   procedure set_char_bg(s : in out Screen; x : X_Pos; y : Y_Pos; color : RGB_Color;
                         mode : Background_Mode) with Inline;
   function get_char_bg(s : Screen; x : X_Pos; y : Y_Pos) return RGB_Color with Inline;

   procedure set_bg_mode(s : in out Screen; mode : Background_Mode) with Inline;
   function get_bg_mode(s : Screen) return Background_Mode with Inline;

   procedure set_alignment(s : in out Screen; alignment : Alignment_Type) with Inline;
   function get_alignment(s : Screen) return Alignment_Type with Inline;

   -- Global color fade
   procedure set_fade(val : Fade; color : RGB_Color) with Inline;
   function get_fade return Fade with Inline;
   function get_fading_color return RGB_Color with Inline;

private

   type Root is new Ada.Finalization.Limited_Controlled with null record;

   overriding procedure Finalize(self : in out Root);


   type Screen is new Ada.Finalization.Limited_Controlled with record
      data : access console_h.TCOD_Console;
   end record;
   subtype Limited_Controlled is Ada.Finalization.Limited_Controlled;

   overriding procedure Finalize(self : in out Screen);

end Libtcod.Console;
