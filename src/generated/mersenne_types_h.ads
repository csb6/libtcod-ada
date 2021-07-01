pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package mersenne_types_h is

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

   type TCOD_Random is null record;   -- incomplete struct

   type TCOD_random_t is access all TCOD_Random;  -- mersenne_types.h:36

  -- dice roll  
   type TCOD_dice_t is record
      nb_rolls : aliased int;  -- mersenne_types.h:40
      nb_faces : aliased int;  -- mersenne_types.h:41
      multiplier : aliased float;  -- mersenne_types.h:42
      addsub : aliased float;  -- mersenne_types.h:43
   end record
   with Convention => C_Pass_By_Copy;  -- mersenne_types.h:44

  -- PRNG algorithms  
   type TCOD_random_algo_t is 
     (TCOD_RNG_MT,
      TCOD_RNG_CMWC)
   with Convention => C;  -- mersenne_types.h:47

   type TCOD_distribution_t is 
     (TCOD_DISTRIBUTION_LINEAR,
      TCOD_DISTRIBUTION_GAUSSIAN,
      TCOD_DISTRIBUTION_GAUSSIAN_RANGE,
      TCOD_DISTRIBUTION_GAUSSIAN_INVERSE,
      TCOD_DISTRIBUTION_GAUSSIAN_RANGE_INVERSE)
   with Convention => C;  -- mersenne_types.h:55

end mersenne_types_h;
