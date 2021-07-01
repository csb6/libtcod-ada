pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with fov_types_h;
with Interfaces.C.Extensions;
with list_h;

package path_h is

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

   type TCOD_path_func_t is access function
        (arg1 : int;
         arg2 : int;
         arg3 : int;
         arg4 : int;
         arg5 : System.Address) return float
   with Convention => C;  -- path.h:42

   type TCOD_Path is null record;   -- incomplete struct

   type TCOD_path_t is access all TCOD_Path;  -- path.h:44

   function TCOD_path_new_using_map (map : fov_types_h.TCOD_map_t; diagonalCost : float) return TCOD_path_t  -- path.h:46
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_path_new_using_map";

   function TCOD_path_new_using_function
     (map_width : int;
      map_height : int;
      func : TCOD_path_func_t;
      user_data : System.Address;
      diagonalCost : float) return TCOD_path_t  -- path.h:48
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_path_new_using_function";

   function TCOD_path_compute
     (path : TCOD_path_t;
      ox : int;
      oy : int;
      dx : int;
      dy : int) return Extensions.bool  -- path.h:50
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_path_compute";

   function TCOD_path_walk
     (path : TCOD_path_t;
      x : access int;
      y : access int;
      recalculate_when_needed : Extensions.bool) return Extensions.bool  -- path.h:51
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_path_walk";

   function TCOD_path_is_empty (path : TCOD_path_t) return Extensions.bool  -- path.h:52
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_path_is_empty";

   function TCOD_path_size (path : TCOD_path_t) return int  -- path.h:53
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_path_size";

   procedure TCOD_path_reverse (path : TCOD_path_t)  -- path.h:54
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_path_reverse";

   procedure TCOD_path_get
     (path : TCOD_path_t;
      index : int;
      x : access int;
      y : access int)  -- path.h:55
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_path_get";

   procedure TCOD_path_get_origin
     (path : TCOD_path_t;
      x : access int;
      y : access int)  -- path.h:56
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_path_get_origin";

   procedure TCOD_path_get_destination
     (path : TCOD_path_t;
      x : access int;
      y : access int)  -- path.h:57
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_path_get_destination";

   procedure TCOD_path_delete (path : TCOD_path_t)  -- path.h:58
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_path_delete";

  -- Dijkstra stuff - by Mingos 
  --*
  -- *  Dijkstra data structure
  -- *
  -- *  All attributes are considered private.
  --  

   type TCOD_Dijkstra is record
      diagonal_cost : aliased int;  -- path.h:67
      width : aliased int;  -- path.h:68
      height : aliased int;  -- path.h:68
      nodes_max : aliased int;  -- path.h:68
      map : fov_types_h.TCOD_map_t;  -- path.h:69
      func : TCOD_path_func_t;  -- path.h:70
      user_data : System.Address;  -- path.h:71
      distances : access unsigned;  -- path.h:72
      nodes : access unsigned;  -- path.h:73
      path : list_h.TCOD_list_t;  -- path.h:74
   end record
   with Convention => C_Pass_By_Copy;  -- path.h:66

  -- a TCODMap with walkability data  
  -- distances grid  
  -- the processed nodes  
   type TCOD_dijkstra_t is access all TCOD_Dijkstra;  -- path.h:76

   function TCOD_dijkstra_new (map : fov_types_h.TCOD_map_t; diagonalCost : float) return TCOD_dijkstra_t  -- path.h:78
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dijkstra_new";

   function TCOD_dijkstra_new_using_function
     (map_width : int;
      map_height : int;
      func : TCOD_path_func_t;
      user_data : System.Address;
      diagonalCost : float) return TCOD_dijkstra_t  -- path.h:79
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dijkstra_new_using_function";

   procedure TCOD_dijkstra_compute
     (dijkstra : TCOD_dijkstra_t;
      root_x : int;
      root_y : int)  -- path.h:81
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dijkstra_compute";

   function TCOD_dijkstra_get_distance
     (dijkstra : TCOD_dijkstra_t;
      x : int;
      y : int) return float  -- path.h:82
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dijkstra_get_distance";

   function TCOD_dijkstra_path_set
     (dijkstra : TCOD_dijkstra_t;
      x : int;
      y : int) return Extensions.bool  -- path.h:83
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dijkstra_path_set";

   function TCOD_dijkstra_is_empty (path : TCOD_dijkstra_t) return Extensions.bool  -- path.h:84
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dijkstra_is_empty";

   function TCOD_dijkstra_size (path : TCOD_dijkstra_t) return int  -- path.h:85
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dijkstra_size";

   procedure TCOD_dijkstra_reverse (path : TCOD_dijkstra_t)  -- path.h:86
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dijkstra_reverse";

   procedure TCOD_dijkstra_get
     (path : TCOD_dijkstra_t;
      index : int;
      x : access int;
      y : access int)  -- path.h:87
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dijkstra_get";

   function TCOD_dijkstra_path_walk
     (dijkstra : TCOD_dijkstra_t;
      x : access int;
      y : access int) return Extensions.bool  -- path.h:88
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dijkstra_path_walk";

   procedure TCOD_dijkstra_delete (dijkstra : TCOD_dijkstra_t)  -- path.h:89
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_dijkstra_delete";

end path_h;
