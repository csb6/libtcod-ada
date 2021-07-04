pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with sys_utypes_usize_t_h;
with sys_utypes_uint8_t_h;
with Interfaces.C.Extensions;
with heapq_h;
with System;

package pathfinder_h is

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

   type anon2273_array2274 is array (0 .. 4) of aliased sys_utypes_usize_t_h.size_t;
   type TCOD_ArrayData is record
      ndim : aliased sys_utypes_uint8_t_h.int8_t;  -- pathfinder.h:45
      int_type : aliased int;  -- pathfinder.h:46
      shape : aliased anon2273_array2274;  -- pathfinder.h:47
      strides : aliased anon2273_array2274;  -- pathfinder.h:48
      data : access unsigned_char;  -- pathfinder.h:49
   end record
   with Convention => C_Pass_By_Copy;  -- pathfinder.h:44

   type TCOD_BasicGraph2D is record
      cost : aliased TCOD_ArrayData;  -- pathfinder.h:53
      cardinal : aliased int;  -- pathfinder.h:54
      diagonal : aliased int;  -- pathfinder.h:55
   end record
   with Convention => C_Pass_By_Copy;  -- pathfinder.h:52

   type anon2277_array2278 is array (0 .. 3) of aliased sys_utypes_usize_t_h.size_t;
   type TCOD_Pathfinder is record
      ndim : aliased sys_utypes_uint8_t_h.int8_t;  -- pathfinder.h:59
      shape : aliased anon2277_array2278;  -- pathfinder.h:60
      owns_distance : aliased Extensions.bool;  -- pathfinder.h:61
      owns_graph : aliased Extensions.bool;  -- pathfinder.h:62
      owns_traversal : aliased Extensions.bool;  -- pathfinder.h:63
      distance : aliased TCOD_ArrayData;  -- pathfinder.h:64
      graph : aliased TCOD_BasicGraph2D;  -- pathfinder.h:65
      traversal : aliased TCOD_ArrayData;  -- pathfinder.h:66
      heap : aliased heapq_h.TCOD_Heap;  -- pathfinder.h:67
   end record
   with Convention => C_Pass_By_Copy;  -- pathfinder.h:58

   function TCOD_pf_new (arg1 : int; arg2 : access sys_utypes_usize_t_h.size_t) return access TCOD_Pathfinder  -- pathfinder.h:70
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_pf_new";

   procedure TCOD_pf_delete (path : access TCOD_Pathfinder)  -- pathfinder.h:71
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_pf_delete";

   procedure TCOD_pf_set_distance_pointer
     (path : access TCOD_Pathfinder;
      data : System.Address;
      int_type : int;
      strides : access sys_utypes_usize_t_h.size_t)  -- pathfinder.h:73
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_pf_set_distance_pointer";

   procedure TCOD_pf_set_graph2d_pointer
     (path : access TCOD_Pathfinder;
      data : System.Address;
      int_type : int;
      strides : access sys_utypes_usize_t_h.size_t;
      cardinal : int;
      diagonal : int)  -- pathfinder.h:75
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_pf_set_graph2d_pointer";

   procedure TCOD_pf_set_traversal_pointer
     (path : access TCOD_Pathfinder;
      data : System.Address;
      int_type : int;
      strides : access sys_utypes_usize_t_h.size_t)  -- pathfinder.h:77
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_pf_set_traversal_pointer";

   function TCOD_pf_recompile (path : access TCOD_Pathfinder) return int  -- pathfinder.h:80
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_pf_recompile";

   function TCOD_pf_compute (path : access TCOD_Pathfinder) return int  -- pathfinder.h:81
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_pf_compute";

   function TCOD_pf_compute_step (path : access TCOD_Pathfinder) return int  -- pathfinder.h:82
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_pf_compute_step";

end pathfinder_h;
