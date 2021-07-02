pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;

package color_h is

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

  --*
  -- *  A three channel color struct.
  --  

   type TCOD_ColorRGB is record
      r : aliased unsigned_char;  -- color.h:47
      g : aliased unsigned_char;  -- color.h:48
      b : aliased unsigned_char;  -- color.h:49
   end record
   with Convention => C_Pass_By_Copy;  -- color.h:42

   subtype TCOD_color_t is TCOD_ColorRGB;  -- color.h:51

  --*
  -- *  A four channel color struct.
  --  

   type TCOD_ColorRGBA is record
      r : aliased unsigned_char;  -- color.h:63
      g : aliased unsigned_char;  -- color.h:64
      b : aliased unsigned_char;  -- color.h:65
      a : aliased unsigned_char;  -- color.h:66
   end record
   with Convention => C_Pass_By_Copy;  -- color.h:56

  -- constructors  
   function TCOD_color_RGB
     (r : unsigned_char;
      g : unsigned_char;
      b : unsigned_char) return TCOD_color_t  -- color.h:73
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_color_RGB";

   function TCOD_color_HSV
     (hue : float;
      saturation : float;
      value : float) return TCOD_color_t  -- color.h:74
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_color_HSV";

  -- basic operations  
   function TCOD_color_equals (c1 : TCOD_color_t; c2 : TCOD_color_t) return Extensions.bool  -- color.h:76
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_color_equals";

   function TCOD_color_add (c1 : TCOD_color_t; c2 : TCOD_color_t) return TCOD_color_t  -- color.h:77
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_color_add";

   function TCOD_color_subtract (c1 : TCOD_color_t; c2 : TCOD_color_t) return TCOD_color_t  -- color.h:78
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_color_subtract";

   function TCOD_color_multiply (c1 : TCOD_color_t; c2 : TCOD_color_t) return TCOD_color_t  -- color.h:79
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_color_multiply";

   function TCOD_color_multiply_scalar (c1 : TCOD_color_t; value : float) return TCOD_color_t  -- color.h:80
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_color_multiply_scalar";

   function TCOD_color_lerp
     (c1 : TCOD_color_t;
      c2 : TCOD_color_t;
      coef : float) return TCOD_color_t  -- color.h:81
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_color_lerp";

  --*
  -- *  Blend `src` into `dst` as an alpha blending operation.
  -- *  \rst
  -- *  .. versionadded:: 1.16
  -- *  \endrst
  --  

   procedure TCOD_color_alpha_blend (dst : access TCOD_ColorRGBA; src : access constant TCOD_ColorRGBA)  -- color.h:88
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_color_alpha_blend";

  -- HSV transformations  
   procedure TCOD_color_set_HSV
     (color : access TCOD_color_t;
      hue : float;
      saturation : float;
      value : float)  -- color.h:91
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_color_set_HSV";

   procedure TCOD_color_get_HSV
     (color : TCOD_color_t;
      hue : access float;
      saturation : access float;
      value : access float)  -- color.h:92
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_color_get_HSV";

   function TCOD_color_get_hue (color : TCOD_color_t) return float  -- color.h:93
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_color_get_hue";

   procedure TCOD_color_set_hue (color : access TCOD_color_t; hue : float)  -- color.h:94
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_color_set_hue";

   function TCOD_color_get_saturation (color : TCOD_color_t) return float  -- color.h:95
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_color_get_saturation";

   procedure TCOD_color_set_saturation (color : access TCOD_color_t; saturation : float)  -- color.h:96
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_color_set_saturation";

   function TCOD_color_get_value (color : TCOD_color_t) return float  -- color.h:97
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_color_get_value";

   procedure TCOD_color_set_value (color : access TCOD_color_t; value : float)  -- color.h:98
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_color_set_value";

   procedure TCOD_color_shift_hue (color : access TCOD_color_t; shift : float)  -- color.h:99
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_color_shift_hue";

   procedure TCOD_color_scale_HSV
     (color : access TCOD_color_t;
      saturation_coef : float;
      value_coef : float)  -- color.h:100
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_color_scale_HSV";

  -- color map  
   procedure TCOD_color_gen_map
     (map : access TCOD_color_t;
      nb_key : int;
      key_color : access constant TCOD_color_t;
      key_index : access int)  -- color.h:102
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_color_gen_map";

end color_h;
