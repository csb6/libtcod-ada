with fov_h, Interfaces.C.Strings, Interfaces.C.Extensions, Ada.Unchecked_Conversion,
     error_h;

package body Libtcod.Maps.FOV is
   use fov_types_h, fov_h, Interfaces.C, Interfaces.C.Extensions;

   function Algorithm_Type_To_TCOD_Algorithm is new Ada.Unchecked_Conversion
     (Source => Algorithm_Type, Target => TCOD_fov_algorithm_t);

   -----------------
   -- compute_FOV --
   -----------------

   procedure compute_FOV(m : in out Map; x : X_Pos; y : Y_Pos; max_radius : Radius;
                         light_walls : Boolean := True; algo : Algorithm_Type := Fov_Basic) is
      err : error_h.TCOD_Error :=
        TCOD_map_compute_fov(m.data, int(x), int(y), int(max_radius), bool(light_walls),
                             Algorithm_Type_To_TCOD_Algorithm(algo));
   begin
      if err /= error_h.TCOD_E_OK then
         raise Error with Strings.Value(error_h.TCOD_get_error);
      end if;
   end compute_FOV;

   procedure compute_FOV(m : in out Map; pt : Point; max_radius : Radius;
                         light_walls : Boolean := True; algo : Algorithm_Type := Fov_Basic) is
   begin
      compute_FOV(m, pt.x, pt.y, max_radius, light_walls, algo);
   end compute_FOV;

   ------------
   -- in_FOV --
   ------------

   function in_FOV(m : Map; x : X_Pos; y : Y_Pos) return Boolean is
     (Boolean(TCOD_map_is_in_fov(m.data, int(x), int(y))));

   function in_FOV(m : Map; pt : Point) return Boolean is (in_FOV(m, pt.x, pt.y));

   ----------------
   -- set_in_FOV --
   ----------------

   procedure set_in_FOV(m : in out Map; x : X_Pos; y : Y_Pos; is_in : Boolean) is
   begin
      TCOD_map_set_in_fov(m.data, int(x), int(y), bool(is_in));
   end set_in_FOV;

   procedure set_in_FOV(m : in out Map; pt : Point; is_in : Boolean) is
   begin
      set_in_FOV(m, pt.x, pt.y, is_in);
   end set_in_FOV;

end Libtcod.Maps.FOV;
