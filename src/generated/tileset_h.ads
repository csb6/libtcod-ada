pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
limited with color_h;
with error_h;
with Interfaces.C.Strings;

package tileset_h is

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

   type TCOD_Tileset;
   type TCOD_TilesetObserver;
   type TCOD_TilesetObserver is record
      tileset : access TCOD_Tileset;  -- tileset.h:43
      next : access TCOD_TilesetObserver;  -- tileset.h:44
      userdata : System.Address;  -- tileset.h:45
      on_observer_delete : access procedure (arg1 : access TCOD_TilesetObserver);  -- tileset.h:46
      on_tile_changed : access function (arg1 : access TCOD_TilesetObserver; arg2 : int) return int;  -- tileset.h:47
   end record
   with Convention => C_Pass_By_Copy;  -- tileset.h:42

   type TCOD_Tileset is record
      tile_width : aliased int;  -- tileset.h:50
      tile_height : aliased int;  -- tileset.h:51
      tile_length : aliased int;  -- tileset.h:52
      tiles_capacity : aliased int;  -- tileset.h:53
      tiles_count : aliased int;  -- tileset.h:54
      pixels : access color_h.TCOD_ColorRGBA;  -- tileset.h:55
      character_map_length : aliased int;  -- tileset.h:56
      character_map : access int;  -- tileset.h:57
      observer_list : access TCOD_TilesetObserver;  -- tileset.h:58
      virtual_columns : aliased int;  -- tileset.h:59
      ref_count : aliased int;  -- tileset.h:60
   end record
   with Convention => C_Pass_By_Copy;  -- tileset.h:49

  -- clang-format off
  --*
  --    A character mapping of a Code Page 437 tileset to Unicode.
  --  

   TCOD_CHARMAP_CP437 : aliased array (0 .. 255) of aliased int  -- tileset.h:67
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_CHARMAP_CP437";

  --*
  --    A character mapping of a deprecated TCOD tileset to Unicode.
  --  

   TCOD_CHARMAP_TCOD : aliased array (0 .. 255) of aliased int  -- tileset.h:104
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_CHARMAP_TCOD";

  -- clang-format on
  --*
  -- *  Create a new tile-set with the given tile size.
  --  

   function TCOD_tileset_new (arg1 : int; arg2 : int) return access TCOD_Tileset  -- tileset.h:146
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_tileset_new";

  --*
  -- *  Delete a tile-set.
  --  

   procedure TCOD_tileset_delete (tileset : access TCOD_Tileset)  -- tileset.h:150
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_tileset_delete";

  --*
  -- *  Return the pixel width of tiles in this tileset.
  -- *
  -- *  The tileset functions are provisional, the API may change in the future.
  --  

   function TCOD_tileset_get_tile_width_u (tileset : access constant TCOD_Tileset) return int  -- tileset.h:157
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_tileset_get_tile_width_";

  --*
  -- *  Return the pixel height of tiles in this tileset.
  -- *
  -- *  The tileset functions are provisional, the API may change in the future.
  --  

   function TCOD_tileset_get_tile_height_u (tileset : access constant TCOD_Tileset) return int  -- tileset.h:164
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_tileset_get_tile_height_";

  --*
  -- *  Fetch a tile, outputting its data to a pixel buffer.
  -- *
  -- *  `codepoint` is the index for the tile.  Unicode is recommend.
  -- *
  -- *  `buffer` is a pointer to a contiguous row-major array of pixels.  The tile
  -- *  data will be outputted here.  This pointer can be NULL if you only want to
  -- *  know if the tileset has a specific tile.
  -- *
  -- *  Returns 0 if the tile exists.  Returns a negative value on an error or if
  -- *  the tileset does not have a tile for this codepoint.
  -- *
  -- *  The tileset functions are provisional, the API may change in the future.
  --  

   function TCOD_tileset_get_tile_u
     (tileset : access constant TCOD_Tileset;
      codepoint : int;
      buffer : access color_h.TCOD_ColorRGBA) return error_h.TCOD_Error  -- tileset.h:181
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_tileset_get_tile_";

  --*
  -- *  Upload a tile from a pixel buffer into this tileset.
  -- *
  -- *  `codepoint` is the index for the tile.  Unicode is recommend.
  -- *
  -- *  `buffer` is a pointer to a contiguous row-major array of pixels.
  -- *  This can not be NULL.
  -- *
  -- *  The tileset functions are provisional, the API may change in the future.
  --  

   function TCOD_tileset_set_tile_u
     (tileset : access TCOD_Tileset;
      codepoint : int;
      buffer : access constant color_h.TCOD_ColorRGBA) return error_h.TCOD_Error  -- tileset.h:194
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_tileset_set_tile_";

  --*
  --    Load a PNG font as a tilesheet and return a TCOD_Tileset.
  --    `filename` is the path to a PNG file.
  --    `columns` and `rows` are the shape of the tileset in the image.  The tile
  --    size will be derived from these parameters and the size of the image.
  --    `charmap[n]` is an array of which codepoints to assign to which tiles.
  --    Tiles are assigned in row-major order.
  --    `TCOD_CHARMAP_CP437` or `TCOD_CHARMAP_TCOD` could be used here.
  --  

   function TCOD_tileset_load
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : int;
      arg3 : int;
      arg4 : int;
      arg5 : access int) return access TCOD_Tileset  -- tileset.h:209
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_tileset_load";

  --*
  --    Load a PNG font from memory and return a TCOD_Tileset.
  --    `buffer[buffer_length]` is the PNG data to load.
  --    The remaining parameters are the same as `TCOD_tileset_load`.
  --  

   function TCOD_tileset_load_mem
     (arg1 : size_t;
      arg2 : access unsigned_char;
      arg3 : int;
      arg4 : int;
      arg5 : int;
      arg6 : access int) return access TCOD_Tileset  -- tileset.h:220
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_tileset_load_mem";

  --*
  --    Load raw RGBA data and return a TCOD_Tileset.
  --    `pixels[width*height]` is a row-major RGBA-ordered byte array.
  --    The remaining parameters are the same as `TCOD_tileset_load`.
  --  

   function TCOD_tileset_load_raw
     (arg1 : int;
      arg2 : int;
      arg3 : access constant color_h.TCOD_ColorRGBA;
      arg4 : int;
      arg5 : int;
      arg6 : int;
      arg7 : access int) return access TCOD_Tileset  -- tileset.h:231
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_tileset_load_raw";

  --*
  -- *  Assign a codepoint to an existing tile based on its tile ID.
  -- *
  -- *  Returns the tile ID on success.
  -- *
  -- *  Returns a negative value on error.
  --  

   function TCOD_tileset_assign_tile
     (tileset : access TCOD_Tileset;
      tile_id : int;
      codepoint : int) return int  -- tileset.h:248
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_tileset_assign_tile";

  --*
  -- *  Return a pointer to the tile for `codepoint`.
  -- *
  -- *  Returns NULL if no tile exists for codepoint.
  --  

   function TCOD_tileset_get_tile (arg1 : access constant TCOD_Tileset; arg2 : int) return access constant color_h.TCOD_ColorRGBA  -- tileset.h:255
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_tileset_get_tile";

  --*
  -- *  Return a new observer to this tileset.
  -- *
  -- *  For internal use.
  --  

   function TCOD_tileset_observer_new (arg1 : access TCOD_Tileset) return access TCOD_TilesetObserver  -- tileset.h:262
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_tileset_observer_new";

  --*
  -- *  Delete an existing observer.
  -- *
  -- *  Will call this observers on_observer_delete callback.
  -- *
  -- *  For internal use.
  --  

   procedure TCOD_tileset_observer_delete (observer : access TCOD_TilesetObserver)  -- tileset.h:270
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_tileset_observer_delete";

  --*
  -- *  Called to notify any observers that a tile has been changed.  This may
  -- *  cause running atlases to update or mark cache consoles as dirty.
  -- *
  -- *  For internal use.
  --  

   procedure TCOD_tileset_notify_tile_changed (tileset : access TCOD_Tileset; tile_id : int)  -- tileset.h:277
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_tileset_notify_tile_changed";

  --*
  -- *  Reserve memory for a specific amount of tiles.
  -- *
  -- *  For internal use.
  --  

   function TCOD_tileset_reserve (tileset : access TCOD_Tileset; desired : int) return error_h.TCOD_Error  -- tileset.h:284
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_tileset_reserve";

  -- extern "C"
  -- namespace tcod
end tileset_h;
