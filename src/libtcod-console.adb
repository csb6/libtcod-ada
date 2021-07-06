with Ada.Unchecked_Conversion, Interfaces.C.Strings, Interfaces.C.Extensions;
with Libtcod.Color.Conversions;
with color_h, error_h, console_init_h, console_types_h, console_etc_h;
use Libtcod.Color.Conversions, color_h, console_init_h, console_etc_h, console_types_h;

package body Libtcod.Console is
   use Interfaces.C, Interfaces.C.Extensions, console_h;

   function Background_Mode_To_Bgflag is new Ada.Unchecked_Conversion
     (Source => Background_Mode, Target => TCOD_bkgnd_flag_t);
   function Bgflag_to_Background_Mode is new Ada.Unchecked_Conversion
     (Source => TCOD_bkgnd_flag_t, Target => Background_Mode);
   function To_TCOD_Alignment is new Ada.Unchecked_Conversion
     (Source => Alignment_Type, Target => TCOD_alignment_t);
   function To_Alignment_Type is new Ada.Unchecked_Conversion
     (Source => TCOD_alignment_t, Target => Alignment_Type);
   function To_Renderer_Type is new Ada.Unchecked_Conversion
     (Source => Renderer_Type, Target => console_types_h.TCOD_renderer_t);

   ---------------
   -- init_root --
   ---------------

   function init_root(w : Width; h : Height; title : String;
                      fullscreen : Boolean := False;
                      renderer : Renderer_Type := Renderer_SDL2) return Root is
      title_ptr : Strings.chars_ptr := Strings.New_String(title);
      err : error_h.TCOD_Error;
   begin
      err := TCOD_console_init_root(int(w), int(h), title_ptr,
                                    bool(fullscreen), To_Renderer_Type(renderer));
      Strings.Free(title_ptr);
      if err /= error_h.TCOD_E_OK then
         raise Error with Strings.Value(error_h.TCOD_get_error);
      end if;
      return result : Root;
   end init_root;

   -----------------
   -- make_screen --
   -----------------

   function make_screen(w : Width; h : Height) return Screen is
   begin
      return result : Screen :=
        Screen'(Limited_Controlled with TCOD_console_new(int(w), int(h)));
   end make_screen;

   --------------
   -- Finalize --
   --------------

   overriding procedure Finalize(self : in out Root) is
   begin
      TCOD_quit;
   end Finalize;

   overriding procedure Finalize(self : in out Screen) is
   begin
      TCOD_console_delete(self.data);
   end Finalize;


   procedure set_title(title : String) is
      title_ptr : Strings.chars_ptr := Strings.New_String(title);
   begin
      TCOD_console_set_window_title(title_ptr);
      Strings.Free(title_ptr);
   end;

   procedure set_fullscreen(val : Boolean) is
   begin
      TCOD_console_set_fullscreen(bool(val));
   end;

   function is_fullscreen return Boolean is (Boolean(TCOD_console_is_fullscreen));

   ----------------------
   -- is_window_closed --
   ----------------------

   function is_window_closed return Boolean is
     (Boolean(TCOD_console_is_window_closed));

   -----------
   -- flush --
   -----------

   procedure flush is
      e : error_h.TCOD_Error := TCOD_console_flush;
   begin
      if TCOD_console_flush /= error_h.TCOD_E_OK then
         raise Error with Strings.Value(error_h.TCOD_get_error);
      end if;
   end;

   ---------------
   -- get_width --
   ---------------

   function get_width(s : Screen) return Width is
     (Width(TCOD_console_get_width(s.data)));

   ----------------
   -- get_height --
   ----------------

   function get_height(s : Screen) return Height is
     (Height(TCOD_console_get_height(s.data)));

   -------------------
   -- has_key_color --
   -------------------

   function has_key_color(s : Screen) return Boolean is
     (Boolean(s.data.all.has_key_color));

   -------------------
   -- set_key_color --
   -------------------

   procedure set_key_color(s : in out Screen; key_color : RGB_Color) is
   begin
      TCOD_console_set_key_color(s.data, To_TCOD_ColorRGB(key_color));
   end set_key_color;

   -------------------
   -- get_key_color --
   -------------------

   function get_key_color(s : Screen) return RGB_Color is
     (To_RGB_Color(s.data.all.key_color));

   --------------------
   -- set_default_fg --
   --------------------

   procedure set_default_fg(s : in out Screen; fg : RGB_Color) is
   begin
      TCOD_console_set_default_foreground(s.data, To_TCOD_ColorRGB(fg));
   end set_default_fg;

   --------------------
   -- get_default_fg --
   --------------------

   function get_default_fg(s : Screen) return RGB_Color is
     (To_RGB_Color(TCOD_console_get_default_foreground(s.data)));

   --------------------
   -- set_default_bg --
   --------------------

   procedure set_default_bg(s : in out Screen; bg : RGB_Color) is
   begin
      TCOD_console_set_default_background(s.data, To_TCOD_ColorRGB(bg));
   end set_default_bg;

   --------------------
   -- get_default_bg --
   --------------------

   function get_default_bg(s : Screen) return RGB_Color is
     (To_RGB_Color(TCOD_console_get_default_background(s.data)));

   -----------
   -- clear --
   -----------

   procedure clear(s : in out Screen) is
   begin
      TCOD_console_clear(s.data);
   end clear;

   ------------
   -- resize --
   ------------

   procedure resize(s : in out Screen; w : Width; h : Height) is
   begin
      TCOD_console_resize_u(s.data, int(w), int(h));
   end resize;

   --------------
   -- put_char --
   --------------

   procedure put_char(s : in out Screen; x : X_Pos; y : Y_Pos; ch : Unicode_Char) is
   begin
      TCOD_console_set_char(s.data, int(x), int(y), int(ch));
   end put_char;

   procedure put_char(s : in out Screen; x : X_Pos; y : Y_Pos; ch : Unicode_Char;
                      mode : Background_Mode) is
   begin
      TCOD_console_put_char(s.data, int(x), int(y), int(ch),
                            Background_Mode_To_Bgflag(mode));
   end put_char;

   procedure put_char(s : in out Screen; x : X_Pos; y : Y_Pos; ch : Unicode_Char;
                      fg_color, bg_color : RGB_Color) is
   begin
      TCOD_console_put_char_ex(s.data, int(x), int(y), int(ch),
                               To_TCOD_ColorRGB(fg_color), To_TCOD_ColorRGB(bg_color));
   end put_char;

   --------------
   -- get_char --
   --------------

   function get_char(s : Screen; x : X_Pos; y : Y_Pos) return Unicode_Char is
     (Unicode_Char(TCOD_console_get_char(s.data, int(x), int(y))));

   -----------------
   -- set_char_fg --
   -----------------

   procedure set_char_fg(s : in out Screen; x : X_Pos; y : Y_Pos; color : RGB_Color) is
   begin
      TCOD_console_set_char_foreground(s.data, int(x), int(y), To_TCOD_ColorRGB(color));
   end set_char_fg;

   -----------------
   -- get_char_fg --
   -----------------

   function get_char_fg(s : Screen; x : X_Pos; y : Y_Pos) return RGB_Color is
     (To_RGB_Color(TCOD_console_get_char_foreground(s.data, int(x), int(y))));

   -----------------
   -- set_char_bg --
   -----------------

   procedure set_char_bg(s : in out Screen; x : X_Pos; y : Y_Pos; color : RGB_Color;
                         mode : Background_Mode) is
   begin
      TCOD_console_set_char_background(s.data, int(x), int(y), To_TCOD_ColorRGB(color),
                                       Background_Mode_To_Bgflag(mode));
   end set_char_bg;

   -----------------
   -- get_char_bg --
   -----------------

   function get_char_bg(s : Screen; x : X_Pos; y : Y_Pos) return RGB_Color is
     (To_RGB_Color(TCOD_console_get_char_background(s.data, int(x), int(y))));

   -----------------
   -- set_bg_mode --
   -----------------

   procedure set_bg_mode(s : in out Screen; mode : Background_Mode) is
   begin
      TCOD_console_set_background_flag(s.data, Background_Mode_To_Bgflag(mode));
   end set_bg_mode;

   -----------------
   -- get_bg_mode --
   -----------------

   function get_bg_mode(s : Screen) return Background_Mode is
     (Bgflag_to_Background_Mode(TCOD_console_get_background_flag(s.data)));

   -------------------
   -- set_alignment --
   -------------------

   procedure set_alignment(s : in out Screen; alignment : Alignment_Type) is
   begin
      TCOD_console_set_alignment(s.data, To_TCOD_Alignment(alignment));
   end set_alignment;

   -------------------
   -- get_alignment --
   -------------------

   function get_alignment(s : Screen) return Alignment_Type is
     (To_Alignment_Type(TCOD_console_get_alignment(s.data)));

   --------------
   -- set_fade --
   --------------

   procedure set_fade(val : Fade; color : RGB_Color) is
   begin
      TCOD_console_set_fade(unsigned_char(val), To_TCOD_ColorRGB(color));
   end set_fade;

   --------------
   -- get_fade --
   --------------

   function get_fade return Fade is (Fade(TCOD_console_get_fade));

   ----------------------
   -- get_fading_color --
   ----------------------

   function get_fading_color return RGB_Color is
     (To_RGB_Color(TCOD_console_get_fading_color));

end Libtcod.Console;
