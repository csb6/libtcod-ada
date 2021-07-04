pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with error_h;
with sys_utypes_uwchar_t_h;
with console_h;
limited with context_viewport_h;
with console_types_h;
with Interfaces.C.Extensions;

package console_etc_h is

   --  arg-macro: function TCOD_BKGND_ALPHA (alpha)
   --    return (TCOD_bkgnd_flag_t)(TCOD_BKGND_ALPH or (((uint8_t)(alpha * 255)) << 8));
   --  arg-macro: function TCOD_BKGND_ADDALPHA (alpha)
   --    return (TCOD_bkgnd_flag_t)(TCOD_BKGND_ADDA or (((uint8_t)(alpha * 255)) << 8));
  -- BSD 3-Clause License
  -- *
  -- * Copyright © 2008-2021, Jice and the libtcod contributors.
  -- * All rights reserved.
  -- *
  -- * Redistribution and use in source and binary forms, with or without
  -- * modification, are permitted provided that the following conditions are met:
  -- *
  -- * 1. Redistributions of source code must retain the above copyright notice,
  -- *    this list of conditions and the following disclaimer.
  -- *
  -- * 2. Redistributions in binary form must reproduce the above copyright notice,
  -- *    this list of conditions and the following disclaimer in the documentation
  -- *    and/or other materials provided with the distribution.
  -- *
  -- * 3. Neither the name of the copyright holder nor the names of its
  -- *    contributors may be used to endorse or promote products derived from
  -- *    this software without specific prior written permission.
  -- *
  -- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  -- * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  -- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
  -- * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
  -- * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
  -- * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
  -- * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
  -- * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
  -- * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
  -- * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
  -- * POSSIBILITY OF SUCH DAMAGE.
  --  

   function TCOD_console_set_custom_font
     (fontFile : Interfaces.C.Strings.chars_ptr;
      flags : int;
      nb_char_horiz : int;
      nb_char_vertic : int) return error_h.TCOD_Error  -- console_etc.h:57
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_set_custom_font";

   procedure TCOD_console_map_ascii_code_to_font
     (asciiCode : int;
      fontCharX : int;
      fontCharY : int)  -- console_etc.h:58
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_map_ascii_code_to_font";

   procedure TCOD_console_map_ascii_codes_to_font
     (asciiCode : int;
      nbCodes : int;
      fontCharX : int;
      fontCharY : int)  -- console_etc.h:59
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_map_ascii_codes_to_font";

   procedure TCOD_console_map_string_to_font
     (s : Interfaces.C.Strings.chars_ptr;
      fontCharX : int;
      fontCharY : int)  -- console_etc.h:60
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_map_string_to_font";

   procedure TCOD_console_map_string_to_font_utf
     (s : access sys_utypes_uwchar_t_h.wchar_t;
      fontCharX : int;
      fontCharY : int)  -- console_etc.h:62
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_map_string_to_font_utf";

   procedure TCOD_console_set_dirty
     (x : int;
      y : int;
      w : int;
      h : int)  -- console_etc.h:66
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_set_dirty";

  --*
  --    Render and present a console with optional viewport options.
  --    `console` is the console to render.
  --    `viewport` is optional.
  --    Returns a negative values on error.  See `TCOD_get_error`.
  --    \rst
  --    .. versionadded:: 1.16
  --    \endrst
  --  

   function TCOD_console_flush_ex (console : access console_h.TCOD_Console; viewport : access context_viewport_h.TCOD_ViewportOptions) return error_h.TCOD_Error  -- console_etc.h:79
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_flush_ex";

  --*
  -- *  Render and present the root console to the active display.
  --  

   function TCOD_console_flush return error_h.TCOD_Error  -- console_etc.h:83
     with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_flush";

  --*
  --    Return True if the libtcod keycode is held.
  --    \rst
  --    .. deprecated:: 1.16
  --        You should instead use SDL_GetKeyboardState to check if keys are held.
  --    \endrst
  --  

   function TCOD_console_is_key_pressed (key : console_types_h.TCOD_keycode_t) return Extensions.bool  -- console_etc.h:93
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_is_key_pressed";

  -- ASCII paint file support  
   function TCOD_console_from_file (filename : Interfaces.C.Strings.chars_ptr) return console_h.TCOD_console_t  -- console_etc.h:96
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_from_file";

   function TCOD_console_load_asc (con : console_h.TCOD_console_t; filename : Interfaces.C.Strings.chars_ptr) return Extensions.bool  -- console_etc.h:97
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_load_asc";

   function TCOD_console_load_apf (con : console_h.TCOD_console_t; filename : Interfaces.C.Strings.chars_ptr) return Extensions.bool  -- console_etc.h:98
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_load_apf";

   function TCOD_console_save_asc (con : console_h.TCOD_console_t; filename : Interfaces.C.Strings.chars_ptr) return Extensions.bool  -- console_etc.h:99
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_save_asc";

   function TCOD_console_save_apf (con : console_h.TCOD_console_t; filename : Interfaces.C.Strings.chars_ptr) return Extensions.bool  -- console_etc.h:100
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_save_apf";

  --*
  --    Return immediately with a recently pressed key.
  --    \param flags A TCOD_event_t bit-field, for example: `TCOD_EVENT_KEY_PRESS`
  --    \return A TCOD_key_t struct with a recently pressed key.
  --            If no event exists then the `vk` attribute will be `TCODK_NONE`
  --  

   function TCOD_console_check_for_keypress (flags : int) return console_types_h.TCOD_key_t  -- console_etc.h:111
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_check_for_keypress";

  --*
  --    Wait for a key press event, then return it.
  --    \param flush If 1 then the event queue will be cleared before waiting for
  --                 the next event.  This should always be 0.
  --    \return A TCOD_key_t struct with the most recent key data.
  --    Do not solve input lag issues by arbitrarily dropping events!
  --  

   function TCOD_console_wait_for_keypress (flush : Extensions.bool) return console_types_h.TCOD_key_t  -- console_etc.h:122
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_wait_for_keypress";

   procedure TCOD_console_credits  -- console_etc.h:124
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_credits";

   procedure TCOD_console_credits_reset  -- console_etc.h:125
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_credits_reset";

   function TCOD_console_credits_render
     (x : int;
      y : int;
      alpha : Extensions.bool) return Extensions.bool  -- console_etc.h:126
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_credits_render";

   procedure TCOD_console_set_keyboard_repeat (initial_delay : int; interval : int)  -- console_etc.h:129
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_set_keyboard_repeat";

   procedure TCOD_console_disable_keyboard_repeat  -- console_etc.h:131
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_disable_keyboard_repeat";

  -- extern "C"
end console_etc_h;
