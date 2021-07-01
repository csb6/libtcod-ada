pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with utypes_uuint8_t_h;
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
      r : aliased utypes_uuint8_t_h.uint8_t;  -- color.h:47
      g : aliased utypes_uuint8_t_h.uint8_t;  -- color.h:48
      b : aliased utypes_uuint8_t_h.uint8_t;  -- color.h:49
   end record
   with Convention => C_Pass_By_Copy;  -- color.h:42

   subtype TCOD_color_t is TCOD_ColorRGB;  -- color.h:51

  --*
  -- *  A four channel color struct.
  --  

   type TCOD_ColorRGBA is record
      r : aliased utypes_uuint8_t_h.uint8_t;  -- color.h:63
      g : aliased utypes_uuint8_t_h.uint8_t;  -- color.h:64
      b : aliased utypes_uuint8_t_h.uint8_t;  -- color.h:65
      a : aliased utypes_uuint8_t_h.uint8_t;  -- color.h:66
   end record
   with Convention => C_Pass_By_Copy;  -- color.h:56

  -- constructors  
   function TCOD_color_RGB
     (r : utypes_uuint8_t_h.uint8_t;
      g : utypes_uuint8_t_h.uint8_t;
      b : utypes_uuint8_t_h.uint8_t) return TCOD_color_t  -- color.h:73
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

  -- color names  
  -- color levels  
  -- color array  
   TCOD_colors : aliased array (0 .. 20, 0 .. 7) of aliased TCOD_color_t  -- color.h:144
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_colors";

  -- grey levels  
   TCOD_black : aliased constant TCOD_color_t  -- color.h:147
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_black";

   TCOD_darkest_grey : aliased constant TCOD_color_t  -- color.h:148
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darkest_grey";

   TCOD_darker_grey : aliased constant TCOD_color_t  -- color.h:149
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darker_grey";

   TCOD_dark_grey : aliased constant TCOD_color_t  -- color.h:150
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dark_grey";

   TCOD_grey : aliased constant TCOD_color_t  -- color.h:151
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_grey";

   TCOD_light_grey : aliased constant TCOD_color_t  -- color.h:152
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_light_grey";

   TCOD_lighter_grey : aliased constant TCOD_color_t  -- color.h:153
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lighter_grey";

   TCOD_lightest_grey : aliased constant TCOD_color_t  -- color.h:154
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lightest_grey";

   TCOD_darkest_gray : aliased constant TCOD_color_t  -- color.h:155
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darkest_gray";

   TCOD_darker_gray : aliased constant TCOD_color_t  -- color.h:156
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darker_gray";

   TCOD_dark_gray : aliased constant TCOD_color_t  -- color.h:157
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dark_gray";

   TCOD_gray : aliased constant TCOD_color_t  -- color.h:158
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_gray";

   TCOD_light_gray : aliased constant TCOD_color_t  -- color.h:159
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_light_gray";

   TCOD_lighter_gray : aliased constant TCOD_color_t  -- color.h:160
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lighter_gray";

   TCOD_lightest_gray : aliased constant TCOD_color_t  -- color.h:161
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lightest_gray";

   TCOD_white : aliased constant TCOD_color_t  -- color.h:162
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_white";

  -- sepia  
   TCOD_darkest_sepia : aliased constant TCOD_color_t  -- color.h:165
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darkest_sepia";

   TCOD_darker_sepia : aliased constant TCOD_color_t  -- color.h:166
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darker_sepia";

   TCOD_dark_sepia : aliased constant TCOD_color_t  -- color.h:167
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dark_sepia";

   TCOD_sepia : aliased constant TCOD_color_t  -- color.h:168
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sepia";

   TCOD_light_sepia : aliased constant TCOD_color_t  -- color.h:169
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_light_sepia";

   TCOD_lighter_sepia : aliased constant TCOD_color_t  -- color.h:170
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lighter_sepia";

   TCOD_lightest_sepia : aliased constant TCOD_color_t  -- color.h:171
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lightest_sepia";

  -- standard colors  
   TCOD_red : aliased constant TCOD_color_t  -- color.h:174
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_red";

   TCOD_flame : aliased constant TCOD_color_t  -- color.h:175
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_flame";

   TCOD_orange : aliased constant TCOD_color_t  -- color.h:176
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_orange";

   TCOD_amber : aliased constant TCOD_color_t  -- color.h:177
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_amber";

   TCOD_yellow : aliased constant TCOD_color_t  -- color.h:178
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_yellow";

   TCOD_lime : aliased constant TCOD_color_t  -- color.h:179
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lime";

   TCOD_chartreuse : aliased constant TCOD_color_t  -- color.h:180
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_chartreuse";

   TCOD_green : aliased constant TCOD_color_t  -- color.h:181
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_green";

   TCOD_sea : aliased constant TCOD_color_t  -- color.h:182
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sea";

   TCOD_turquoise : aliased constant TCOD_color_t  -- color.h:183
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_turquoise";

   TCOD_cyan : aliased constant TCOD_color_t  -- color.h:184
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_cyan";

   TCOD_sky : aliased constant TCOD_color_t  -- color.h:185
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sky";

   TCOD_azure : aliased constant TCOD_color_t  -- color.h:186
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_azure";

   TCOD_blue : aliased constant TCOD_color_t  -- color.h:187
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_blue";

   TCOD_han : aliased constant TCOD_color_t  -- color.h:188
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_han";

   TCOD_violet : aliased constant TCOD_color_t  -- color.h:189
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_violet";

   TCOD_purple : aliased constant TCOD_color_t  -- color.h:190
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_purple";

   TCOD_fuchsia : aliased constant TCOD_color_t  -- color.h:191
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_fuchsia";

   TCOD_magenta : aliased constant TCOD_color_t  -- color.h:192
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_magenta";

   TCOD_pink : aliased constant TCOD_color_t  -- color.h:193
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_pink";

   TCOD_crimson : aliased constant TCOD_color_t  -- color.h:194
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_crimson";

  -- dark colors  
   TCOD_dark_red : aliased constant TCOD_color_t  -- color.h:197
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dark_red";

   TCOD_dark_flame : aliased constant TCOD_color_t  -- color.h:198
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dark_flame";

   TCOD_dark_orange : aliased constant TCOD_color_t  -- color.h:199
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dark_orange";

   TCOD_dark_amber : aliased constant TCOD_color_t  -- color.h:200
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dark_amber";

   TCOD_dark_yellow : aliased constant TCOD_color_t  -- color.h:201
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dark_yellow";

   TCOD_dark_lime : aliased constant TCOD_color_t  -- color.h:202
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dark_lime";

   TCOD_dark_chartreuse : aliased constant TCOD_color_t  -- color.h:203
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dark_chartreuse";

   TCOD_dark_green : aliased constant TCOD_color_t  -- color.h:204
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dark_green";

   TCOD_dark_sea : aliased constant TCOD_color_t  -- color.h:205
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dark_sea";

   TCOD_dark_turquoise : aliased constant TCOD_color_t  -- color.h:206
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dark_turquoise";

   TCOD_dark_cyan : aliased constant TCOD_color_t  -- color.h:207
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dark_cyan";

   TCOD_dark_sky : aliased constant TCOD_color_t  -- color.h:208
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dark_sky";

   TCOD_dark_azure : aliased constant TCOD_color_t  -- color.h:209
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dark_azure";

   TCOD_dark_blue : aliased constant TCOD_color_t  -- color.h:210
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dark_blue";

   TCOD_dark_han : aliased constant TCOD_color_t  -- color.h:211
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dark_han";

   TCOD_dark_violet : aliased constant TCOD_color_t  -- color.h:212
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dark_violet";

   TCOD_dark_purple : aliased constant TCOD_color_t  -- color.h:213
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dark_purple";

   TCOD_dark_fuchsia : aliased constant TCOD_color_t  -- color.h:214
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dark_fuchsia";

   TCOD_dark_magenta : aliased constant TCOD_color_t  -- color.h:215
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dark_magenta";

   TCOD_dark_pink : aliased constant TCOD_color_t  -- color.h:216
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dark_pink";

   TCOD_dark_crimson : aliased constant TCOD_color_t  -- color.h:217
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dark_crimson";

  -- darker colors  
   TCOD_darker_red : aliased constant TCOD_color_t  -- color.h:220
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darker_red";

   TCOD_darker_flame : aliased constant TCOD_color_t  -- color.h:221
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darker_flame";

   TCOD_darker_orange : aliased constant TCOD_color_t  -- color.h:222
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darker_orange";

   TCOD_darker_amber : aliased constant TCOD_color_t  -- color.h:223
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darker_amber";

   TCOD_darker_yellow : aliased constant TCOD_color_t  -- color.h:224
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darker_yellow";

   TCOD_darker_lime : aliased constant TCOD_color_t  -- color.h:225
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darker_lime";

   TCOD_darker_chartreuse : aliased constant TCOD_color_t  -- color.h:226
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darker_chartreuse";

   TCOD_darker_green : aliased constant TCOD_color_t  -- color.h:227
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darker_green";

   TCOD_darker_sea : aliased constant TCOD_color_t  -- color.h:228
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darker_sea";

   TCOD_darker_turquoise : aliased constant TCOD_color_t  -- color.h:229
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darker_turquoise";

   TCOD_darker_cyan : aliased constant TCOD_color_t  -- color.h:230
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darker_cyan";

   TCOD_darker_sky : aliased constant TCOD_color_t  -- color.h:231
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darker_sky";

   TCOD_darker_azure : aliased constant TCOD_color_t  -- color.h:232
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darker_azure";

   TCOD_darker_blue : aliased constant TCOD_color_t  -- color.h:233
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darker_blue";

   TCOD_darker_han : aliased constant TCOD_color_t  -- color.h:234
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darker_han";

   TCOD_darker_violet : aliased constant TCOD_color_t  -- color.h:235
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darker_violet";

   TCOD_darker_purple : aliased constant TCOD_color_t  -- color.h:236
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darker_purple";

   TCOD_darker_fuchsia : aliased constant TCOD_color_t  -- color.h:237
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darker_fuchsia";

   TCOD_darker_magenta : aliased constant TCOD_color_t  -- color.h:238
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darker_magenta";

   TCOD_darker_pink : aliased constant TCOD_color_t  -- color.h:239
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darker_pink";

   TCOD_darker_crimson : aliased constant TCOD_color_t  -- color.h:240
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darker_crimson";

  -- darkest colors  
   TCOD_darkest_red : aliased constant TCOD_color_t  -- color.h:243
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darkest_red";

   TCOD_darkest_flame : aliased constant TCOD_color_t  -- color.h:244
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darkest_flame";

   TCOD_darkest_orange : aliased constant TCOD_color_t  -- color.h:245
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darkest_orange";

   TCOD_darkest_amber : aliased constant TCOD_color_t  -- color.h:246
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darkest_amber";

   TCOD_darkest_yellow : aliased constant TCOD_color_t  -- color.h:247
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darkest_yellow";

   TCOD_darkest_lime : aliased constant TCOD_color_t  -- color.h:248
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darkest_lime";

   TCOD_darkest_chartreuse : aliased constant TCOD_color_t  -- color.h:249
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darkest_chartreuse";

   TCOD_darkest_green : aliased constant TCOD_color_t  -- color.h:250
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darkest_green";

   TCOD_darkest_sea : aliased constant TCOD_color_t  -- color.h:251
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darkest_sea";

   TCOD_darkest_turquoise : aliased constant TCOD_color_t  -- color.h:252
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darkest_turquoise";

   TCOD_darkest_cyan : aliased constant TCOD_color_t  -- color.h:253
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darkest_cyan";

   TCOD_darkest_sky : aliased constant TCOD_color_t  -- color.h:254
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darkest_sky";

   TCOD_darkest_azure : aliased constant TCOD_color_t  -- color.h:255
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darkest_azure";

   TCOD_darkest_blue : aliased constant TCOD_color_t  -- color.h:256
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darkest_blue";

   TCOD_darkest_han : aliased constant TCOD_color_t  -- color.h:257
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darkest_han";

   TCOD_darkest_violet : aliased constant TCOD_color_t  -- color.h:258
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darkest_violet";

   TCOD_darkest_purple : aliased constant TCOD_color_t  -- color.h:259
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darkest_purple";

   TCOD_darkest_fuchsia : aliased constant TCOD_color_t  -- color.h:260
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darkest_fuchsia";

   TCOD_darkest_magenta : aliased constant TCOD_color_t  -- color.h:261
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darkest_magenta";

   TCOD_darkest_pink : aliased constant TCOD_color_t  -- color.h:262
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darkest_pink";

   TCOD_darkest_crimson : aliased constant TCOD_color_t  -- color.h:263
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_darkest_crimson";

  -- light colors  
   TCOD_light_red : aliased constant TCOD_color_t  -- color.h:266
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_light_red";

   TCOD_light_flame : aliased constant TCOD_color_t  -- color.h:267
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_light_flame";

   TCOD_light_orange : aliased constant TCOD_color_t  -- color.h:268
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_light_orange";

   TCOD_light_amber : aliased constant TCOD_color_t  -- color.h:269
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_light_amber";

   TCOD_light_yellow : aliased constant TCOD_color_t  -- color.h:270
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_light_yellow";

   TCOD_light_lime : aliased constant TCOD_color_t  -- color.h:271
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_light_lime";

   TCOD_light_chartreuse : aliased constant TCOD_color_t  -- color.h:272
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_light_chartreuse";

   TCOD_light_green : aliased constant TCOD_color_t  -- color.h:273
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_light_green";

   TCOD_light_sea : aliased constant TCOD_color_t  -- color.h:274
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_light_sea";

   TCOD_light_turquoise : aliased constant TCOD_color_t  -- color.h:275
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_light_turquoise";

   TCOD_light_cyan : aliased constant TCOD_color_t  -- color.h:276
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_light_cyan";

   TCOD_light_sky : aliased constant TCOD_color_t  -- color.h:277
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_light_sky";

   TCOD_light_azure : aliased constant TCOD_color_t  -- color.h:278
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_light_azure";

   TCOD_light_blue : aliased constant TCOD_color_t  -- color.h:279
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_light_blue";

   TCOD_light_han : aliased constant TCOD_color_t  -- color.h:280
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_light_han";

   TCOD_light_violet : aliased constant TCOD_color_t  -- color.h:281
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_light_violet";

   TCOD_light_purple : aliased constant TCOD_color_t  -- color.h:282
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_light_purple";

   TCOD_light_fuchsia : aliased constant TCOD_color_t  -- color.h:283
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_light_fuchsia";

   TCOD_light_magenta : aliased constant TCOD_color_t  -- color.h:284
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_light_magenta";

   TCOD_light_pink : aliased constant TCOD_color_t  -- color.h:285
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_light_pink";

   TCOD_light_crimson : aliased constant TCOD_color_t  -- color.h:286
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_light_crimson";

  -- lighter colors  
   TCOD_lighter_red : aliased constant TCOD_color_t  -- color.h:289
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lighter_red";

   TCOD_lighter_flame : aliased constant TCOD_color_t  -- color.h:290
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lighter_flame";

   TCOD_lighter_orange : aliased constant TCOD_color_t  -- color.h:291
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lighter_orange";

   TCOD_lighter_amber : aliased constant TCOD_color_t  -- color.h:292
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lighter_amber";

   TCOD_lighter_yellow : aliased constant TCOD_color_t  -- color.h:293
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lighter_yellow";

   TCOD_lighter_lime : aliased constant TCOD_color_t  -- color.h:294
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lighter_lime";

   TCOD_lighter_chartreuse : aliased constant TCOD_color_t  -- color.h:295
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lighter_chartreuse";

   TCOD_lighter_green : aliased constant TCOD_color_t  -- color.h:296
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lighter_green";

   TCOD_lighter_sea : aliased constant TCOD_color_t  -- color.h:297
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lighter_sea";

   TCOD_lighter_turquoise : aliased constant TCOD_color_t  -- color.h:298
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lighter_turquoise";

   TCOD_lighter_cyan : aliased constant TCOD_color_t  -- color.h:299
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lighter_cyan";

   TCOD_lighter_sky : aliased constant TCOD_color_t  -- color.h:300
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lighter_sky";

   TCOD_lighter_azure : aliased constant TCOD_color_t  -- color.h:301
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lighter_azure";

   TCOD_lighter_blue : aliased constant TCOD_color_t  -- color.h:302
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lighter_blue";

   TCOD_lighter_han : aliased constant TCOD_color_t  -- color.h:303
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lighter_han";

   TCOD_lighter_violet : aliased constant TCOD_color_t  -- color.h:304
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lighter_violet";

   TCOD_lighter_purple : aliased constant TCOD_color_t  -- color.h:305
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lighter_purple";

   TCOD_lighter_fuchsia : aliased constant TCOD_color_t  -- color.h:306
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lighter_fuchsia";

   TCOD_lighter_magenta : aliased constant TCOD_color_t  -- color.h:307
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lighter_magenta";

   TCOD_lighter_pink : aliased constant TCOD_color_t  -- color.h:308
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lighter_pink";

   TCOD_lighter_crimson : aliased constant TCOD_color_t  -- color.h:309
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lighter_crimson";

  -- lightest colors  
   TCOD_lightest_red : aliased constant TCOD_color_t  -- color.h:312
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lightest_red";

   TCOD_lightest_flame : aliased constant TCOD_color_t  -- color.h:313
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lightest_flame";

   TCOD_lightest_orange : aliased constant TCOD_color_t  -- color.h:314
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lightest_orange";

   TCOD_lightest_amber : aliased constant TCOD_color_t  -- color.h:315
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lightest_amber";

   TCOD_lightest_yellow : aliased constant TCOD_color_t  -- color.h:316
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lightest_yellow";

   TCOD_lightest_lime : aliased constant TCOD_color_t  -- color.h:317
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lightest_lime";

   TCOD_lightest_chartreuse : aliased constant TCOD_color_t  -- color.h:318
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lightest_chartreuse";

   TCOD_lightest_green : aliased constant TCOD_color_t  -- color.h:319
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lightest_green";

   TCOD_lightest_sea : aliased constant TCOD_color_t  -- color.h:320
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lightest_sea";

   TCOD_lightest_turquoise : aliased constant TCOD_color_t  -- color.h:321
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lightest_turquoise";

   TCOD_lightest_cyan : aliased constant TCOD_color_t  -- color.h:322
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lightest_cyan";

   TCOD_lightest_sky : aliased constant TCOD_color_t  -- color.h:323
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lightest_sky";

   TCOD_lightest_azure : aliased constant TCOD_color_t  -- color.h:324
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lightest_azure";

   TCOD_lightest_blue : aliased constant TCOD_color_t  -- color.h:325
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lightest_blue";

   TCOD_lightest_han : aliased constant TCOD_color_t  -- color.h:326
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lightest_han";

   TCOD_lightest_violet : aliased constant TCOD_color_t  -- color.h:327
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lightest_violet";

   TCOD_lightest_purple : aliased constant TCOD_color_t  -- color.h:328
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lightest_purple";

   TCOD_lightest_fuchsia : aliased constant TCOD_color_t  -- color.h:329
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lightest_fuchsia";

   TCOD_lightest_magenta : aliased constant TCOD_color_t  -- color.h:330
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lightest_magenta";

   TCOD_lightest_pink : aliased constant TCOD_color_t  -- color.h:331
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lightest_pink";

   TCOD_lightest_crimson : aliased constant TCOD_color_t  -- color.h:332
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_lightest_crimson";

  -- desaturated  
   TCOD_desaturated_red : aliased constant TCOD_color_t  -- color.h:335
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_desaturated_red";

   TCOD_desaturated_flame : aliased constant TCOD_color_t  -- color.h:336
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_desaturated_flame";

   TCOD_desaturated_orange : aliased constant TCOD_color_t  -- color.h:337
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_desaturated_orange";

   TCOD_desaturated_amber : aliased constant TCOD_color_t  -- color.h:338
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_desaturated_amber";

   TCOD_desaturated_yellow : aliased constant TCOD_color_t  -- color.h:339
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_desaturated_yellow";

   TCOD_desaturated_lime : aliased constant TCOD_color_t  -- color.h:340
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_desaturated_lime";

   TCOD_desaturated_chartreuse : aliased constant TCOD_color_t  -- color.h:341
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_desaturated_chartreuse";

   TCOD_desaturated_green : aliased constant TCOD_color_t  -- color.h:342
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_desaturated_green";

   TCOD_desaturated_sea : aliased constant TCOD_color_t  -- color.h:343
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_desaturated_sea";

   TCOD_desaturated_turquoise : aliased constant TCOD_color_t  -- color.h:344
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_desaturated_turquoise";

   TCOD_desaturated_cyan : aliased constant TCOD_color_t  -- color.h:345
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_desaturated_cyan";

   TCOD_desaturated_sky : aliased constant TCOD_color_t  -- color.h:346
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_desaturated_sky";

   TCOD_desaturated_azure : aliased constant TCOD_color_t  -- color.h:347
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_desaturated_azure";

   TCOD_desaturated_blue : aliased constant TCOD_color_t  -- color.h:348
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_desaturated_blue";

   TCOD_desaturated_han : aliased constant TCOD_color_t  -- color.h:349
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_desaturated_han";

   TCOD_desaturated_violet : aliased constant TCOD_color_t  -- color.h:350
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_desaturated_violet";

   TCOD_desaturated_purple : aliased constant TCOD_color_t  -- color.h:351
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_desaturated_purple";

   TCOD_desaturated_fuchsia : aliased constant TCOD_color_t  -- color.h:352
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_desaturated_fuchsia";

   TCOD_desaturated_magenta : aliased constant TCOD_color_t  -- color.h:353
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_desaturated_magenta";

   TCOD_desaturated_pink : aliased constant TCOD_color_t  -- color.h:354
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_desaturated_pink";

   TCOD_desaturated_crimson : aliased constant TCOD_color_t  -- color.h:355
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_desaturated_crimson";

  -- metallic  
   TCOD_brass : aliased constant TCOD_color_t  -- color.h:358
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_brass";

   TCOD_copper : aliased constant TCOD_color_t  -- color.h:359
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_copper";

   TCOD_gold : aliased constant TCOD_color_t  -- color.h:360
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_gold";

   TCOD_silver : aliased constant TCOD_color_t  -- color.h:361
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_silver";

  -- miscellaneous  
   TCOD_celadon : aliased constant TCOD_color_t  -- color.h:364
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_celadon";

   TCOD_peach : aliased constant TCOD_color_t  -- color.h:365
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_peach";

end color_h;
