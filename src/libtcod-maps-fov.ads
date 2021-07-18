package Libtcod.Maps.FOV is

   type Algorithm_Type is
     (
      -- Trace multiple Bresenham lines along the perimeter
      --  Based on: http://www.roguebasin.com/index.php?title=Ray_casting
      Fov_Basic,
      -- Cast Bresenham line shadows on a per-tile basis
      --  Based on: http://www.oocities.org/temerra/los_rays.html
      Fov_Diamond,
      -- Recursive Shadowcast
      --  Based on: http://www.roguebasin.com/index.php?title=FOV_using_recursive_shadowcasting
      Fov_Shadow,
      -- Precise Permissive Field of View
      --  Based on: http://www.roguebasin.com/index.php?title=Precise_Permissive_Field_of_View
      Fov_Permissive_0,
      Fov_Permissive_1,
      Fov_Permissive_2,
      Fov_Permissive_3,
      Fov_Permissive_4,
      Fov_Permissive_5,
      Fov_Permissive_6,
      Fov_Permissive_7,
      Fov_Permissive_8,
      -- Mingos' Restrictive Precise Angle Shadowcasting (contribution by Mingos)
      --  Based on: http://www.roguebasin.com/index.php?title=Restrictive_Precise_Angle_Shadowcasting
      Fov_Restrictive,
      -- Symmetric Shadowcast
      --  Based on: https://www.albertford.com/shadowcasting/
      Fov_Symmetric_Shadowcast)
     with Convention => C;

   procedure compute_FOV(m : in out Map; x : X_Pos; y : Y_Pos; max_radius : Radius;
                         light_walls : Boolean := True; algo : Algorithm_Type := Fov_Basic)
     with Inline;

   procedure compute_FOV(m : in out Map; pt : Point; max_radius : Radius;
                         light_walls : Boolean := True; algo : Algorithm_Type := Fov_Basic)
     with Inline;

   function in_FOV(m : Map; x : X_Pos; y : Y_Pos) return Boolean with Inline;

   function in_FOV(m : Map; pt : Point) return Boolean with Inline;

   procedure set_in_FOV(m : in out Map; x : X_Pos; y : Y_Pos; is_in : Boolean)
     with Inline;

   procedure set_in_FOV(m : in out Map; pt : Point; is_in : Boolean) with Inline;

end Libtcod.Maps.FOV;
