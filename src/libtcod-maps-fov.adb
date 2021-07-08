with fov_h, Interfaces.C.Strings, Interfaces.C.Extensions, Ada.Unchecked_Conversion,
     error_h;

package body Libtcod.Maps.FOV is
   use fov_types_h, fov_h, Interfaces.C, Interfaces.C.Extensions;

   function Algorithm_Type_To_TCOD_Algorithm is new Ada.Unchecked_Conversion
     (Source => Algorithm_Type, Target => TCOD_fov_algorithm_t);

   procedure compute_FOV(m : in out Map; x : X_Pos; y : Y_Pos; max_radius : Radius;
                         light_walls : Boolean; algo : Algorithm_Type) is
      err : error_h.TCOD_Error :=
        TCOD_map_compute_fov(m.data, int(x), int(y), int(max_radius), bool(light_walls),
                             Algorithm_Type_To_TCOD_Algorithm(algo));
   begin
      if err /= error_h.TCOD_E_OK then
         raise Error with Strings.Value(error_h.TCOD_get_error);
      end if;
   end compute_FOV;

   function in_FOV(m : Map; x : X_Pos; y : Y_Pos) return Boolean is
     (Boolean(TCOD_map_is_in_fov(m.data, int(x), int(y))));

   procedure set_in_FOV(m : in out Map; x : X_Pos; y : Y_Pos; is_in : Boolean) is
   begin
      TCOD_map_set_in_fov(m.data, int(x), int(y), bool(is_in));
   end set_in_FOV;

end Libtcod.Maps.FOV;
