pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with color_h;
with Interfaces.C.Extensions;
with console_h;
with Interfaces.C.Strings;
with error_h;

package image_h is

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

   type TCOD_mipmap_u is record
      width : aliased int;  -- image.h:45
      height : aliased int;  -- image.h:45
      fwidth : aliased float;  -- image.h:46
      fheight : aliased float;  -- image.h:46
      buf : access color_h.TCOD_ColorRGB;  -- image.h:47
      dirty : aliased Extensions.bool;  -- image.h:48
   end record
   with Convention => C_Pass_By_Copy;  -- image.h:44

   type TCOD_Image is record
      nb_mipmaps : aliased int;  -- image.h:52
      mipmaps : access TCOD_mipmap_u;  -- image.h:53
      key_color : aliased color_h.TCOD_ColorRGB;  -- image.h:54
      has_key_color : aliased Extensions.bool;  -- image.h:55
   end record
   with Convention => C_Pass_By_Copy;  -- image.h:51

   type TCOD_image_t is access all TCOD_Image;  -- image.h:58

   function TCOD_image_new (arg1 : int; arg2 : int) return access TCOD_Image  -- image.h:60
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_image_new";

  --*
  -- *  Return a new image rendered from a console.
  -- *
  -- *  This effectively returns a screenshot of the console.
  --  

   function TCOD_image_from_console (arg1 : access constant console_h.TCOD_Console) return access TCOD_Image  -- image.h:66
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_image_from_console";

  --*
  -- *  Same as TCOD_image_from_console, but with an existing image.
  --  

   procedure TCOD_image_refresh_console (image : access TCOD_Image; console : access constant console_h.TCOD_Console)  -- image.h:70
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_image_refresh_console";

   procedure TCOD_image_clear (image : access TCOD_Image; color : color_h.TCOD_color_t)  -- image.h:71
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_image_clear";

   procedure TCOD_image_invert (image : access TCOD_Image)  -- image.h:72
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_image_invert";

   procedure TCOD_image_hflip (image : access TCOD_Image)  -- image.h:73
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_image_hflip";

   procedure TCOD_image_rotate90 (image : access TCOD_Image; numRotations : int)  -- image.h:74
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_image_rotate90";

   procedure TCOD_image_vflip (image : access TCOD_Image)  -- image.h:75
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_image_vflip";

   procedure TCOD_image_scale
     (image : access TCOD_Image;
      new_w : int;
      new_h : int)  -- image.h:76
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_image_scale";

   function TCOD_image_load (arg1 : Interfaces.C.Strings.chars_ptr) return access TCOD_Image  -- image.h:78
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_image_load";

  --*
  --    Save an image to a PNG or BMP file.
  --    Returns a negative error code on failure.  Check TCOD_get_error for details.
  --    \rst
  --    .. versionchanged:: 1.16
  --        Now returns TCOD_Error.
  --    \endrst
  --  

   function TCOD_image_save (image : access constant TCOD_Image; filename : Interfaces.C.Strings.chars_ptr) return error_h.TCOD_Error  -- image.h:88
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_image_save";

   procedure TCOD_image_get_size
     (image : access constant TCOD_Image;
      w : access int;
      h : access int)  -- image.h:90
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_image_get_size";

   function TCOD_image_get_pixel
     (image : access constant TCOD_Image;
      x : int;
      y : int) return color_h.TCOD_color_t  -- image.h:91
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_image_get_pixel";

   function TCOD_image_get_alpha
     (image : access constant TCOD_Image;
      x : int;
      y : int) return int  -- image.h:92
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_image_get_alpha";

  --*
  -- *  Return a mipmapped pixel of image.
  -- *
  -- *  Mipmaps are updated when you call this, so it can't be called from multiple
  -- *  threads.
  --  

   function TCOD_image_get_mipmap_pixel
     (image : access TCOD_Image;
      x0 : float;
      y0 : float;
      x1 : float;
      y1 : float) return color_h.TCOD_color_t  -- image.h:99
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_image_get_mipmap_pixel";

   procedure TCOD_image_put_pixel
     (image : access TCOD_Image;
      x : int;
      y : int;
      col : color_h.TCOD_color_t)  -- image.h:100
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_image_put_pixel";

   procedure TCOD_image_blit
     (image : access TCOD_Image;
      console : console_h.TCOD_console_t;
      x : float;
      y : float;
      bkgnd_flag : console_h.TCOD_bkgnd_flag_t;
      scale_x : float;
      scale_y : float;
      angle : float)  -- image.h:101
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_image_blit";

   procedure TCOD_image_blit_rect
     (image : access TCOD_Image;
      console : console_h.TCOD_console_t;
      x : int;
      y : int;
      w : int;
      h : int;
      bkgnd_flag : console_h.TCOD_bkgnd_flag_t)  -- image.h:110
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_image_blit_rect";

   procedure TCOD_image_blit_2x
     (image : access constant TCOD_Image;
      dest : access console_h.TCOD_Console;
      dx : int;
      dy : int;
      sx : int;
      sy : int;
      w : int;
      h : int)  -- image.h:112
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_image_blit_2x";

   procedure TCOD_image_delete (image : access TCOD_Image)  -- image.h:114
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_image_delete";

   procedure TCOD_image_set_key_color (image : access TCOD_Image; key_color : color_h.TCOD_color_t)  -- image.h:115
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_image_set_key_color";

   function TCOD_image_is_pixel_transparent
     (image : access constant TCOD_Image;
      x : int;
      y : int) return Extensions.bool  -- image.h:116
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_image_is_pixel_transparent";

end image_h;
