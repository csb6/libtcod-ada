pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with console_h;
limited with context_viewport_h;
with error_h;
with Interfaces.C.Strings;
limited with tileset_h;
with System;

package context_h is

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

   type SDL_Window is null record;   -- incomplete struct

   type SDL_Renderer is null record;   -- incomplete struct

   type SDL_Rect is null record;   -- incomplete struct

  -- Defined in this header later.
   type TCOD_Context;
  --*
  -- *  Delete a rendering context.
  -- *  \rst
  -- *  .. versionadded:: 1.16
  -- *  \endrst
  --  

   procedure TCOD_context_delete (renderer : access TCOD_Context)  -- context.h:62
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_context_delete";

  --*
  -- *  Create an uninitialized rendering context.
  -- *
  -- *  Used internally.
  --  

   function TCOD_context_new_u return access TCOD_Context  -- context.h:68
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_context_new_";

  --*
  --    Present a console to the screen, using a rendering context.
  --    `console` is the console to present, the console can be any size.
  --    `viewport` is the optional viewport options to use.
  --    This will affect the scaling of the console with the current context.
  --    This can be NULL to use the default options, which are to stretch the
  --    console to fit the screen.
  --    \rst
  --    .. versionadded:: 1.16
  --    \endrst
  --  

   function TCOD_context_present
     (context : access TCOD_Context;
      console : access constant console_h.TCOD_Console;
      viewport : access constant context_viewport_h.TCOD_ViewportOptions) return error_h.TCOD_Error  -- context.h:83
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_context_present";

  --*
  --    Convert the screen coordinates to tile coordinates for this context.
  --    `x` and `y` are the pointers to the screen coordinates, these will be
  --    converted to tile coordinates after the call to this function.
  --    The parameters given to the last call to `TCOD_context_present` will
  --    determine where the tiles are for this call.
  --    \rst
  --    .. versionadded:: 1.16
  --    \endrst
  --  

   function TCOD_context_screen_pixel_to_tile_d
     (context : access TCOD_Context;
      x : access double;
      y : access double) return error_h.TCOD_Error  -- context.h:98
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_context_screen_pixel_to_tile_d";

  --*
  --    Convert the screen coordinates to integer tile coordinates for this context.
  --    Save as `TCOD_context_screen_pixel_to_tile` but the inputs and results are
  --    integers.  This is useful if you don't need sub-tile coordinates.
  --    \rst
  --    .. versionadded:: 1.16
  --    \endrst
  --  

   function TCOD_context_screen_pixel_to_tile_i
     (context : access TCOD_Context;
      x : access int;
      y : access int) return error_h.TCOD_Error  -- context.h:109
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_context_screen_pixel_to_tile_i";

  --*
  --    Save the last presented console to a PNG file.
  --    \rst
  --    .. versionadded:: 1.16
  --    \endrst
  --  

   function TCOD_context_save_screenshot (context : access TCOD_Context; filename : Interfaces.C.Strings.chars_ptr) return error_h.TCOD_Error  -- context.h:117
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_context_save_screenshot";

  --*
  --    Return a pointer the SDL_Window for this context if it uses one.
  --    \rst
  --    .. versionadded:: 1.16
  --    \endrst
  --  

   function TCOD_context_get_sdl_window (arg1 : access TCOD_Context) return access SDL_Window  -- context.h:125
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_context_get_sdl_window";

  --*
  --    Return a pointer the SDL_Renderer for this context if it uses one.
  --    \rst
  --    .. versionadded:: 1.16
  --    \endrst
  --  

   function TCOD_context_get_sdl_renderer (arg1 : access TCOD_Context) return access SDL_Renderer  -- context.h:133
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_context_get_sdl_renderer";

  --*
  --    Change the active tileset for this context.
  --    \rst
  --    .. versionadded:: 1.16
  --    \endrst
  --  

   function TCOD_context_change_tileset (self : access TCOD_Context; tileset : access tileset_h.TCOD_Tileset) return error_h.TCOD_Error  -- context.h:141
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_context_change_tileset";

  --*
  --    Return the `TCOD_renderer_t` renderer type for this context.
  --    Returns a negative number on error, such as `context` being NULL.
  --    \rst
  --    .. versionadded:: 1.16
  --    \endrst
  --  

   function TCOD_context_get_renderer_type (context : access TCOD_Context) return int  -- context.h:151
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_context_get_renderer_type";

  --*
  --    Set `columns` and `rows` to the recommended console size for this context.
  --    `magnification` determines the apparent size of the tiles on the output.
  --    Values of 0.0f or lower will default to 1.0f.
  --    \rst
  --    .. versionadded:: 1.16
  --    \endrst
  --  

   function TCOD_context_recommended_console_size
     (context : access TCOD_Context;
      magnification : float;
      columns : access int;
      rows : access int) return error_h.TCOD_Error  -- context.h:162
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_context_recommended_console_size";

  -- extern "C"
  --*
  --    A rendering context for libtcod.
  --    \rst
  --    .. versionadded:: 1.16
  --    \endrst
  --  

  --*
  --      Return the TCOD_renderer_t value of this context which may be diffent
  --      than the one requested.
  --    

  --*
  --      Present a console to the display with the provided viewport options.
  --    

  --*
  --      Present a console to the display.
  --    

  --*
  --      Return a non-owning pointer to the SDL_Window used by this context.
  --      May return nullptr.
  --    

  --*
  --      Return a non-owning pointer to the SDL_Renderer used by this context.
  --      May return nullptr.
  --    

  --*
  --      Convert pixel coordinates to this contexts integer tile coordinates.
  --    

  --*
  --      Convert pixel coordinates to this contexts sub-tile coordinates.
  --    

  --*
  --      Save a screenshot to `filepath`.
  --      If `filepath` is nullptr then a unique file name will be generated.
  --    

  --*
  --      Save a screenshot to `filepath`.
  --    

  --*
  --      Return a new console with a size automatically determined by the context.
  --      `min_columns` and `min_rows` are the minimum size to use for the new
  --      console.
  --      `magnification` determines the apparent size of the tiles that will
  --      be rendered by a console created with the output values.  A
  --      `magnification` larger then 1.0f will output smaller console parameters,
  --      which will show as larger tiles when presented.
  --      Only values larger than zero are allowed.
  --    

  -- All remaining members are private.
  --*
  --      The TCOD_renderer_t value of this context.
  --    

   type TCOD_Context is record
      c_type : aliased int;  -- context.h:255
      contextdata_u : System.Address;  -- context.h:259
      c_destructor_u : access procedure (arg1 : access TCOD_Context);  -- context.h:264
      c_present_u : access function
           (arg1 : access TCOD_Context;
            arg2 : access constant console_h.TCOD_Console;
            arg3 : access constant context_viewport_h.TCOD_ViewportOptions) return error_h.TCOD_Error;  -- context.h:272
      c_pixel_to_tile_u : access procedure
           (arg1 : access TCOD_Context;
            arg2 : access double;
            arg3 : access double);  -- context.h:279
      c_save_screenshot_u : access function (arg1 : access TCOD_Context; arg2 : Interfaces.C.Strings.chars_ptr) return error_h.TCOD_Error;  -- context.h:283
      c_get_sdl_window_u : access function (arg1 : access TCOD_Context) return access SDL_Window;  -- context.h:287
      c_get_sdl_renderer_u : access function (arg1 : access TCOD_Context) return access SDL_Renderer;  -- context.h:291
      c_accumulate_u : access function
           (arg1 : access TCOD_Context;
            arg2 : access constant console_h.TCOD_Console;
            arg3 : access constant context_viewport_h.TCOD_ViewportOptions) return error_h.TCOD_Error;  -- context.h:296
      c_set_tileset_u : access function (arg1 : access TCOD_Context; arg2 : access tileset_h.TCOD_Tileset) return error_h.TCOD_Error;  -- context.h:303
      c_recommended_console_size_u : access function
           (arg1 : access TCOD_Context;
            arg2 : float;
            arg3 : access int;
            arg4 : access int) return error_h.TCOD_Error;  -- context.h:310
   end record
   with Convention => C_Pass_By_Copy;  -- context.h:173

  --*
  --      A pointer to this contexts unique data.
  --    

  -- Context C callback are prefixed with 'c_', always check if see if these are NULL.
  --*
  --      Called when this context is deleted.
  --    

  --*
  --      Called to present a console to a contexts display.
  --      `console` must not be NULL.
  --      `viewport` may be NULL.
  --    

  --*
  --      Convert pixel coordinates to the contexts tile coordinates.
  --    

  --*
  --      Ask this context to save a screenshot.
  --    

  --*
  --      Return this contexts SDL_Window, if any.
  --    

  --*
  --      Return this contexts SDL_Renderer, if any.
  --    

  --*
  --      Draw a console without flipping the display.
  --      This method of drawing is deprecated.
  --    

  --*
  --      Change the tileset used by this context.
  --   

  --*
  --      Output the recommended console size to `columns` and `rows`.
  --      `magnification` determines the apparent size of tiles,
  --      but might be ignored.
  --   

  -- namespace tcod
end context_h;
