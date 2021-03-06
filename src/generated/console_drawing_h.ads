pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with console_h;
with Interfaces.C.Extensions;
limited with color_h;
with error_h;

package console_drawing_h is

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
  -- *  Draw a rectangle onto a console.
  -- *
  -- *  \param con A console pointer.
  -- *  \param x The starting region, the left-most position being 0.
  -- *  \param y The starting region, the top-most position being 0.
  -- *  \param rw The width of the rectangle.
  -- *  \param rh The height of the rectangle.
  -- *  \param clear If true the drawing region will be filled with spaces.
  -- *  \param flag The blending flag to use.
  --

   procedure TCOD_console_rect
     (con : access console_h.TCOD_Console;
      x : int;
      y : int;
      w : int;
      h : int;
      clear : Extensions.bool;
      flag : console_h.TCOD_bkgnd_flag_t)  -- console_drawing.h:50
   with Import => True,
        Convention => C,
        External_Name => "TCOD_console_rect";

  --*
  -- *  Draw a horizontal line using the default colors.
  -- *
  -- *  \param con A console pointer.
  -- *  \param x The starting X coordinate, the left-most position being 0.
  -- *  \param y The starting Y coordinate, the top-most position being 0.
  -- *  \param l The width of the line.
  -- *  \param flag The blending flag.
  -- *
  -- *  This function makes assumptions about the fonts character encoding.
  -- *  It will fail if the font encoding is not `cp437`.
  --

   procedure TCOD_console_hline
     (con : access console_h.TCOD_Console;
      x : int;
      y : int;
      l : int;
      flag : console_h.TCOD_bkgnd_flag_t)  -- console_drawing.h:63
   with Import => True,
        Convention => C,
        External_Name => "TCOD_console_hline";

  --*
  -- *  Draw a vertical line using the default colors.
  -- *
  -- *  \param con A console pointer.
  -- *  \param x The starting X coordinate, the left-most position being 0.
  -- *  \param y The starting Y coordinate, the top-most position being 0.
  -- *  \param l The height of the line.
  -- *  \param flag The blending flag.
  -- *
  -- *  This function makes assumptions about the fonts character encoding.
  -- *  It will fail if the font encoding is not `cp437`.
  --

   procedure TCOD_console_vline
     (con : access console_h.TCOD_Console;
      x : int;
      y : int;
      l : int;
      flag : console_h.TCOD_bkgnd_flag_t)  -- console_drawing.h:76
   with Import => True,
        Convention => C,
        External_Name => "TCOD_console_vline";

  -- Next functions are provisional unless given an added version.
  --*
  -- *  Place a single tile on a `console` at `x`,`y`.
  -- *
  -- *  If `ch` is 0 then the character code will not be updated.
  -- *
  -- *  If `fg`,`bg` is NULL then their respective colors will not be updated.
  --

--     procedure TCOD_console_put_rgb
--       (console : access console_h.TCOD_Console;
--        x : int;
--        y : int;
--        ch : int;
--        fg : access constant color_h.TCOD_color_t;
--        bg : access constant color_h.TCOD_color_t;
--        flag : console_h.TCOD_bkgnd_flag_t)  -- console_drawing.h:85
--     with Import => True,
--          Convention => C,
--          External_Name => "TCOD_console_put_rgb";

  --*
  -- *  Draw a rectangle on a `console` with a shape of `x`,`y`,`width`,`height`.
  -- *
  -- *  If `ch` is 0 then the character code will not be updated.
  -- *
  -- *  If `fg`,`bg` is NULL then their respective colors will not be updated.
  --

--     procedure TCOD_console_draw_rect_rgb
--       (console : access console_h.TCOD_Console;
--        x : int;
--        y : int;
--        width : int;
--        height : int;
--        ch : int;
--        fg : access constant color_h.TCOD_color_t;
--        bg : access constant color_h.TCOD_color_t;
--        flag : console_h.TCOD_bkgnd_flag_t)  -- console_drawing.h:100
--     with Import => True,
--          Convention => C,
--          External_Name => "TCOD_console_draw_rect_rgb";

  --*
  --    Draw a decorated frame onto `console` with the shape of `x`, `y`, `width`,
  --    `height`.
  --    `decoration[9]` is an optional array of Unicode codepoints.  If left as
  --    NULL then a single-pipe decoration is used by default.
  --    If `decoration[9]` is given the codepoints are used for the edges, corners,
  --    and fill of the frame in this order:
  --        0 1 2
  --        3 4 5
  --        6 7 8
  --    If `fg` or `bg` is NULL then their respective colors will not be updated.
  --    If `clear` is true then the inner area of the frame is filled with the
  --    inner decoraction, which is typically space.
  --

   function TCOD_console_draw_frame_rgb
     (con : access console_h.TCOD_Console;
      x : int;
      y : int;
      width : int;
      height : int;
      decoration : access int;
      fg : access constant color_h.TCOD_ColorRGB;
      bg : access constant color_h.TCOD_ColorRGB;
      flag : console_h.TCOD_bkgnd_flag_t;
      clear : Extensions.bool) return error_h.TCOD_Error  -- console_drawing.h:129
   with Import => True,
        Convention => C,
        External_Name => "TCOD_console_draw_frame_rgb";

  -- extern "C"
end console_drawing_h;
