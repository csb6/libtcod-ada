with Ada.Unchecked_Conversion, Interfaces.C.Strings, Interfaces.C.Extensions;
with Libtcod.Color.Conversions;
with error_h, context_init_h, console_init_h, console_printing_h, console_drawing_h;

package body Libtcod.Console is

   use Interfaces.C, Interfaces.C.Extensions, Libtcod.Color.Conversions;
   use context_h, context_init_h, console_h, console_init_h, console_printing_h,
       console_drawing_h;

   function Background_Mode_To_Bgflag is new Ada.Unchecked_Conversion
     (Source => Background_Mode, Target => TCOD_bkgnd_flag_t);
   function Bgflag_to_Background_Mode is new Ada.Unchecked_Conversion
     (Source => TCOD_bkgnd_flag_t, Target => Background_Mode);
   function To_TCOD_Alignment is new Ada.Unchecked_Conversion
     (Source => Alignment_Type, Target => TCOD_alignment_t);
   function To_Alignment_Type is new Ada.Unchecked_Conversion
     (Source => TCOD_alignment_t, Target => Alignment_Type);
   subtype Limited_Controlled is Ada.Finalization.Limited_Controlled;

   SDL_Window_Resizable : constant := 16#00000020#;
   SDL_Window_Fullscreen : constant := 16#00000001#;

   ------------------
   -- make_context --
   ------------------

   function make_context(w : Width; h : Height; title : String;
                         resizable : Boolean := True; fullscreen : Boolean := False;
                         renderer : Renderer_Type := Renderer_SDL2) return Context is
      c_title : aliased char_array := To_C(title);
      err : error_h.TCOD_Error;
      params : aliased TCOD_ContextParams := (columns => int(w), rows => int(h),
                                              renderer_type => Renderer_Type'Pos(renderer),
                                              window_title =>
                                                Strings.To_Chars_Ptr(c_title'Unchecked_Access),
                                              vsync => 1, pixel_width => 0,
                                              pixel_height => 0, argc => 0,
                                              others => <>);
      sdl_flags : unsigned := 0;
   begin
      return result : Context do
         if resizable then
            sdl_flags := sdl_flags or SDL_Window_Resizable;
         end if;
         if fullscreen then
            sdl_flags := sdl_flags or SDL_Window_Fullscreen;
         end if;
         params.sdl_window_flags := int(sdl_flags);
         err := TCOD_context_new(params'Access, result.data'Address);

         if err /= error_h.TCOD_E_OK then
            raise Error with Strings.Value(error_h.TCOD_get_error);
         end if;
      end return;
   end make_context;

   -----------------
   -- make_screen --
   -----------------

   function make_screen(w : Width; h : Height) return Screen is
   begin
      return result : Screen :=
        Screen'(Limited_Controlled with TCOD_console_new(int(w), int(h))) do
         if result.data = null then
            raise Program_Error with "TCOD console allocation failed";
         end if;
      end return;
   end make_screen;

   --------------
   -- Finalize --
   --------------

   overriding procedure Finalize(self : in out Context) is
   begin
      TCOD_context_delete(self.data);
   end Finalize;

   overriding procedure Finalize(self : in out Screen) is
   begin
      TCOD_console_delete(self.data);
   end Finalize;


   procedure set_title(title : String) is
      c_title : aliased char_array := To_C(title);
   begin
      TCOD_console_set_window_title(Strings.To_Chars_Ptr(c_title'Unchecked_Access));
   end;

   procedure set_fullscreen(val : Boolean) is
   begin
      TCOD_console_set_fullscreen(bool(val));
   end;

   function is_fullscreen return Boolean is (Boolean(TCOD_console_is_fullscreen));

   ----------------------
   -- is_window_closed --
   ----------------------

   function is_window_closed return Boolean is (Boolean(TCOD_console_is_window_closed));

   -------------
   -- present --
   -------------

   procedure present(cxt : in out Context'Class; s : Screen) is
      err : error_h.TCOD_Error := TCOD_context_present(cxt.data, s.data, null);
   begin
      if err /= error_h.TCOD_E_OK then
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

   ----------
   -- blit --
   ----------

   procedure blit(s : Screen; src_x : X_Pos; src_y : Y_Pos;
                  w : Width; h : Height; dest : access Screen;
                  dest_x : X_Pos; dest_y : Y_Pos) is
   begin
      TCOD_console_blit(s.data, int(src_x), int(src_y), int(w), int(h),
                        dest.data, int(dest_x), int(dest_y), 1.0, 1.0);
   end blit;

   --------------
   -- put_char --
   --------------

   procedure put_char(s : in out Screen; x : X_Pos; y : Y_Pos; ch : Wide_Character) is
   begin
      TCOD_console_set_char(s.data, int(x), int(y), Wide_Character'Pos(ch));
   end put_char;

   procedure put_char(s : in out Screen; x : X_Pos; y : Y_Pos; ch : Wide_Character;
                      mode : Background_Mode) is
   begin
      TCOD_console_put_char(s.data, int(x), int(y), Wide_Character'Pos(ch),
                            Background_Mode_To_Bgflag(mode));
   end put_char;

   procedure put_char(s : in out Screen; x : X_Pos; y : Y_Pos; ch : Wide_Character;
                      fg_color, bg_color : RGB_Color) is
   begin
      TCOD_console_put_char_ex(s.data, int(x), int(y), Wide_Character'Pos(ch),
                               To_TCOD_ColorRGB(fg_color), To_TCOD_ColorRGB(bg_color));
   end put_char;

   -----------
   -- print --
   -----------

   procedure print(s : in out Screen; x : X_Pos; y : Y_Pos; text : String) is
      c_str : aliased char_array := To_C(text);
   begin
      TCOD_console_print(s.data, int(x), int(y), Strings.To_Chars_Ptr(c_str'Unchecked_Access));
   end print;

   --------------
   -- get_char --
   --------------

   function get_char(s : Screen; x : X_Pos; y : Y_Pos) return Wide_Character is
     (Wide_Character'Val(TCOD_console_get_char(s.data, int(x), int(y))));

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
                         mode : Background_Mode := Background_Set) is
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

   ----------
   -- rect --
   ----------

   procedure rect(s : in out Screen; x : X_Pos; y : Y_Pos; w : Width; h : Height;
                  clear : Boolean := False; bg_flag : Background_Mode := Background_Set) is
   begin
      TCOD_console_rect(s.data, int(x), int(y), int(w), int(h), bool(clear),
                        Background_Mode_To_Bgflag(bg_flag));
   end rect;

end Libtcod.Console;
