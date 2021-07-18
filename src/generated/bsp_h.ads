pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with tree_h;
with Interfaces.C.Extensions;
with System;
with mersenne_types_h;

package bsp_h is

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

  -- pseudo oop : bsp inherit tree  
  -- node position & size  
  -- position of splitting  
  -- level in the tree  
  -- horizontal splitting ?  
   type TCOD_bsp_t is record
      tree : aliased tree_h.TCOD_tree_t;  -- bsp.h:43
      x : aliased int;  -- bsp.h:44
      y : aliased int;  -- bsp.h:44
      w : aliased int;  -- bsp.h:44
      h : aliased int;  -- bsp.h:44
      position : aliased int;  -- bsp.h:45
      level : aliased Extensions.Unsigned_8;  -- bsp.h:46
      horizontal : aliased Extensions.bool;  -- bsp.h:47
   end record
   with Convention => C_Pass_By_Copy;  -- bsp.h:48

   type TCOD_bsp_callback_t is access function (arg1 : access TCOD_bsp_t; arg2 : System.Address) return Extensions.bool
   with Convention => C;  -- bsp.h:50

   function TCOD_bsp_new return access TCOD_bsp_t  -- bsp.h:52
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_bsp_new";

   function TCOD_bsp_new_with_size
     (arg1 : int;
      arg2 : int;
      arg3 : int;
      arg4 : int) return access TCOD_bsp_t  -- bsp.h:53
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_bsp_new_with_size";

   procedure TCOD_bsp_delete (node : access TCOD_bsp_t)  -- bsp.h:54
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_bsp_delete";

   function TCOD_bsp_left (arg1 : access TCOD_bsp_t) return access TCOD_bsp_t  -- bsp.h:56
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_bsp_left";

   function TCOD_bsp_right (arg1 : access TCOD_bsp_t) return access TCOD_bsp_t  -- bsp.h:57
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_bsp_right";

   function TCOD_bsp_father (arg1 : access TCOD_bsp_t) return access TCOD_bsp_t  -- bsp.h:58
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_bsp_father";

   function TCOD_bsp_is_leaf (node : access TCOD_bsp_t) return Extensions.bool  -- bsp.h:60
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_bsp_is_leaf";

   function TCOD_bsp_traverse_pre_order
     (node : access TCOD_bsp_t;
      listener : TCOD_bsp_callback_t;
      userData : System.Address) return Extensions.bool  -- bsp.h:61
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_bsp_traverse_pre_order";

   function TCOD_bsp_traverse_in_order
     (node : access TCOD_bsp_t;
      listener : TCOD_bsp_callback_t;
      userData : System.Address) return Extensions.bool  -- bsp.h:62
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_bsp_traverse_in_order";

   function TCOD_bsp_traverse_post_order
     (node : access TCOD_bsp_t;
      listener : TCOD_bsp_callback_t;
      userData : System.Address) return Extensions.bool  -- bsp.h:63
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_bsp_traverse_post_order";

   function TCOD_bsp_traverse_level_order
     (node : access TCOD_bsp_t;
      listener : TCOD_bsp_callback_t;
      userData : System.Address) return Extensions.bool  -- bsp.h:64
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_bsp_traverse_level_order";

   function TCOD_bsp_traverse_inverted_level_order
     (node : access TCOD_bsp_t;
      listener : TCOD_bsp_callback_t;
      userData : System.Address) return Extensions.bool  -- bsp.h:65
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_bsp_traverse_inverted_level_order";

   function TCOD_bsp_contains
     (node : access TCOD_bsp_t;
      x : int;
      y : int) return Extensions.bool  -- bsp.h:66
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_bsp_contains";

   function TCOD_bsp_find_node
     (arg1 : access TCOD_bsp_t;
      arg2 : int;
      arg3 : int) return access TCOD_bsp_t  -- bsp.h:67
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_bsp_find_node";

   procedure TCOD_bsp_resize
     (node : access TCOD_bsp_t;
      x : int;
      y : int;
      w : int;
      h : int)  -- bsp.h:68
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_bsp_resize";

   procedure TCOD_bsp_split_once
     (node : access TCOD_bsp_t;
      horizontal : Extensions.bool;
      position : int)  -- bsp.h:69
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_bsp_split_once";

   procedure TCOD_bsp_split_recursive
     (node : access TCOD_bsp_t;
      randomizer : mersenne_types_h.TCOD_random_t;
      nb : int;
      minHSize : int;
      minVSize : int;
      maxHRatio : float;
      maxVRatio : float)  -- bsp.h:70
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_bsp_split_recursive";

   procedure TCOD_bsp_remove_sons (node : access TCOD_bsp_t)  -- bsp.h:72
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_bsp_remove_sons";

end bsp_h;
