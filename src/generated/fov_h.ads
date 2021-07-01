pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with fov_types_h;
with Interfaces.C.Extensions;
with error_h;

package fov_h is

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
  --    Return a new TCOD_Map with `width` and `height`.
  --  

   function TCOD_map_new (arg1 : int; arg2 : int) return access fov_types_h.TCOD_Map  -- fov.h:49
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_map_new";

  --*
  --    Set all cell values on `map` to the given parameters.
  --    This call also zeroes out the field-of-view attribute.
  --  

   procedure TCOD_map_clear
     (map : access fov_types_h.TCOD_Map;
      transparent : Extensions.bool;
      walkable : Extensions.bool)  -- fov.h:55
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_map_clear";

  --*
  --    Clone map data from `source` to `dest`.
  --    `dest` will be resized to match `source` if necessary.
  --  

   function TCOD_map_copy (source : access constant fov_types_h.TCOD_Map; dest : access fov_types_h.TCOD_Map) return error_h.TCOD_Error  -- fov.h:61
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_map_copy";

  --*
  --    Change the properties of a single cell.
  --  

   procedure TCOD_map_set_properties
     (map : access fov_types_h.TCOD_Map;
      x : int;
      y : int;
      is_transparent : Extensions.bool;
      is_walkable : Extensions.bool)  -- fov.h:65
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_map_set_properties";

  --*
  --    Free a TCOD_Map object.
  --  

   procedure TCOD_map_delete (map : access fov_types_h.TCOD_Map)  -- fov.h:69
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_map_delete";

  --*
  --    Calculate the field-of-view.
  --    \rst
  --    `pov_x` and `pov_y` are the used as the field-of-view source.
  --    These coordinates must be within the map.
  --    `max_radius` is the maximum distance for the field-of-view algorithm.
  --    If `light_walls` is false then only transparent cells will be touched by
  --    the field-of-view.
  --    `algo` is one of the :any:`TCOD_fov_algorithm_t` algorithms.
  --    After this call you may check if a cell is within the field-of-view by
  --    calling :any:`TCOD_map_is_in_fov`.
  --    Returns an error code on failure.  See :any:`TCOD_get_error` for details.
  --    \endrst
  --  

   function TCOD_map_compute_fov
     (map : access fov_types_h.TCOD_Map;
      pov_x : int;
      pov_y : int;
      max_radius : int;
      light_walls : Extensions.bool;
      algo : fov_types_h.TCOD_fov_algorithm_t) return error_h.TCOD_Error  -- fov.h:90
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_map_compute_fov";

  --*
  --    Return true if this cell was touched by the current field-of-view.
  --  

   function TCOD_map_is_in_fov
     (map : access constant fov_types_h.TCOD_Map;
      x : int;
      y : int) return Extensions.bool  -- fov.h:95
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_map_is_in_fov";

  --*
  --    Set the fov flag on a specific cell.
  --  

   procedure TCOD_map_set_in_fov
     (map : access fov_types_h.TCOD_Map;
      x : int;
      y : int;
      fov : Extensions.bool)  -- fov.h:99
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_map_set_in_fov";

  --*
  --    Return true if this cell is transparent.
  --  

   function TCOD_map_is_transparent
     (map : access constant fov_types_h.TCOD_Map;
      x : int;
      y : int) return Extensions.bool  -- fov.h:103
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_map_is_transparent";

  --*
  --    Return true if this cell is walkable.
  --  

   function TCOD_map_is_walkable
     (map : access fov_types_h.TCOD_Map;
      x : int;
      y : int) return Extensions.bool  -- fov.h:107
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_map_is_walkable";

  --*
  --    Return the width of `map`.
  --  

   function TCOD_map_get_width (map : access constant fov_types_h.TCOD_Map) return int  -- fov.h:111
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_map_get_width";

  --*
  --    Return the height of `map`.
  --  

   function TCOD_map_get_height (map : access constant fov_types_h.TCOD_Map) return int  -- fov.h:115
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_map_get_height";

  --*
  --    Return the total number of cells in `map`.
  --  

   function TCOD_map_get_nb_cells (map : access constant fov_types_h.TCOD_Map) return int  -- fov.h:119
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_map_get_nb_cells";

  -- extern "C"
  -- namespace tcod
end fov_h;
