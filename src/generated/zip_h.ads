pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with color_h;
with image_h;
with console_h;
with mersenne_types_h;
with System;
with utypes_uuint32_t_h;

package zip_h is

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

   type TCOD_Zip is null record;   -- incomplete struct

   type TCOD_zip_t is access all TCOD_Zip;  -- zip.h:45

   function TCOD_zip_new return TCOD_zip_t  -- zip.h:48
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_zip_new";

   procedure TCOD_zip_delete (zip : TCOD_zip_t)  -- zip.h:49
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_zip_delete";

  -- output interface  
   procedure TCOD_zip_put_char (zip : TCOD_zip_t; val : char)  -- zip.h:52
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_zip_put_char";

   procedure TCOD_zip_put_int (zip : TCOD_zip_t; val : int)  -- zip.h:53
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_zip_put_int";

   procedure TCOD_zip_put_float (zip : TCOD_zip_t; val : float)  -- zip.h:54
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_zip_put_float";

   procedure TCOD_zip_put_string (zip : TCOD_zip_t; val : Interfaces.C.Strings.chars_ptr)  -- zip.h:55
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_zip_put_string";

   procedure TCOD_zip_put_color (zip : TCOD_zip_t; val : color_h.TCOD_color_t)  -- zip.h:56
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_zip_put_color";

   procedure TCOD_zip_put_image (zip : TCOD_zip_t; val : image_h.TCOD_image_t)  -- zip.h:57
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_zip_put_image";

   procedure TCOD_zip_put_console (zip : TCOD_zip_t; val : access constant console_h.TCOD_Console)  -- zip.h:59
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_zip_put_console";

  --*
  --    Write a TCOD_Random* object.
  --    \rst
  --    .. versionadded:: 1.16
  --    \endrst
  --  

   procedure TCOD_zip_put_random (zip : TCOD_zip_t; val : access constant mersenne_types_h.TCOD_Random)  -- zip.h:66
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_zip_put_random";

   procedure TCOD_zip_put_data
     (zip : TCOD_zip_t;
      nbBytes : int;
      data : System.Address)  -- zip.h:67
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_zip_put_data";

   function TCOD_zip_get_current_bytes (zip : TCOD_zip_t) return utypes_uuint32_t_h.uint32_t  -- zip.h:68
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_zip_get_current_bytes";

   function TCOD_zip_save_to_file (zip : TCOD_zip_t; filename : Interfaces.C.Strings.chars_ptr) return int  -- zip.h:69
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_zip_save_to_file";

  -- input interface  
   function TCOD_zip_load_from_file (zip : TCOD_zip_t; filename : Interfaces.C.Strings.chars_ptr) return int  -- zip.h:72
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_zip_load_from_file";

   function TCOD_zip_get_char (zip : TCOD_zip_t) return char  -- zip.h:73
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_zip_get_char";

   function TCOD_zip_get_int (zip : TCOD_zip_t) return int  -- zip.h:74
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_zip_get_int";

   function TCOD_zip_get_float (zip : TCOD_zip_t) return float  -- zip.h:75
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_zip_get_float";

   function TCOD_zip_get_string (arg1 : TCOD_zip_t) return Interfaces.C.Strings.chars_ptr  -- zip.h:76
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_zip_get_string";

   function TCOD_zip_get_color (zip : TCOD_zip_t) return color_h.TCOD_color_t  -- zip.h:77
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_zip_get_color";

   function TCOD_zip_get_image (zip : TCOD_zip_t) return image_h.TCOD_image_t  -- zip.h:78
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_zip_get_image";

   function TCOD_zip_get_console (zip : TCOD_zip_t) return console_h.TCOD_console_t  -- zip.h:79
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_zip_get_console";

  --*
  --    Read a TCOD_Random* object.
  --    \rst
  --    .. versionadded:: 1.16
  --    \endrst
  --  

   function TCOD_zip_get_random (zip : TCOD_zip_t) return mersenne_types_h.TCOD_random_t  -- zip.h:86
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_zip_get_random";

   function TCOD_zip_get_data
     (zip : TCOD_zip_t;
      nbBytes : int;
      data : System.Address) return int  -- zip.h:87
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_zip_get_data";

   function TCOD_zip_get_remaining_bytes (zip : TCOD_zip_t) return utypes_uuint32_t_h.uint32_t  -- zip.h:88
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_zip_get_remaining_bytes";

   procedure TCOD_zip_skip_bytes (zip : TCOD_zip_t; nbBytes : utypes_uuint32_t_h.uint32_t)  -- zip.h:89
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_zip_skip_bytes";

end zip_h;
