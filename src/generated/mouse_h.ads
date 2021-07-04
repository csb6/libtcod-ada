pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;
with mouse_types_h;

package mouse_h is

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

   procedure TCOD_mouse_show_cursor (visible : Extensions.bool)  -- mouse.h:42
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_mouse_show_cursor";

   function TCOD_mouse_get_status return mouse_types_h.TCOD_mouse_t  -- mouse.h:45
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_mouse_get_status";

   function TCOD_mouse_is_cursor_visible return Extensions.bool  -- mouse.h:48
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_mouse_is_cursor_visible";

   procedure TCOD_mouse_move (x : int; y : int)  -- mouse.h:51
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_mouse_move";

   procedure TCOD_mouse_includes_touch (enable : Extensions.bool)  -- mouse.h:54
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_mouse_includes_touch";

end mouse_h;
