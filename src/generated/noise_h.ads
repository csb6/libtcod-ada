pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with mersenne_types_h;

package noise_h is

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

   subtype TCOD_noise_type_t is unsigned;
   TCOD_NOISE_PERLIN : constant unsigned := 1;
   TCOD_NOISE_SIMPLEX : constant unsigned := 2;
   TCOD_NOISE_WAVELET : constant unsigned := 4;
   TCOD_NOISE_DEFAULT : constant unsigned := 0;  -- noise.h:44

   type anon1947_array1948 is array (0 .. 255) of aliased unsigned_char;
   type anon1947_array1951 is array (0 .. 255, 0 .. 3) of aliased float;
   type anon1947_array1952 is array (0 .. 127) of aliased float;
   type TCOD_Noise is record
      ndim : aliased int;  -- noise.h:47
      map : aliased anon1947_array1948;  -- noise.h:49
      buffer : aliased anon1947_array1951;  -- noise.h:51
      H : aliased float;  -- noise.h:53
      lacunarity : aliased float;  -- noise.h:54
      exponent : aliased anon1947_array1952;  -- noise.h:55
      waveletTileData : access float;  -- noise.h:56
      rand : access mersenne_types_h.TCOD_Random;  -- noise.h:57
      noise_type : aliased TCOD_noise_type_t;  -- noise.h:59
   end record
   with Convention => C_Pass_By_Copy;  -- noise.h:46

  --* Randomized map of indexes into buffer  
  --* Random 256 x ndim buffer  
  -- fractal stuff  
  -- noise type  
   type TCOD_noise_t is access all TCOD_Noise;  -- noise.h:61

  -- create a new noise object  
   function TCOD_noise_new
     (arg1 : int;
      arg2 : float;
      arg3 : float;
      arg4 : mersenne_types_h.TCOD_random_t) return access TCOD_Noise  -- noise.h:67
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_noise_new";

  -- simplified API  
   procedure TCOD_noise_set_type (noise : access TCOD_Noise; c_type : TCOD_noise_type_t)  -- noise.h:70
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_noise_set_type";

   function TCOD_noise_get_ex
     (noise : access TCOD_Noise;
      f : access float;
      c_type : TCOD_noise_type_t) return float  -- noise.h:72
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_noise_get_ex";

   function TCOD_noise_get_fbm_ex
     (noise : access TCOD_Noise;
      f : access float;
      octaves : float;
      c_type : TCOD_noise_type_t) return float  -- noise.h:74
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_noise_get_fbm_ex";

   function TCOD_noise_get_turbulence_ex
     (noise : access TCOD_Noise;
      f : access float;
      octaves : float;
      c_type : TCOD_noise_type_t) return float  -- noise.h:77
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_noise_get_turbulence_ex";

   function TCOD_noise_get (noise : access TCOD_Noise; f : access float) return float  -- noise.h:80
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_noise_get";

   function TCOD_noise_get_fbm
     (noise : access TCOD_Noise;
      f : access float;
      octaves : float) return float  -- noise.h:82
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_noise_get_fbm";

   function TCOD_noise_get_turbulence
     (noise : access TCOD_Noise;
      f : access float;
      octaves : float) return float  -- noise.h:84
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_noise_get_turbulence";

  -- delete the noise object  
   procedure TCOD_noise_delete (noise : access TCOD_Noise)  -- noise.h:86
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_noise_delete";

  --*
  --    Generate noise as a vectorized operation.
  --    `noise` is the TCOD_Noise object to be used.  Its dimensions will
  --    determine how many input arrays are required.
  --    `type` is which noise generator should be used.
  --    Can be `TCOD_NOISE_DEFAULT` to use the type set by the TCOD_Noise object.
  --    `n` is the length of the input and output arrrays.
  --    `x[n]`, `y[n]`, `z[n]`, `w[n]` are the input coordinates for the noise
  --    generator.  For a 2D generator you'd provide the `x[n]` and `y[n]` arrays
  --    and leave the remaining arrays as NULL.
  --    `out[n]` is the output array, which will receive the noise values.
  --    \rst
  --    .. versionadded:: 1.16
  --    \endrst
  --  

   procedure TCOD_noise_get_vectorized
     (noise : access TCOD_Noise;
      c_type : TCOD_noise_type_t;
      n : int;
      x : access float;
      y : access float;
      z : access float;
      w : access float;
      c_out : access float)  -- noise.h:108
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_noise_get_vectorized";

  --*
  --    Generate noise as a vectorized operation with fractional Brownian motion.
  --    `octaves` are the number of samples to take.
  --    The remaining parameters are the same as `TCOD_noise_get_vectorized`.
  --    \rst
  --    .. versionadded:: 1.16
  --    \endrst
  --  

   procedure TCOD_noise_get_fbm_vectorized
     (noise : access TCOD_Noise;
      c_type : TCOD_noise_type_t;
      octaves : float;
      n : int;
      x : access float;
      y : access float;
      z : access float;
      w : access float;
      c_out : access float)  -- noise.h:128
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_noise_get_fbm_vectorized";

  --*
  --    Generate noise as a vectorized operation with turbulence.
  --    `octaves` are the number of samples to take.
  --    The remaining parameters are the same as `TCOD_noise_get_vectorized`.
  --    \rst
  --    .. versionadded:: 1.16
  --    \endrst
  --  

   procedure TCOD_noise_get_turbulence_vectorized
     (noise : access TCOD_Noise;
      c_type : TCOD_noise_type_t;
      octaves : float;
      n : int;
      x : access float;
      y : access float;
      z : access float;
      w : access float;
      c_out : access float)  -- noise.h:149
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_noise_get_turbulence_vectorized";

end noise_h;
