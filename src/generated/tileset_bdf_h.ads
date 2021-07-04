pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
limited with tileset_h;

package tileset_bdf_h is

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
  --    Load a BDF font from a file path.
  --    For the best results, you should use a BDF font with a cell-based
  --    monospace alignment.
  --    May return NULL on failure.  See `TCOD_get_error` for the error message.
  --    \rst
  --    .. versionadded:: 1.16
  --    \endrst
  --  

   function TCOD_load_bdf (arg1 : Interfaces.C.Strings.chars_ptr) return access tileset_h.TCOD_Tileset  -- tileset_bdf.h:57
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_load_bdf";

  --*
  --    Load a BDF font from memory.
  --    `size` is the byte length of `buffer`.  `buffer` is the BDF data to load.
  --    May return NULL on failure.  See `TCOD_get_error` for the error message.
  --    \rst
  --    .. versionadded:: 1.16
  --    \endrst
  --  

   function TCOD_load_bdf_memory (arg1 : int; arg2 : access unsigned_char) return access tileset_h.TCOD_Tileset  -- tileset_bdf.h:69
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_load_bdf_memory";

  -- extern "C"
  --*
  --    Load a Tileset from a BDF font file.
  --    Will throw on an error.
  --  

  -- namespace tcod
end tileset_bdf_h;
