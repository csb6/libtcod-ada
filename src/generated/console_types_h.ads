pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;

package console_types_h is

   TCOD_KEY_TEXT_SIZE : constant := 32;  --  console_types.h:109

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

   type TCOD_keycode_t is 
     (TCODK_NONE,
      TCODK_ESCAPE,
      TCODK_BACKSPACE,
      TCODK_TAB,
      TCODK_ENTER,
      TCODK_SHIFT,
      TCODK_CONTROL,
      TCODK_ALT,
      TCODK_PAUSE,
      TCODK_CAPSLOCK,
      TCODK_PAGEUP,
      TCODK_PAGEDOWN,
      TCODK_END,
      TCODK_HOME,
      TCODK_UP,
      TCODK_LEFT,
      TCODK_RIGHT,
      TCODK_DOWN,
      TCODK_PRINTSCREEN,
      TCODK_INSERT,
      TCODK_DELETE,
      TCODK_LWIN,
      TCODK_RWIN,
      TCODK_APPS,
      TCODK_0,
      TCODK_1,
      TCODK_2,
      TCODK_3,
      TCODK_4,
      TCODK_5,
      TCODK_6,
      TCODK_7,
      TCODK_8,
      TCODK_9,
      TCODK_KP0,
      TCODK_KP1,
      TCODK_KP2,
      TCODK_KP3,
      TCODK_KP4,
      TCODK_KP5,
      TCODK_KP6,
      TCODK_KP7,
      TCODK_KP8,
      TCODK_KP9,
      TCODK_KPADD,
      TCODK_KPSUB,
      TCODK_KPDIV,
      TCODK_KPMUL,
      TCODK_KPDEC,
      TCODK_KPENTER,
      TCODK_F1,
      TCODK_F2,
      TCODK_F3,
      TCODK_F4,
      TCODK_F5,
      TCODK_F6,
      TCODK_F7,
      TCODK_F8,
      TCODK_F9,
      TCODK_F10,
      TCODK_F11,
      TCODK_F12,
      TCODK_NUMLOCK,
      TCODK_SCROLLLOCK,
      TCODK_SPACE,
      TCODK_CHAR,
      TCODK_TEXT)
   with Convention => C;  -- console_types.h:107

  -- key data : special code or character or text  
  --  key code  
  -- character if vk == TCODK_CHAR else 0  
  -- text if vk == TCODK_TEXT else text[0] == '\0'  
  -- does this correspond to a key press or key release event ?  
   subtype TCOD_key_t_array1136 is Interfaces.C.char_array (0 .. 31);
   type TCOD_key_t is record
      vk : aliased TCOD_keycode_t;  -- console_types.h:113
      c : aliased char;  -- console_types.h:114
      text : aliased TCOD_key_t_array1136;  -- console_types.h:115
      pressed : aliased Extensions.bool;  -- console_types.h:116
      lalt : aliased Extensions.bool;  -- console_types.h:117
      lctrl : aliased Extensions.bool;  -- console_types.h:118
      lmeta : aliased Extensions.bool;  -- console_types.h:119
      ralt : aliased Extensions.bool;  -- console_types.h:120
      rctrl : aliased Extensions.bool;  -- console_types.h:121
      rmeta : aliased Extensions.bool;  -- console_types.h:122
      shift : aliased Extensions.bool;  -- console_types.h:123
   end record
   with Convention => C_Pass_By_Copy;  -- console_types.h:124

  -- single walls  
  -- double walls  
  -- blocks  
  -- arrows  
  -- arrows without tail  
  -- double arrows  
  -- GUI stuff  
  -- sub-pixel resolution kit  
  -- miscellaneous  
  -- diacritics  
   subtype TCOD_chars_t is unsigned;
   TCOD_CHAR_HLINE : constant unsigned := 196;
   TCOD_CHAR_VLINE : constant unsigned := 179;
   TCOD_CHAR_NE : constant unsigned := 191;
   TCOD_CHAR_NW : constant unsigned := 218;
   TCOD_CHAR_SE : constant unsigned := 217;
   TCOD_CHAR_SW : constant unsigned := 192;
   TCOD_CHAR_TEEW : constant unsigned := 180;
   TCOD_CHAR_TEEE : constant unsigned := 195;
   TCOD_CHAR_TEEN : constant unsigned := 193;
   TCOD_CHAR_TEES : constant unsigned := 194;
   TCOD_CHAR_CROSS : constant unsigned := 197;
   TCOD_CHAR_DHLINE : constant unsigned := 205;
   TCOD_CHAR_DVLINE : constant unsigned := 186;
   TCOD_CHAR_DNE : constant unsigned := 187;
   TCOD_CHAR_DNW : constant unsigned := 201;
   TCOD_CHAR_DSE : constant unsigned := 188;
   TCOD_CHAR_DSW : constant unsigned := 200;
   TCOD_CHAR_DTEEW : constant unsigned := 185;
   TCOD_CHAR_DTEEE : constant unsigned := 204;
   TCOD_CHAR_DTEEN : constant unsigned := 202;
   TCOD_CHAR_DTEES : constant unsigned := 203;
   TCOD_CHAR_DCROSS : constant unsigned := 206;
   TCOD_CHAR_BLOCK1 : constant unsigned := 176;
   TCOD_CHAR_BLOCK2 : constant unsigned := 177;
   TCOD_CHAR_BLOCK3 : constant unsigned := 178;
   TCOD_CHAR_ARROW_N : constant unsigned := 24;
   TCOD_CHAR_ARROW_S : constant unsigned := 25;
   TCOD_CHAR_ARROW_E : constant unsigned := 26;
   TCOD_CHAR_ARROW_W : constant unsigned := 27;
   TCOD_CHAR_ARROW2_N : constant unsigned := 30;
   TCOD_CHAR_ARROW2_S : constant unsigned := 31;
   TCOD_CHAR_ARROW2_E : constant unsigned := 16;
   TCOD_CHAR_ARROW2_W : constant unsigned := 17;
   TCOD_CHAR_DARROW_H : constant unsigned := 29;
   TCOD_CHAR_DARROW_V : constant unsigned := 18;
   TCOD_CHAR_CHECKBOX_UNSET : constant unsigned := 224;
   TCOD_CHAR_CHECKBOX_SET : constant unsigned := 225;
   TCOD_CHAR_RADIO_UNSET : constant unsigned := 9;
   TCOD_CHAR_RADIO_SET : constant unsigned := 10;
   TCOD_CHAR_SUBP_NW : constant unsigned := 226;
   TCOD_CHAR_SUBP_NE : constant unsigned := 227;
   TCOD_CHAR_SUBP_N : constant unsigned := 228;
   TCOD_CHAR_SUBP_SE : constant unsigned := 229;
   TCOD_CHAR_SUBP_DIAG : constant unsigned := 230;
   TCOD_CHAR_SUBP_E : constant unsigned := 231;
   TCOD_CHAR_SUBP_SW : constant unsigned := 232;
   TCOD_CHAR_SMILIE : constant unsigned := 1;
   TCOD_CHAR_SMILIE_INV : constant unsigned := 2;
   TCOD_CHAR_HEART : constant unsigned := 3;
   TCOD_CHAR_DIAMOND : constant unsigned := 4;
   TCOD_CHAR_CLUB : constant unsigned := 5;
   TCOD_CHAR_SPADE : constant unsigned := 6;
   TCOD_CHAR_BULLET : constant unsigned := 7;
   TCOD_CHAR_BULLET_INV : constant unsigned := 8;
   TCOD_CHAR_MALE : constant unsigned := 11;
   TCOD_CHAR_FEMALE : constant unsigned := 12;
   TCOD_CHAR_NOTE : constant unsigned := 13;
   TCOD_CHAR_NOTE_DOUBLE : constant unsigned := 14;
   TCOD_CHAR_LIGHT : constant unsigned := 15;
   TCOD_CHAR_EXCLAM_DOUBLE : constant unsigned := 19;
   TCOD_CHAR_PILCROW : constant unsigned := 20;
   TCOD_CHAR_SECTION : constant unsigned := 21;
   TCOD_CHAR_POUND : constant unsigned := 156;
   TCOD_CHAR_MULTIPLICATION : constant unsigned := 158;
   TCOD_CHAR_FUNCTION : constant unsigned := 159;
   TCOD_CHAR_RESERVED : constant unsigned := 169;
   TCOD_CHAR_HALF : constant unsigned := 171;
   TCOD_CHAR_ONE_QUARTER : constant unsigned := 172;
   TCOD_CHAR_COPYRIGHT : constant unsigned := 184;
   TCOD_CHAR_CENT : constant unsigned := 189;
   TCOD_CHAR_YEN : constant unsigned := 190;
   TCOD_CHAR_CURRENCY : constant unsigned := 207;
   TCOD_CHAR_THREE_QUARTERS : constant unsigned := 243;
   TCOD_CHAR_DIVISION : constant unsigned := 246;
   TCOD_CHAR_GRADE : constant unsigned := 248;
   TCOD_CHAR_UMLAUT : constant unsigned := 249;
   TCOD_CHAR_POW1 : constant unsigned := 251;
   TCOD_CHAR_POW3 : constant unsigned := 252;
   TCOD_CHAR_POW2 : constant unsigned := 253;
   TCOD_CHAR_BULLET_SQUARE : constant unsigned := 254;  -- console_types.h:217

   subtype TCOD_key_status_t is unsigned;
   TCOD_KEY_PRESSED : constant unsigned := 1;
   TCOD_KEY_RELEASED : constant unsigned := 2;  -- console_types.h:222

  --*
  -- *  These font flags can be OR'd together into a bit-field and passed to
  -- *  TCOD_console_set_custom_font
  --  

  --* Tiles are arranged in column-major order.
  --   *
  --   *       0 3 6
  --   *       1 4 7
  --   *       2 5 8
  --    

  --* Tiles are arranged in row-major order.
  --   *
  --   *       0 1 2
  --   *       3 4 5
  --   *       6 7 8
  --    

  --* Converts all tiles into a monochrome gradient.  
  --* A unique layout used by some of libtcod's fonts.  
  --*
  --   *  Decode a code page 437 tileset into Unicode code-points.
  --   *  \rst
  --   *  .. versionadded:: 1.10
  --   *  \endrst
  --    

   subtype TCOD_font_flags_t is unsigned;
   TCOD_FONT_LAYOUT_ASCII_INCOL : constant unsigned := 1;
   TCOD_FONT_LAYOUT_ASCII_INROW : constant unsigned := 2;
   TCOD_FONT_TYPE_GREYSCALE : constant unsigned := 4;
   TCOD_FONT_TYPE_GRAYSCALE : constant unsigned := 4;
   TCOD_FONT_LAYOUT_TCOD : constant unsigned := 8;
   TCOD_FONT_LAYOUT_CP437 : constant unsigned := 16;  -- console_types.h:254

  --*
  -- *  The available renderers.
  --  

  --* Alias for TCOD_RENDERER_OPENGL2.  
  --*
  --   *  An OpenGL 1.1 implementation.
  --   *
  --   *  Performs worse than TCOD_RENDERER_GLSL without many benefits.
  --    

  --*
  --   *  A software based renderer.
  --   *
  --   *  The font file is loaded into RAM instead of VRAM in this implementation.
  --    

  --*
  --      A new SDL2 renderer.  Allows the window to be resized.
  --      You may set `SDL_HINT_RENDER_SCALE_QUALITY` to determine the tileset
  --      upscaling filter.  Either nearest or linear.  The hint will only take
  --      effect if it's set before this renderer is created.
  --      \rst
  --      .. versionadded:: 1.8
  --      \endrst
  --    

  --*
  --      A new OpenGL 2.0 core renderer.  Allows the window to be resized.
  --      You may set `SDL_HINT_RENDER_SCALE_QUALITY` to determine the tileset
  --      upscaling filter.  Either nearest or linear.  The hint will take effect
  --      on the next frame.
  --      \rst
  --      .. versionadded:: 1.9
  --      .. versionchanged:: 1.11
  --          This renderer now uses OpenGL 2.0 instead of 2.1.
  --      .. versionchanged:: 1.16
  --          Now checks the `SDL_HINT_RENDER_SCALE_QUALITY` hint.
  --      \endrst
  --    

   type TCOD_renderer_t is 
     (TCOD_RENDERER_GLSL,
      TCOD_RENDERER_OPENGL,
      TCOD_RENDERER_SDL,
      TCOD_RENDERER_SDL2,
      TCOD_RENDERER_OPENGL2,
      TCOD_NB_RENDERERS)
   with Convention => C;  -- console_types.h:305

end console_types_h;
