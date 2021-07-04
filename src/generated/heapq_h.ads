pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with sys_utypes_usize_t_h;
with System;

package heapq_h is

   TCOD_HEAP_DEFAULT_CAPACITY : constant := 256;  --  heapq.h:40
   TCOD_HEAP_MAX_NODE_SIZE : constant := 256;  --  heapq.h:41

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

   type anon2260_array2262 is array (0 .. 0) of aliased unsigned_char;
   type TCOD_HeapNode is record
      priority : aliased int;  -- heapq.h:49
      data : aliased anon2260_array2262;  -- heapq.h:51
   end record
   with Convention => C_Pass_By_Copy;  -- heapq.h:48

   type TCOD_Heap is record
      heap : access TCOD_HeapNode;  -- heapq.h:60
      size : aliased int;  -- heapq.h:61
      capacity : aliased int;  -- heapq.h:62
      node_size : aliased sys_utypes_usize_t_h.size_t;  -- heapq.h:63
      data_size : aliased sys_utypes_usize_t_h.size_t;  -- heapq.h:64
   end record
   with Convention => C_Pass_By_Copy;  -- heapq.h:59

   function TCOD_heap_init (heap : access TCOD_Heap; data_size : sys_utypes_usize_t_h.size_t) return int  -- heapq.h:70
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_heap_init";

   procedure TCOD_heap_uninit (heap : access TCOD_Heap)  -- heapq.h:71
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_heap_uninit";

   procedure TCOD_heap_clear (heap : access TCOD_Heap)  -- heapq.h:73
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_heap_clear";

   function TCOD_minheap_push
     (minheap : access TCOD_Heap;
      priority : int;
      data : System.Address) return int  -- heapq.h:75
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_minheap_push";

   procedure TCOD_minheap_pop (minheap : access TCOD_Heap; c_out : System.Address)  -- heapq.h:76
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_minheap_pop";

   procedure TCOD_minheap_heapify (minheap : access TCOD_Heap)  -- heapq.h:77
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_minheap_heapify";

  -- extern "C"
end heapq_h;
