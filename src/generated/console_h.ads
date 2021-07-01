pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with color_h;
with Interfaces.C.Extensions;
with System;
with utypes_uuint8_t_h;

package console_h is

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
  -- *  \enum TCOD_bkgnd_flag_t
  -- *
  -- *  Background color blend modes.
  --  

   type TCOD_bkgnd_flag_t is 
     (TCOD_BKGND_NONE,
      TCOD_BKGND_SET,
      TCOD_BKGND_MULTIPLY,
      TCOD_BKGND_LIGHTEN,
      TCOD_BKGND_DARKEN,
      TCOD_BKGND_SCREEN,
      TCOD_BKGND_COLOR_DODGE,
      TCOD_BKGND_COLOR_BURN,
      TCOD_BKGND_ADD,
      TCOD_BKGND_ADDA,
      TCOD_BKGND_BURN,
      TCOD_BKGND_OVERLAY,
      TCOD_BKGND_ALPH,
      TCOD_BKGND_DEFAULT)
   with Convention => C;  -- console.h:66

  --*
  -- *  \enum TCOD_alignment_t
  -- *
  -- *  Print justification options.
  --  

   type TCOD_alignment_t is 
     (TCOD_LEFT,
      TCOD_RIGHT,
      TCOD_CENTER)
   with Convention => C;  -- console.h:72

  --*
  --    A console tile.
  --  

  --*
  --      The Unicode codepoint for this tile.
  --    

   type TCOD_ConsoleTile is record
      ch : aliased int;  -- console.h:84
      fg : aliased color_h.TCOD_ColorRGBA;  -- console.h:88
      bg : aliased color_h.TCOD_ColorRGBA;  -- console.h:92
   end record
   with Convention => C_Pass_By_Copy;  -- console.h:76

  --*
  --      The tile glyph color, rendered on top of the background.
  --    

  --*
  --      The tile background color, rendered behind the glyph.
  --    

  --*
  --    The libtcod console struct.
  --    All attributes should be considered private.
  --    All C++ methods should be considered provisional, and are subject to
  --    change.
  --  

  --*
  --      Return a reference to the tile at `xy`.
  --    

  --*
  --      Return a constant reference to the tile at `xy`.
  --    

  --*
  --      Return a reference to the tile at `x`,`y`.
  --      Throws if the index is out-of-bounds.
  --    

  --*
  --      Return a constant reference to the tile at `x`,`y`.
  --      Throws if the index is out-of-bounds.
  --    

  --*
  --      Return the total number of tiles in this console.
  --    

  --*
  --      Internal function.  Throws `std::out_of_range` if `x` or `y` is out-of-bounds.
  --    

  --*
  --      Return true if `x`,`y` are within the bounds of this console.
  --    

  --* Console width and height (in characters, not pixels.)  
   type TCOD_Console;
   type TCOD_Console is record
      w : aliased int;  -- console.h:156
      h : aliased int;  -- console.h:156
      tiles : access TCOD_ConsoleTile;  -- console.h:158
      bkgnd_flag : aliased TCOD_bkgnd_flag_t;  -- console.h:160
      alignment : aliased TCOD_alignment_t;  -- console.h:162
      fore : aliased color_h.TCOD_color_t;  -- console.h:164
      back : aliased color_h.TCOD_color_t;  -- console.h:164
      has_key_color : aliased Extensions.bool;  -- console.h:166
      key_color : aliased color_h.TCOD_color_t;  -- console.h:168
      elements : aliased int;  -- console.h:176
      userdata : System.Address;  -- console.h:182
      on_delete : access procedure (arg1 : access TCOD_Console);  -- console.h:184
   end record
   with Convention => C_Pass_By_Copy;  -- console.h:102

  --* A contiguous array of console tiles.  
  --* Default background operator for print & print_rect functions.  
  --* Default alignment for print & print_rect functions.  
  --* Foreground (text) and background colors.  
  --* True if a key color is being used.  
  --* The current key color for this console.  
  --*
  --      The total length of the tiles array.  Same as `w * h`.
  --      \rst
  --      .. versionadded:: 1.16
  --      \endrst
  --    

  --*
  --      \rst
  --      .. versionadded:: 1.16
  --      \endrst
  --    

  --* Internal use.  
   type TCOD_console_t is access all TCOD_Console;  -- console.h:187

  --*
  -- *  Return a new console with a specific number of columns and rows.
  -- *
  -- *  \param w Number of columns.
  -- *  \param h Number of columns.
  -- *  \return A pointer to the new console, or NULL on error.
  --  

   function TCOD_console_new (arg1 : int; arg2 : int) return access TCOD_Console  -- console.h:198
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_new";

  --*
  -- *  Return the width of a console.
  --  

   function TCOD_console_get_width (con : access constant TCOD_Console) return int  -- console.h:202
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_get_width";

  --*
  -- *  Return the height of a console.
  --  

   function TCOD_console_get_height (con : access constant TCOD_Console) return int  -- console.h:206
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_get_height";

   procedure TCOD_console_set_key_color (con : access TCOD_Console; col : color_h.TCOD_color_t)  -- console.h:207
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_set_key_color";

  --*
  -- *  Blit from one console to another.
  -- *
  -- *  \param srcCon Pointer to the source console.
  -- *  \param xSrc The left region of the source console to blit from.
  -- *  \param ySrc The top region of the source console to blit from.
  -- *  \param wSrc The width of the region to blit from.
  -- *              If 0 then it will fill to the maximum width.
  -- *  \param hSrc The height of the region to blit from.
  -- *              If 0 then it will fill to the maximum height.
  -- *  \param dstCon Pointer to the destination console.
  -- *  \param xDst The left corner to blit onto the destination console.
  -- *  \param yDst The top corner to blit onto the destination console.
  -- *  \param foreground_alpha Foreground blending alpha.
  -- *  \param background_alpha Background blending alpha.
  -- *
  -- *  If the source console has a key color, this function will use it.
  -- *  \rst
  -- *  .. versionchanged:: 1.16
  -- *      Blits can now handle per-cell alpha transparency.
  -- *  \endrst
  --  

   procedure TCOD_console_blit
     (src : access constant TCOD_Console;
      xSrc : int;
      ySrc : int;
      wSrc : int;
      hSrc : int;
      dst : access TCOD_Console;
      xDst : int;
      yDst : int;
      foreground_alpha : float;
      background_alpha : float)  -- console.h:230
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_blit";

   procedure TCOD_console_blit_key_color
     (src : access constant TCOD_Console;
      xSrc : int;
      ySrc : int;
      wSrc : int;
      hSrc : int;
      dst : access TCOD_Console;
      xDst : int;
      yDst : int;
      foreground_alpha : float;
      background_alpha : float;
      key_color : access constant color_h.TCOD_color_t)  -- console.h:241
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_blit_key_color";

  --*
  -- *  Delete a console.
  -- *
  -- *  \param con A console pointer.
  -- *
  -- *  If the console being deleted is the root console, then the display will be
  -- *  uninitialized.
  --  

   procedure TCOD_console_delete (console : access TCOD_Console)  -- console.h:261
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_delete";

   procedure TCOD_console_set_default_background (con : access TCOD_Console; col : color_h.TCOD_color_t)  -- console.h:263
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_set_default_background";

   procedure TCOD_console_set_default_foreground (con : access TCOD_Console; col : color_h.TCOD_color_t)  -- console.h:264
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_set_default_foreground";

  --*
  -- *  Clear a console to its default colors and the space character code.
  --  

   procedure TCOD_console_clear (con : access TCOD_Console)  -- console.h:268
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_clear";

  --*
  -- *  Blend a background color onto a console tile.
  -- *
  -- *  \param con A console pointer.
  -- *  \param x The X coordinate, the left-most position being 0.
  -- *  \param y The Y coordinate, the top-most position being 0.
  -- *  \param col The background color to blend.
  -- *  \param flag The blend mode to use.
  --  

   procedure TCOD_console_set_char_background
     (con : access TCOD_Console;
      x : int;
      y : int;
      col : color_h.TCOD_color_t;
      flag : TCOD_bkgnd_flag_t)  -- console.h:278
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_set_char_background";

  --*
  -- *  Change the foreground color of a console tile.
  -- *
  -- *  \param con A console pointer.
  -- *  \param x The X coordinate, the left-most position being 0.
  -- *  \param y The Y coordinate, the top-most position being 0.
  -- *  \param col The foreground color to set.
  --  

   procedure TCOD_console_set_char_foreground
     (con : access TCOD_Console;
      x : int;
      y : int;
      col : color_h.TCOD_color_t)  -- console.h:288
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_set_char_foreground";

  --*
  -- *  Change a character on a console tile, without changing its colors.
  -- *
  -- *  \param con A console pointer.
  -- *  \param x The X coordinate, the left-most position being 0.
  -- *  \param y The Y coordinate, the top-most position being 0.
  -- *  \param c The character code to set.
  --  

   procedure TCOD_console_set_char
     (con : access TCOD_Console;
      x : int;
      y : int;
      c : int)  -- console.h:297
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_set_char";

  --*
  -- *  Draw a character on a console using the default colors.
  -- *
  -- *  \param con A console pointer.
  -- *  \param x The X coordinate, the left-most position being 0.
  -- *  \param y The Y coordinate, the top-most position being 0.
  -- *  \param c The character code to place.
  -- *  \param flag A TCOD_bkgnd_flag_t flag.
  --  

   procedure TCOD_console_put_char
     (con : access TCOD_Console;
      x : int;
      y : int;
      c : int;
      flag : TCOD_bkgnd_flag_t)  -- console.h:307
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_put_char";

  --*
  -- *  Draw a character on the console with the given colors.
  -- *
  -- *  \param con A console pointer.
  -- *  \param x The X coordinate, the left-most position being 0.
  -- *  \param y The Y coordinate, the top-most position being 0.
  -- *  \param c The character code to place.
  -- *  \param fore The foreground color.
  -- *  \param back The background color.  This color will not be blended.
  --  

   procedure TCOD_console_put_char_ex
     (con : access TCOD_Console;
      x : int;
      y : int;
      c : int;
      fore : color_h.TCOD_color_t;
      back : color_h.TCOD_color_t)  -- console.h:318
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_put_char_ex";

  --*
  -- *  Set a consoles default background flag.
  -- *
  -- *  \param con A console pointer.
  -- *  \param flag One of `TCOD_bkgnd_flag_t`.
  --  

   procedure TCOD_console_set_background_flag (con : access TCOD_Console; flag : TCOD_bkgnd_flag_t)  -- console.h:325
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_set_background_flag";

  --*
  -- *  Return a consoles default background flag.
  --  

   function TCOD_console_get_background_flag (con : access TCOD_Console) return TCOD_bkgnd_flag_t  -- console.h:329
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_get_background_flag";

  --*
  -- *  Set a consoles default alignment.
  -- *
  -- *  \param con A console pointer.
  -- *  \param alignment One of TCOD_alignment_t
  --  

   procedure TCOD_console_set_alignment (con : access TCOD_Console; alignment : TCOD_alignment_t)  -- console.h:336
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_set_alignment";

  --*
  -- *  Return a consoles default alignment.
  --  

   function TCOD_console_get_alignment (con : access TCOD_Console) return TCOD_alignment_t  -- console.h:340
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_get_alignment";

   function TCOD_console_get_default_background (con : access TCOD_Console) return color_h.TCOD_color_t  -- console.h:342
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_get_default_background";

   function TCOD_console_get_default_foreground (con : access TCOD_Console) return color_h.TCOD_color_t  -- console.h:343
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_get_default_foreground";

  --*
  -- *  Return the background color of a console at x,y
  -- *
  -- *  \param con A console pointer.
  -- *  \param x The X coordinate, the left-most position being 0.
  -- *  \param y The Y coordinate, the top-most position being 0.
  -- *  \return A TCOD_color_t struct with a copy of the background color.
  --  

   function TCOD_console_get_char_background
     (con : access constant TCOD_Console;
      x : int;
      y : int) return color_h.TCOD_color_t  -- console.h:352
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_get_char_background";

  --*
  -- *  Return the foreground color of a console at x,y
  -- *
  -- *  \param con A console pointer.
  -- *  \param x The X coordinate, the left-most position being 0.
  -- *  \param y The Y coordinate, the top-most position being 0.
  -- *  \return A TCOD_color_t struct with a copy of the foreground color.
  --  

   function TCOD_console_get_char_foreground
     (con : access constant TCOD_Console;
      x : int;
      y : int) return color_h.TCOD_color_t  -- console.h:361
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_get_char_foreground";

  --*
  -- *  Return a character code of a console at x,y
  -- *
  -- *  \param con A console pointer.
  -- *  \param x The X coordinate, the left-most position being 0.
  -- *  \param y The Y coordinate, the top-most position being 0.
  -- *  \return The character code.
  --  

   function TCOD_console_get_char
     (con : access constant TCOD_Console;
      x : int;
      y : int) return int  -- console.h:370
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_get_char";

  --*
  -- *  Fade the color of the display.
  -- *
  -- *  \param val Where at 255 colors are normal and at 0 colors are completely
  -- *             faded.
  -- *  \param fadecol Color to fade towards.
  --  

   procedure TCOD_console_set_fade (val : utypes_uuint8_t_h.uint8_t; fade : color_h.TCOD_color_t)  -- console.h:379
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_set_fade";

  --*
  -- *  Return the fade value.
  -- *
  -- *  \return At 255 colors are normal and at 0 colors are completely faded.
  --  

   function TCOD_console_get_fade return utypes_uuint8_t_h.uint8_t  -- console.h:385
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_get_fade";

  --*
  -- *  Return the fade color.
  -- *
  -- *  \return The current fading color.
  --  

   function TCOD_console_get_fading_color return color_h.TCOD_color_t  -- console.h:391
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_get_fading_color";

   procedure TCOD_console_resize_u
     (console : access TCOD_Console;
      width : int;
      height : int)  -- console.h:392
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_console_resize_";

  -- extern "C"
  -- namespace tcod
end console_h;
