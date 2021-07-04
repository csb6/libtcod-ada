pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with tileset_h;
with Interfaces.C.Strings;
with System;
with Interfaces.C.Extensions;
with error_h;

package context_init_h is

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
  --    A struct of paramers used to create a new context with `TCOD_context_new`.
  --  

  --*
  --      Must be `TCOD_COMPILEDVERSION`.
  --    

   type TCOD_ContextParams is record
      tcod_version : aliased int;  -- context_init.h:47
      window_x : aliased int;  -- context_init.h:56
      window_y : aliased int;  -- context_init.h:56
      pixel_width : aliased int;  -- context_init.h:61
      pixel_height : aliased int;  -- context_init.h:61
      columns : aliased int;  -- context_init.h:66
      rows : aliased int;  -- context_init.h:66
      renderer_type : aliased int;  -- context_init.h:70
      tileset : access tileset_h.TCOD_Tileset;  -- context_init.h:77
      vsync : aliased int;  -- context_init.h:82
      sdl_window_flags : aliased int;  -- context_init.h:90
      window_title : Interfaces.C.Strings.chars_ptr;  -- context_init.h:94
      argc : aliased int;  -- context_init.h:98
      argv : System.Address;  -- context_init.h:105
      cli_output : access procedure (arg1 : System.Address; arg2 : Interfaces.C.Strings.chars_ptr);  -- context_init.h:114
      cli_userdata : System.Address;  -- context_init.h:118
      window_xy_defined : aliased Extensions.bool;  -- context_init.h:123
   end record
   with Convention => C_Pass_By_Copy;  -- context_init.h:43

  --*
  --      `window_x` and `window_y` are the starting position of the window.
  --      These are SDL parameters so values like `SDL_WINDOWPOS_UNDEFINED` and
  --      `SDL_WINDOWPOS_CENTERED` are acceptable.
  --      Values of zero will be converted to `SDL_WINDOWPOS_UNDEFINED` unless
  --      `window_xy_defined` is true.
  --    

  --*
  --      `pixel_width` and `pixel_height` are the desired size of the window in pixels.
  --      If these are zero then they'll be derived from `columns`, `rows`, and the `tileset`.
  --    

  --*
  --      `columns` and `rows` are the desired size of the terminal window.
  --      Usually you'll set either these or the pixel resolution.
  --    

  --*
  --      `renderer_type` is one of the `TCOD_renderer_t` values.
  --    

  --*
  --      `tileset` is an optional pointer to a tileset object.
  --      If this is NULL then a platform specific fallback tileset will be used.
  --      This fallback is known to be unreliable, but it should work well enough
  --      for prototyping code.
  --    

  --*
  --      If `vsync` is true, then vertical sync will be enabled whenever possible.
  --      A value of true is recommended.
  --    

  --*
  --      `sdl_window_flags` is a bitfield of SDL_WindowFlags flags.
  --      For a window, a value of ``SDL_WINDOW_RESIZABLE`` is recommended.
  --      For fullscreen, a value of
  --      ``SDL_WINDOW_RESIZABLE | SDL_WINDOW_FULLSCREEN_DESKTOP`` is recommended.
  --      You should avoid the ``SDL_WINDOW_FULLSCREEN`` flag whenever possible.
  --    

  --*
  --      `window_title` will be the title of the opened window.
  --    

  --*
  --      The number of items in `argv`.
  --    

  --*
  --      `argc` and `argv` are optional CLI parameters.
  --      You can pass `0` and `NULL` respectfully to ignore them.
  --      If unsure then you should pass the `argc` and `argv` arguments from your
  --      `main` function.
  --    

  --*
  --      If user attention is required for the given CLI parameters then
  --      `cli_output` will be called with `cli_userdata` and an error or help
  --      message.
  --      If `cli_output` is NULL then it will print the message to stdout and
  --      terminate the program.  If `cli_output` returns normally then
  --      TCOD_E_REQUIRES_ATTENTION will be returned from `TCOD_context_new`.
  --    

  --*
  --      This is passed to the `userdata` parameter of `cli_output` if called.
  --    

  --*
  --      If this is false then `window_x`/`window_y` parameters of zero are
  --      assumed to be undefined and will be changed to `SDL_WINDOWPOS_UNDEFINED`.
  --    

  --*
  --    Create a new context with the given parameters.
  --    `params` is a non-NULL pointer to a TCOD_ContextParams struct.
  --    See its documentation for info on the parameters.
  --    `out` is the output for the `TCOD_Context`, must not be NULL.
  --    \rst
  --    .. versionadded:: 1.16
  --    \endrst
  --  

   function TCOD_context_new (params : access constant TCOD_ContextParams; c_out : System.Address) return error_h.TCOD_Error  -- context_init.h:140
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_context_new";

  -- extern "C"
  -- namespace tcod
end context_init_h;
