pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with console_h;
with Interfaces.C.Strings;
with Interfaces.C.Extensions;
with color_h;
with error_h;

package console_printing_h is

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

   procedure TCOD_console_print
     (con : access console_h.TCOD_Console;
      x : int;
      y : int;
      fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      )  -- console_printing.h:53
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_print";

   procedure TCOD_console_print_ex
     (con : access console_h.TCOD_Console;
      x : int;
      y : int;
      flag : console_h.TCOD_bkgnd_flag_t;
      alignment : console_h.TCOD_alignment_t;
      fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      )  -- console_printing.h:55
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_print_ex";

   function TCOD_console_print_rect
     (con : access console_h.TCOD_Console;
      x : int;
      y : int;
      w : int;
      h : int;
      fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int  -- console_printing.h:58
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_print_rect";

   function TCOD_console_print_rect_ex
     (con : access console_h.TCOD_Console;
      x : int;
      y : int;
      w : int;
      h : int;
      flag : console_h.TCOD_bkgnd_flag_t;
      alignment : console_h.TCOD_alignment_t;
      fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int  -- console_printing.h:60
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_print_rect_ex";

   procedure TCOD_console_print_frame
     (con : console_h.TCOD_console_t;
      x : int;
      y : int;
      w : int;
      h : int;
      empty : Extensions.bool;
      flag : console_h.TCOD_bkgnd_flag_t;
      fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      )  -- console_printing.h:71
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_print_frame";

   function TCOD_console_get_height_rect
     (con : access console_h.TCOD_Console;
      x : int;
      y : int;
      w : int;
      h : int;
      fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int  -- console_printing.h:74
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_get_height_rect";

   procedure TCOD_console_print_utf
     (con : access console_h.TCOD_Console;
      x : int;
      y : int;
      fmt : access wchar_t  -- , ...
      )  -- console_printing.h:78
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_print_utf";

   procedure TCOD_console_print_ex_utf
     (con : access console_h.TCOD_Console;
      x : int;
      y : int;
      flag : console_h.TCOD_bkgnd_flag_t;
      alignment : console_h.TCOD_alignment_t;
      fmt : access wchar_t  -- , ...
      )  -- console_printing.h:80
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_print_ex_utf";

   function TCOD_console_print_rect_utf
     (con : access console_h.TCOD_Console;
      x : int;
      y : int;
      w : int;
      h : int;
      fmt : access wchar_t  -- , ...
      ) return int  -- console_printing.h:83
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_print_rect_utf";

   function TCOD_console_print_rect_ex_utf
     (con : access console_h.TCOD_Console;
      x : int;
      y : int;
      w : int;
      h : int;
      flag : console_h.TCOD_bkgnd_flag_t;
      alignment : console_h.TCOD_alignment_t;
      fmt : access wchar_t  -- , ...
      ) return int  -- console_printing.h:85
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_print_rect_ex_utf";

   function TCOD_console_get_height_rect_utf
     (con : access console_h.TCOD_Console;
      x : int;
      y : int;
      w : int;
      h : int;
      fmt : access wchar_t  -- , ...
      ) return int  -- console_printing.h:96
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_get_height_rect_utf";

   subtype TCOD_colctrl_t is unsigned;
   TCOD_COLCTRL_1 : constant unsigned := 1;
   TCOD_COLCTRL_2 : constant unsigned := 2;
   TCOD_COLCTRL_3 : constant unsigned := 3;
   TCOD_COLCTRL_4 : constant unsigned := 4;
   TCOD_COLCTRL_5 : constant unsigned := 5;
   TCOD_COLCTRL_NUMBER : constant unsigned := 5;
   TCOD_COLCTRL_FORE_RGB : constant unsigned := 6;
   TCOD_COLCTRL_BACK_RGB : constant unsigned := 7;
   TCOD_COLCTRL_STOP : constant unsigned := 8;  -- console_printing.h:110

   procedure TCOD_console_set_color_control
     (con : TCOD_colctrl_t;
      fore : color_h.TCOD_color_t;
      back : color_h.TCOD_color_t)  -- console_printing.h:112
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_set_color_control";

  -- UTF-8 functions  
  --*
  --    Format and print a UTF-8 string to a console.
  --    \rst
  --    .. versionadded:: 1.8
  --    .. versionchanged:: 1.16
  --        Now returns a negative error code on failure.
  --    \endrst
  --  

   function TCOD_console_printf
     (con : access console_h.TCOD_Console;
      x : int;
      y : int;
      fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return error_h.TCOD_Error  -- console_printing.h:125
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_printf";

  --*
  --    Format and print a UTF-8 string to a console.
  --    \rst
  --    .. versionadded:: 1.8
  --    .. versionchanged:: 1.16
  --        Now returns a negative error code on failure.
  --    \endrst
  --  

   function TCOD_console_printf_ex
     (con : access console_h.TCOD_Console;
      x : int;
      y : int;
      flag : console_h.TCOD_bkgnd_flag_t;
      alignment : console_h.TCOD_alignment_t;
      fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return error_h.TCOD_Error  -- console_printing.h:135
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_printf_ex";

  --*
  --    Format and print a UTF-8 string to a console.
  --    \rst
  --    .. versionadded:: 1.8
  --    .. versionchanged:: 1.16
  --        Now returns a negative error code on failure.
  --    \endrst
  --  

   function TCOD_console_printf_rect
     (con : access console_h.TCOD_Console;
      x : int;
      y : int;
      w : int;
      h : int;
      fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int  -- console_printing.h:152
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_printf_rect";

  --*
  --    Format and print a UTF-8 string to a console.
  --    \rst
  --    .. versionadded:: 1.8
  --    .. versionchanged:: 1.16
  --        Now returns a negative error code on failure.
  --    \endrst
  --  

   function TCOD_console_printf_rect_ex
     (con : access console_h.TCOD_Console;
      x : int;
      y : int;
      w : int;
      h : int;
      flag : console_h.TCOD_bkgnd_flag_t;
      alignment : console_h.TCOD_alignment_t;
      fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int  -- console_printing.h:163
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_printf_rect_ex";

  --*
  --    Print a framed and optionally titled region to a console, using default
  --    colors and alignment.
  --    This function uses Unicode box-drawing characters and a UTF-8 formatted
  --    string.
  --    \rst
  --    .. versionadded:: 1.8
  --    .. versionchanged:: 1.16
  --        Now returns a negative error code on failure.
  --    \endrst
  --  

   function TCOD_console_printf_frame
     (con : access console_h.TCOD_Console;
      x : int;
      y : int;
      w : int;
      h : int;
      empty : int;
      flag : console_h.TCOD_bkgnd_flag_t;
      fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return error_h.TCOD_Error  -- console_printing.h:186
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_printf_frame";

  --*
  --    Return the number of lines that would be printed by this formatted string.
  --    \rst
  --    .. versionadded:: 1.8
  --    .. versionchanged:: 1.16
  --        Now returns a negative error code on failure.
  --    \endrst
  --  

   function TCOD_console_get_height_rect_fmt
     (con : access console_h.TCOD_Console;
      x : int;
      y : int;
      w : int;
      h : int;
      fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int  -- console_printing.h:205
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_get_height_rect_fmt";

   function TCOD_console_printn
     (con : access console_h.TCOD_Console;
      x : int;
      y : int;
      n : size_t;
      str : Interfaces.C.Strings.chars_ptr;
      fg : access constant color_h.TCOD_color_t;
      bg : access constant color_h.TCOD_color_t;
      flag : console_h.TCOD_bkgnd_flag_t;
      alignment : console_h.TCOD_alignment_t) return error_h.TCOD_Error  -- console_printing.h:208
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_printn";

   function TCOD_console_printn_rect
     (con : access console_h.TCOD_Console;
      x : int;
      y : int;
      width : int;
      height : int;
      n : size_t;
      str : Interfaces.C.Strings.chars_ptr;
      fg : access constant color_h.TCOD_color_t;
      bg : access constant color_h.TCOD_color_t;
      flag : console_h.TCOD_bkgnd_flag_t;
      alignment : console_h.TCOD_alignment_t) return int  -- console_printing.h:218
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_printn_rect";

   function TCOD_console_get_height_rect_n
     (console : access console_h.TCOD_Console;
      x : int;
      y : int;
      width : int;
      height : int;
      n : size_t;
      str : Interfaces.C.Strings.chars_ptr) return int  -- console_printing.h:230
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_get_height_rect_n";

   function TCOD_console_get_height_rect_wn
     (width : int;
      n : size_t;
      str : Interfaces.C.Strings.chars_ptr) return int  -- console_printing.h:232
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_get_height_rect_wn";

   function TCOD_console_printn_frame
     (con : access console_h.TCOD_Console;
      x : int;
      y : int;
      width : int;
      height : int;
      n : size_t;
      title : Interfaces.C.Strings.chars_ptr;
      fg : access constant color_h.TCOD_color_t;
      bg : access constant color_h.TCOD_color_t;
      flag : console_h.TCOD_bkgnd_flag_t;
      empty : Extensions.bool) return error_h.TCOD_Error  -- console_printing.h:233
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_printn_frame";

  -- extern "C"
  -- namespace tcod
end console_printing_h;
