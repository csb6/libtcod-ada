pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;
with mersenne_types_h;
with noise_h;

package heightmap_h is

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

   type TCOD_heightmap_t is record
      w : aliased int;  -- heightmap.h:43
      h : aliased int;  -- heightmap.h:43
      values : access float;  -- heightmap.h:44
   end record
   with Convention => C_Pass_By_Copy;  -- heightmap.h:45

   function TCOD_heightmap_new (arg1 : int; arg2 : int) return access TCOD_heightmap_t  -- heightmap.h:47
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_heightmap_new";

   procedure TCOD_heightmap_delete (hm : access TCOD_heightmap_t)  -- heightmap.h:48
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_heightmap_delete";

   function TCOD_heightmap_get_value
     (hm : access constant TCOD_heightmap_t;
      x : int;
      y : int) return float  -- heightmap.h:50
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_heightmap_get_value";

   function TCOD_heightmap_get_interpolated_value
     (hm : access constant TCOD_heightmap_t;
      x : float;
      y : float) return float  -- heightmap.h:51
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_heightmap_get_interpolated_value";

   procedure TCOD_heightmap_set_value
     (hm : access TCOD_heightmap_t;
      x : int;
      y : int;
      value : float)  -- heightmap.h:52
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_heightmap_set_value";

   function TCOD_heightmap_get_slope
     (hm : access constant TCOD_heightmap_t;
      x : int;
      y : int) return float  -- heightmap.h:53
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_heightmap_get_slope";

   procedure TCOD_heightmap_get_normal
     (hm : access constant TCOD_heightmap_t;
      x : float;
      y : float;
      n : access float;
      waterLevel : float)  -- heightmap.h:54
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_heightmap_get_normal";

   function TCOD_heightmap_count_cells
     (hm : access constant TCOD_heightmap_t;
      min : float;
      max : float) return int  -- heightmap.h:55
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_heightmap_count_cells";

   function TCOD_heightmap_has_land_on_border (hm : access constant TCOD_heightmap_t; waterLevel : float) return Extensions.bool  -- heightmap.h:56
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_heightmap_has_land_on_border";

   procedure TCOD_heightmap_get_minmax
     (hm : access constant TCOD_heightmap_t;
      min : access float;
      max : access float)  -- heightmap.h:57
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_heightmap_get_minmax";

   procedure TCOD_heightmap_copy (hm_source : access constant TCOD_heightmap_t; hm_dest : access TCOD_heightmap_t)  -- heightmap.h:59
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_heightmap_copy";

   procedure TCOD_heightmap_add (hm : access TCOD_heightmap_t; value : float)  -- heightmap.h:60
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_heightmap_add";

   procedure TCOD_heightmap_scale (hm : access TCOD_heightmap_t; value : float)  -- heightmap.h:61
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_heightmap_scale";

   procedure TCOD_heightmap_clamp
     (hm : access TCOD_heightmap_t;
      min : float;
      max : float)  -- heightmap.h:62
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_heightmap_clamp";

   procedure TCOD_heightmap_normalize
     (hm : access TCOD_heightmap_t;
      min : float;
      max : float)  -- heightmap.h:63
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_heightmap_normalize";

   procedure TCOD_heightmap_clear (hm : access TCOD_heightmap_t)  -- heightmap.h:64
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_heightmap_clear";

   procedure TCOD_heightmap_lerp_hm
     (hm1 : access constant TCOD_heightmap_t;
      hm2 : access constant TCOD_heightmap_t;
      c_out : access TCOD_heightmap_t;
      coef : float)  -- heightmap.h:65
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_heightmap_lerp_hm";

   procedure TCOD_heightmap_add_hm
     (hm1 : access constant TCOD_heightmap_t;
      hm2 : access constant TCOD_heightmap_t;
      c_out : access TCOD_heightmap_t)  -- heightmap.h:67
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_heightmap_add_hm";

   procedure TCOD_heightmap_multiply_hm
     (hm1 : access constant TCOD_heightmap_t;
      hm2 : access constant TCOD_heightmap_t;
      c_out : access TCOD_heightmap_t)  -- heightmap.h:68
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_heightmap_multiply_hm";

   procedure TCOD_heightmap_add_hill
     (hm : access TCOD_heightmap_t;
      hx : float;
      hy : float;
      h_radius : float;
      h_height : float)  -- heightmap.h:71
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_heightmap_add_hill";

   procedure TCOD_heightmap_dig_hill
     (hm : access TCOD_heightmap_t;
      hx : float;
      hy : float;
      h_radius : float;
      h_height : float)  -- heightmap.h:72
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_heightmap_dig_hill";

   procedure TCOD_heightmap_dig_bezier
     (hm : access TCOD_heightmap_t;
      px : access int;
      py : access int;
      startRadius : float;
      startDepth : float;
      endRadius : float;
      endDepth : float)  -- heightmap.h:73
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_heightmap_dig_bezier";

   procedure TCOD_heightmap_rain_erosion
     (hm : access TCOD_heightmap_t;
      nbDrops : int;
      erosionCoef : float;
      sedimentationCoef : float;
      rnd : mersenne_types_h.TCOD_random_t)  -- heightmap.h:75
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_heightmap_rain_erosion";

  -- TCODLIB_API void TCOD_heightmap_heat_erosion(TCOD_heightmap_t *hm, int nbPass,float minSlope,float erosionCoef,float
  -- * sedimentationCoef,TCOD_random_t rnd);  

   procedure TCOD_heightmap_kernel_transform
     (hm : access TCOD_heightmap_t;
      kernelsize : int;
      dx : access int;
      dy : access int;
      weight : access float;
      minLevel : float;
      maxLevel : float)  -- heightmap.h:79
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_heightmap_kernel_transform";

   procedure TCOD_heightmap_add_voronoi
     (hm : access TCOD_heightmap_t;
      nbPoints : int;
      nbCoef : int;
      coef : access float;
      rnd : mersenne_types_h.TCOD_random_t)  -- heightmap.h:87
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_heightmap_add_voronoi";

   procedure TCOD_heightmap_mid_point_displacement
     (hm : access TCOD_heightmap_t;
      rnd : mersenne_types_h.TCOD_random_t;
      roughness : float)  -- heightmap.h:89
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_heightmap_mid_point_displacement";

   procedure TCOD_heightmap_add_fbm
     (hm : access TCOD_heightmap_t;
      noise : noise_h.TCOD_noise_t;
      mul_x : float;
      mul_y : float;
      add_x : float;
      add_y : float;
      octaves : float;
      c_delta : float;
      scale : float)  -- heightmap.h:90
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_heightmap_add_fbm";

   procedure TCOD_heightmap_scale_fbm
     (hm : access TCOD_heightmap_t;
      noise : noise_h.TCOD_noise_t;
      mul_x : float;
      mul_y : float;
      add_x : float;
      add_y : float;
      octaves : float;
      c_delta : float;
      scale : float)  -- heightmap.h:100
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_heightmap_scale_fbm";

   procedure TCOD_heightmap_islandify
     (hm : access TCOD_heightmap_t;
      seaLevel : float;
      rnd : mersenne_types_h.TCOD_random_t)  -- heightmap.h:111
   with Import => True, 
        Convention => C, 
        External_Name => "TCOD_heightmap_islandify";

end heightmap_h;
