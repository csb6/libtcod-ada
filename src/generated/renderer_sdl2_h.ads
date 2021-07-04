pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with context_h;
limited with tileset_h;
limited with console_h;
with utypes_uuint32_t_h;
with Interfaces.C.Strings;
with System;
with error_h;

package renderer_sdl2_h is

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

   type SDL_Texture is null record;   -- incomplete struct

  --*
  --    An SDL2 tileset atlas.  This prepares a tileset for use with SDL2.
  --    \rst
  --    .. versionadded:: 1.16
  --    \endrst
  --  

  --* The renderer used to create this atlas.  
   type TCOD_TilesetAtlasSDL2 is record
      renderer : access context_h.SDL_Renderer;  -- renderer_sdl2.h:54
      texture : access SDL_Texture;  -- renderer_sdl2.h:56
      tileset : access tileset_h.TCOD_Tileset;  -- renderer_sdl2.h:58
      observer : access tileset_h.TCOD_TilesetObserver;  -- renderer_sdl2.h:60
      texture_columns : aliased int;  -- renderer_sdl2.h:62
   end record
   with Convention => C_Pass_By_Copy;  -- renderer_sdl2.h:52

  --* The atlas texture.  
  --* The tileset used to create this atlas. Internal use only.  
  --* Internal use only.  
  --* Internal use only.  
  --*
  --    The renderer data for an SDL2 rendering context.
  --    Internal use only.
  --  

   type TCOD_RendererSDL2 is record
      window : access context_h.SDL_Window;  -- renderer_sdl2.h:70
      renderer : access context_h.SDL_Renderer;  -- renderer_sdl2.h:71
      atlas : access TCOD_TilesetAtlasSDL2;  -- renderer_sdl2.h:72
      cache_console : access console_h.TCOD_Console;  -- renderer_sdl2.h:73
      cache_texture : access SDL_Texture;  -- renderer_sdl2.h:74
      sdl_subsystems : aliased utypes_uuint32_t_h.uint32_t;  -- renderer_sdl2.h:75
      last_offset_x : aliased double;  -- renderer_sdl2.h:77
      last_offset_y : aliased double;  -- renderer_sdl2.h:78
      last_scale_x : aliased double;  -- renderer_sdl2.h:79
      last_scale_y : aliased double;  -- renderer_sdl2.h:80
   end record
   with Convention => C_Pass_By_Copy;  -- renderer_sdl2.h:69

  -- Mouse cursor transform values of the last viewport used.
  --*
  --    Return a libtcod rendering context using an SDL2 renderer.
  --  

   function TCOD_renderer_init_sdl2
     (arg1 : int;
      arg2 : int;
      arg3 : int;
      arg4 : int;
      arg5 : Interfaces.C.Strings.chars_ptr;
      arg6 : int;
      arg7 : int;
      arg8 : access tileset_h.TCOD_Tileset) return access context_h.TCOD_Context  -- renderer_sdl2.h:88
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_renderer_init_sdl2";

  --*
  --    Return a new SDL2 atlas created from a tileset for an SDL2 renderer.
  --    You may delete the tileset if you no longer have use for it.
  --    Will return NULL on an error, you can check the error with
  --    `TCOD_get_error`.
  --  

   function TCOD_sdl2_atlas_new (arg1 : access context_h.SDL_Renderer; arg2 : access tileset_h.TCOD_Tileset) return access TCOD_TilesetAtlasSDL2  -- renderer_sdl2.h:105
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sdl2_atlas_new";

  --*
  --    Delete an SDL2 tileset atlas.
  --  

   procedure TCOD_sdl2_atlas_delete (atlas : access TCOD_TilesetAtlasSDL2)  -- renderer_sdl2.h:110
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sdl2_atlas_delete";

  --*
  --    Setup a cache and target texture for rendering.
  --    `atlas` is an SDL2 atlas created with `TCOD_sdl2_atlas_new`.
  --    The renderer used to make this `atlas` must support
  --    `SDL_RENDERER_TARGETTEXTURE`.
  --    `console` is a non-NULL pointer to the libtcod console you want to render.
  --    `cache` can be NULL, or be pointer to a console pointer.
  --    If `*cache` is NULL then a console will be created.
  --    If `*cache` isn't NULL then the console pointed to might be deleted or
  --    recreated if it does not match the size of `console`.
  --    `target` must be a pointer to where you want the output texture to be placed.
  --    The texture at `*target` may be deleted or recreated.  When this function
  --    is successful then the texture at `*target` will be non-NULL and will be
  --    exactly fitted to the size of `console` and the tile size of `atlas`.
  --    If SDL2 ever provides a `SDL_RENDER_TARGETS_RESET` event then the console
  --    at `*cache` must be deleted and set to NULL, or else the next render will
  --    only partially update the texture at `*target`.
  --    Returns a negative value on an error, check `TCOD_get_error`.
  --    \rst
  --    .. versionadded:: 1.16
  --    \endrst
  --  

   function TCOD_sdl2_render_texture_setup
     (atlas : access constant TCOD_TilesetAtlasSDL2;
      console : access constant console_h.TCOD_Console;
      cache : System.Address;
      target : System.Address) return error_h.TCOD_Error  -- renderer_sdl2.h:140
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sdl2_render_texture_setup";

  --*
  --    Render a console onto a managed target texture.
  --    This function assumes that `cache` and `target` are valid.
  --    You can use `TCOD_sdl2_render_texture_setup` to automatically prepare these
  --    objects for use with this function.
  --    `atlas` is an SDL2 atlas created with `TCOD_sdl2_atlas_new`.
  --    The renderer used to make this `atlas` must support
  --    `SDL_RENDERER_TARGETTEXTURE`, unless `target` is NULL.
  --    `console` is a non-NULL pointer to the libtcod console you want to render.
  --    `cache` can be NULL, or point to a console the same size as `console`.
  --    `target` can be NULL, or be pointer an SDL2 texture used as the output.
  --    If `target` is not NULL then it should be the size of the console times the
  --    size of the individual tiles to fit the entire output.
  --    If `target` is NULL then the current render target is used instead, the
  --    drawn area will not be scaled to fit the render target.
  --    If SDL2 ever provides a `SDL_RENDER_TARGETS_RESET` event then the console
  --    at `cache` must be cleared, or else the next render will only partially
  --    update the texture of `target`.
  --    Returns a negative value on an error, check `TCOD_get_error`.
  --    \rst
  --    .. versionadded:: 1.16
  --    \endrst
  --  

   function TCOD_sdl2_render_texture
     (atlas : access constant TCOD_TilesetAtlasSDL2;
      console : access constant console_h.TCOD_Console;
      cache : access console_h.TCOD_Console;
      target : access SDL_Texture) return error_h.TCOD_Error  -- renderer_sdl2.h:177
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_sdl2_render_texture";

  -- extern "C"
end renderer_sdl2_h;
