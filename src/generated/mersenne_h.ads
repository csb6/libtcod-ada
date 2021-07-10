pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions; use Interfaces.C.Extensions;
with mersenne_types_h;
with Interfaces.C.Strings;

package mersenne_h is

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

   function TCOD_random_get_instance return mersenne_types_h.TCOD_random_t  -- mersenne.h:41
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_random_get_instance";

   function TCOD_random_new (algo : mersenne_types_h.TCOD_random_algo_t) return mersenne_types_h.TCOD_random_t  -- mersenne.h:42
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_random_new";

   function TCOD_random_save (mersenne : mersenne_types_h.TCOD_random_t) return mersenne_types_h.TCOD_random_t  -- mersenne.h:43
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_random_save";

   procedure TCOD_random_restore (mersenne : mersenne_types_h.TCOD_random_t; backup : mersenne_types_h.TCOD_random_t)  -- mersenne.h:44
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_random_restore";

   function TCOD_random_new_from_seed (algo : mersenne_types_h.TCOD_random_algo_t; seed : Unsigned_32) return mersenne_types_h.TCOD_random_t  -- mersenne.h:45
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_random_new_from_seed";

   procedure TCOD_random_delete (mersenne : mersenne_types_h.TCOD_random_t)  -- mersenne.h:46
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_random_delete";

   procedure TCOD_random_set_distribution (mersenne : mersenne_types_h.TCOD_random_t; distribution : mersenne_types_h.TCOD_distribution_t)  -- mersenne.h:48
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_random_set_distribution";

   function TCOD_random_get_int
     (mersenne : mersenne_types_h.TCOD_random_t;
      min : int;
      max : int) return int  -- mersenne.h:50
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_random_get_int";

   function TCOD_random_get_float
     (mersenne : mersenne_types_h.TCOD_random_t;
      min : float;
      max : float) return float  -- mersenne.h:51
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_random_get_float";

   function TCOD_random_get_double
     (mersenne : mersenne_types_h.TCOD_random_t;
      min : double;
      max : double) return double  -- mersenne.h:52
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_random_get_double";

   function TCOD_random_get_int_mean
     (mersenne : mersenne_types_h.TCOD_random_t;
      min : int;
      max : int;
      mean : int) return int  -- mersenne.h:54
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_random_get_int_mean";

   function TCOD_random_get_float_mean
     (mersenne : mersenne_types_h.TCOD_random_t;
      min : float;
      max : float;
      mean : float) return float  -- mersenne.h:55
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_random_get_float_mean";

   function TCOD_random_get_double_mean
     (mersenne : mersenne_types_h.TCOD_random_t;
      min : double;
      max : double;
      mean : double) return double  -- mersenne.h:56
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_random_get_double_mean";

   function TCOD_random_dice_new (s : Interfaces.C.Strings.chars_ptr) return mersenne_types_h.TCOD_dice_t  -- mersenne.h:58
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_random_dice_new";

   function TCOD_random_dice_roll (mersenne : mersenne_types_h.TCOD_random_t; dice : mersenne_types_h.TCOD_dice_t) return int  -- mersenne.h:59
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_random_dice_roll";

   function TCOD_random_dice_roll_s (mersenne : mersenne_types_h.TCOD_random_t; s : Interfaces.C.Strings.chars_ptr) return int  -- mersenne.h:60
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_random_dice_roll_s";

end mersenne_h;
