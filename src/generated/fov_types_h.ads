pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;

package fov_types_h is

   --  arg-macro: function FOV_PERMISSIVE (x)
   --    return (TCOD_fov_algorithm_t)(FOV_PERMISSIVE_0 + (x));
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

  --*
  -- *  Private map cell struct.
  --  

   type TCOD_MapCell is record
      transparent : aliased Extensions.bool;  -- fov_types.h:39
      walkable : aliased Extensions.bool;  -- fov_types.h:40
      fov : aliased Extensions.bool;  -- fov_types.h:41
   end record
   with Convention => C_Pass_By_Copy;  -- fov_types.h:38

  --*
  -- *  Private map struct.
  --  

   type TCOD_Map is record
      width : aliased int;  -- fov_types.h:47
      height : aliased int;  -- fov_types.h:48
      nbcells : aliased int;  -- fov_types.h:49
      cells : access TCOD_MapCell;  -- fov_types.h:50
   end record
   with Convention => C_Pass_By_Copy;  -- fov_types.h:46

   type TCOD_map_t is access all TCOD_Map;  -- fov_types.h:52

  --*
  --    \rst
  --    Field-of-view options for :any:`TCOD_map_compute_fov`.
  --    \endrst
  --  

  --*
  --      Trace multiple Bresenham lines along the perimeter.
  --      Based on: http://www.roguebasin.com/index.php?title=Ray_casting
  --    

  --*
  --      Cast Bresenham line shadows on a per-tile basis.
  --      Based on: http://www.oocities.org/temerra/los_rays.html
  --    

  --*
  --      Recursive Shadowcast.
  --      Based on: http://www.roguebasin.com/index.php?title=FOV_using_recursive_shadowcasting
  --    

  --*
  --      Precise Permissive Field of View.
  --      Based on: http://www.roguebasin.com/index.php?title=Precise_Permissive_Field_of_View
  --    

  --*
  --      Mingos' Restrictive Precise Angle Shadowcasting (contribution by Mingos)
  --      Based on: http://www.roguebasin.com/index.php?title=Restrictive_Precise_Angle_Shadowcasting
  --    

  --*
  --      Symmetric Shadowcast.
  --      Based on: https://www.albertford.com/shadowcasting/
  --      \rst
  --      .. versionadded :: 1.16
  --      \endrst
  --    

   type TCOD_fov_algorithm_t is 
     (FOV_BASIC,
      FOV_DIAMOND,
      FOV_SHADOW,
      FOV_PERMISSIVE_0,
      FOV_PERMISSIVE_1,
      FOV_PERMISSIVE_2,
      FOV_PERMISSIVE_3,
      FOV_PERMISSIVE_4,
      FOV_PERMISSIVE_5,
      FOV_PERMISSIVE_6,
      FOV_PERMISSIVE_7,
      FOV_PERMISSIVE_8,
      FOV_RESTRICTIVE,
      FOV_SYMMETRIC_SHADOWCAST,
      NB_FOV_ALGORITHMS)
   with Convention => C;  -- fov_types.h:107

end fov_types_h;
