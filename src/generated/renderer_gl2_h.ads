pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with utypes_uuint32_t_h;
with renderer_gl_h;
with Interfaces.C.Strings;
limited with tileset_h;
limited with context_h;

package renderer_gl2_h is

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

   type anon2318_array2319 is array (0 .. 2) of aliased utypes_uuint32_t_h.uint32_t;
   type TCOD_RendererGL2 is record
      common : aliased renderer_gl_h.TCOD_RendererGLCommon;  -- renderer_gl2.h:43
      program : aliased utypes_uuint32_t_h.uint32_t;  -- renderer_gl2.h:44
      console_textures : aliased anon2318_array2319;  -- renderer_gl2.h:45
      console_width : aliased int;  -- renderer_gl2.h:46
      console_height : aliased int;  -- renderer_gl2.h:47
      vertex_buffer : aliased utypes_uuint32_t_h.uint32_t;  -- renderer_gl2.h:48
   end record
   with Convention => C_Pass_By_Copy;  -- renderer_gl2.h:42

  -- ch, fg, bg
   function TCOD_renderer_new_gl2
     (arg1 : int;
      arg2 : int;
      arg3 : int;
      arg4 : int;
      arg5 : Interfaces.C.Strings.chars_ptr;
      arg6 : int;
      arg7 : int;
      arg8 : access tileset_h.TCOD_Tileset) return access context_h.TCOD_Context  -- renderer_gl2.h:51
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_renderer_new_gl2";

end renderer_gl2_h;
