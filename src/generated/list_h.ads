pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Extensions;

package list_h is

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

   type TCOD_List is null record;   -- incomplete struct

   type TCOD_list_t is access all TCOD_List;  -- list.h:43

   function TCOD_list_new return TCOD_list_t  -- list.h:47
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_list_new";

   function TCOD_list_allocate (nb_elements : int) return TCOD_list_t  -- list.h:49
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_list_allocate";

   function TCOD_list_duplicate (l : TCOD_list_t) return TCOD_list_t  -- list.h:50
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_list_duplicate";

   procedure TCOD_list_delete (l : TCOD_list_t)  -- list.h:51
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_list_delete";

   procedure TCOD_list_push (l : TCOD_list_t; elt : System.Address)  -- list.h:52
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_list_push";

   function TCOD_list_pop (arg1 : TCOD_list_t) return System.Address  -- list.h:53
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_list_pop";

   function TCOD_list_peek (arg1 : TCOD_list_t) return System.Address  -- list.h:54
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_list_peek";

   procedure TCOD_list_add_all (l : TCOD_list_t; l2 : TCOD_list_t)  -- list.h:55
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_list_add_all";

   function TCOD_list_get (arg1 : TCOD_list_t; arg2 : int) return System.Address  -- list.h:56
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_list_get";

   procedure TCOD_list_set
     (l : TCOD_list_t;
      elt : System.Address;
      idx : int)  -- list.h:57
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_list_set";

   function TCOD_list_begin (arg1 : TCOD_list_t) return System.Address  -- list.h:58
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_list_begin";

   function TCOD_list_end (arg1 : TCOD_list_t) return System.Address  -- list.h:59
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_list_end";

   procedure TCOD_list_reverse (l : TCOD_list_t)  -- list.h:60
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_list_reverse";

   function TCOD_list_remove_iterator (arg1 : TCOD_list_t; arg2 : System.Address) return System.Address  -- list.h:61
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_list_remove_iterator";

   procedure TCOD_list_remove (l : TCOD_list_t; elt : System.Address)  -- list.h:62
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_list_remove";

   function TCOD_list_remove_iterator_fast (arg1 : TCOD_list_t; arg2 : System.Address) return System.Address  -- list.h:63
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_list_remove_iterator_fast";

   procedure TCOD_list_remove_fast (l : TCOD_list_t; elt : System.Address)  -- list.h:64
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_list_remove_fast";

   function TCOD_list_contains (l : TCOD_list_t; elt : System.Address) return Extensions.bool  -- list.h:65
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_list_contains";

   procedure TCOD_list_clear (l : TCOD_list_t)  -- list.h:66
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_list_clear";

   procedure TCOD_list_clear_and_delete (l : TCOD_list_t)  -- list.h:67
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_list_clear_and_delete";

   function TCOD_list_size (l : TCOD_list_t) return int  -- list.h:68
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_list_size";

   function TCOD_list_insert_before
     (arg1 : TCOD_list_t;
      arg2 : System.Address;
      arg3 : int) return System.Address  -- list.h:69
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_list_insert_before";

   function TCOD_list_is_empty (l : TCOD_list_t) return Extensions.bool  -- list.h:70
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_list_is_empty";

end list_h;
