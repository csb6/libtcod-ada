pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with renderer_gl_h;
with utypes_uuint32_t_h;
with Interfaces.C.Strings;
limited with tileset_h;
limited with context_h;

package renderer_gl1_h is

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

   type TCOD_RendererGL1 is record
      common : aliased renderer_gl_h.TCOD_RendererGLCommon;  -- renderer_gl1.h:43
      background_texture : aliased utypes_uuint32_t_h.uint32_t;  -- renderer_gl1.h:44
      background_width : aliased int;  -- renderer_gl1.h:45
      background_height : aliased int;  -- renderer_gl1.h:46
   end record
   with Convention => C_Pass_By_Copy;  -- renderer_gl1.h:42

   function TCOD_renderer_init_gl1
     (arg1 : int;
      arg2 : int;
      arg3 : int;
      arg4 : int;
      arg5 : Interfaces.C.Strings.chars_ptr;
      arg6 : int;
      arg7 : int;
      arg8 : access tileset_h.TCOD_Tileset) return access context_h.TCOD_Context  -- renderer_gl1.h:49
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_renderer_init_gl1";

end renderer_gl1_h;
