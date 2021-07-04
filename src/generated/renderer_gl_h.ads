pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with tileset_h;
with utypes_uuint32_t_h;
limited with context_h;
with System;

package renderer_gl_h is

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

   type TCOD_TilesetAtlasOpenGL is record
      tileset : access tileset_h.TCOD_Tileset;  -- renderer_gl.h:40
      observer : access tileset_h.TCOD_TilesetObserver;  -- renderer_gl.h:41
      texture : aliased utypes_uuint32_t_h.uint32_t;  -- renderer_gl.h:42
      texture_size : aliased int;  -- renderer_gl.h:43
      texture_columns : aliased int;  -- renderer_gl.h:44
      texture_rows : aliased int;  -- renderer_gl.h:45
   end record
   with Convention => C_Pass_By_Copy;  -- renderer_gl.h:39

   type TCOD_RendererGLCommon is record
      window : access context_h.SDL_Window;  -- renderer_gl.h:49
      glcontext : System.Address;  -- renderer_gl.h:50
      atlas : access TCOD_TilesetAtlasOpenGL;  -- renderer_gl.h:51
      sdl_subsystems : aliased utypes_uuint32_t_h.uint32_t;  -- renderer_gl.h:52
      last_offset_x : aliased double;  -- renderer_gl.h:54
      last_offset_y : aliased double;  -- renderer_gl.h:55
      last_scale_x : aliased double;  -- renderer_gl.h:56
      last_scale_y : aliased double;  -- renderer_gl.h:57
   end record
   with Convention => C_Pass_By_Copy;  -- renderer_gl.h:48

  -- Mouse cursor transform values of the last viewport used.
   function TCOD_gl_atlas_new (arg1 : access tileset_h.TCOD_Tileset) return access TCOD_TilesetAtlasOpenGL  -- renderer_gl.h:63
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_gl_atlas_new";

   procedure TCOD_gl_atlas_delete (atlas : access TCOD_TilesetAtlasOpenGL)  -- renderer_gl.h:64
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_gl_atlas_delete";

  -- extern "C"
end renderer_gl_h;
