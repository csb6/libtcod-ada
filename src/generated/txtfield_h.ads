pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with color_h;
with console_types_h;
with Interfaces.C.Extensions;
with console_h;

package txtfield_h is

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

   type TCOD_Text is null record;   -- incomplete struct

   type TCOD_text_t is access all TCOD_Text;  -- txtfield.h:43

   function TCOD_text_init
     (x : int;
      y : int;
      w : int;
      h : int;
      max_chars : int) return TCOD_text_t  -- txtfield.h:45
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_text_init";

   function TCOD_text_init2
     (w : int;
      h : int;
      max_chars : int) return TCOD_text_t  -- txtfield.h:46
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_text_init2";

   procedure TCOD_text_set_pos
     (txt : TCOD_text_t;
      x : int;
      y : int)  -- txtfield.h:47
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_text_set_pos";

   procedure TCOD_text_set_properties
     (txt : TCOD_text_t;
      cursor_char : int;
      blink_interval : int;
      prompt : Interfaces.C.Strings.chars_ptr;
      tab_size : int)  -- txtfield.h:48
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_text_set_properties";

   procedure TCOD_text_set_colors
     (txt : TCOD_text_t;
      fore : color_h.TCOD_color_t;
      back : color_h.TCOD_color_t;
      back_transparency : float)  -- txtfield.h:50
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_text_set_colors";

   function TCOD_text_update (txt : TCOD_text_t; key : console_types_h.TCOD_key_t) return Extensions.bool  -- txtfield.h:51
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_text_update";

   procedure TCOD_text_render (txt : TCOD_text_t; con : console_h.TCOD_console_t)  -- txtfield.h:52
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_text_render";

   function TCOD_text_get (arg1 : TCOD_text_t) return Interfaces.C.Strings.chars_ptr  -- txtfield.h:53
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_text_get";

   procedure TCOD_text_reset (txt : TCOD_text_t)  -- txtfield.h:54
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_text_reset";

   procedure TCOD_text_delete (txt : TCOD_text_t)  -- txtfield.h:55
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_text_delete";

end txtfield_h;
