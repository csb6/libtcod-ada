pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with sys_utypes_uint8_t_h;
with heapq_h;
with error_h;

package pathfinder_frontier_h is

   TCOD_PATHFINDER_MAX_DIMENSIONS : constant := 4;  --  pathfinder_frontier.h:41

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

   type anon2293_array2024 is array (0 .. 3) of aliased int;
   type TCOD_Frontier is record
      ndim : aliased sys_utypes_uint8_t_h.int8_t;  -- pathfinder_frontier.h:44
      active_dist : aliased int;  -- pathfinder_frontier.h:45
      active_index : aliased anon2293_array2024;  -- pathfinder_frontier.h:46
      heap : aliased heapq_h.TCOD_Heap;  -- pathfinder_frontier.h:47
   end record
   with Convention => C_Pass_By_Copy;  -- pathfinder_frontier.h:43

  --*
  --    Create a new pathfinder frontier.
  --    `ndim` is the number of dimensions.  Must be in the range `1 <= n <= 4`.
  --  

   function TCOD_frontier_new (arg1 : int) return access TCOD_Frontier  -- pathfinder_frontier.h:57
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_frontier_new";

  --*
  --    Delete a pathfinder frontier.
  --  

   procedure TCOD_frontier_delete (frontier : access TCOD_Frontier)  -- pathfinder_frontier.h:61
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_frontier_delete";

  --*
  --    Pop the next node from this frontier.
  --    The popped node variables will placed in the `active_dist` and
  --    `active_index` attributes.
  --  

   function TCOD_frontier_pop (frontier : access TCOD_Frontier) return error_h.TCOD_Error  -- pathfinder_frontier.h:68
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_frontier_pop";

  --*
  --    Add a node to this frontier.
  --    `index[frontier->ndim]` is the position of the node to add to the frontier.
  --    `dist` is the total distance of the node.  This should be a low number
  --    like 0, but can also be a negative number such as `INT_MIN`.
  --    When adding a node as an edge then `dist` is `frontier->active_dist` plus
  --    the cost of the edge.
  --    `heuristic` is the true priority of the node, used to affect node order.
  --    For Dijkstra-like algorithms this should be the same as `dist`.
  --    For A* this should be `dist` plus the maximum possible distance to the
  --    goal.
  --  

   function TCOD_frontier_push
     (frontier : access TCOD_Frontier;
      index : access int;
      dist : int;
      heuristic : int) return error_h.TCOD_Error  -- pathfinder_frontier.h:85
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_frontier_push";

  --*
  --    Return the current number of nodes in this frontier.
  --  

   function TCOD_frontier_size (frontier : access constant TCOD_Frontier) return int  -- pathfinder_frontier.h:89
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_frontier_size";

  --*
  --    Remove all nodes from this frontier.
  --  

   function TCOD_frontier_clear (frontier : access TCOD_Frontier) return error_h.TCOD_Error  -- pathfinder_frontier.h:93
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_frontier_clear";

  -- extern "C"
end pathfinder_frontier_h;
