with fov_h, Interfaces.C.Strings, Interfaces.C.Extensions;

package body Libtcod.Maps is
   use fov_h, Interfaces.C, Interfaces.C.Extensions;

   function make_map(w : Width; h : Height) return Map is
   begin
      return result : Map :=
        Map'(Limited_Controlled with TCOD_map_new(int(w), int(h)));
   end make_map;

   overriding procedure Finalize(m : in out Map) is
   begin
      TCOD_map_delete(m.data);
   end Finalize;

   function get_width(m : Map) return Width is (Width(TCOD_map_get_width(m.data)));

   function get_height(m : Map) return Height is (Height(TCOD_map_get_height(m.data)));

   function get_cell_count(m : Map) return Natural is
     (Natural(TCOD_map_get_nb_cells(m.data)));

   procedure set_properties_all(m : in out Map; transparent, walkable : Boolean) is
   begin
      TCOD_map_clear(m.data, bool(transparent), bool(walkable));
   end set_properties_all;

   procedure set_properties(m : in out Map; x : X_Pos; y : Y_Pos;
                            transparent, walkable : Boolean) is
   begin
      TCOD_map_set_properties(m.data, int(x), int(y), bool(transparent), bool(walkable));
   end set_properties;
   
   function is_transparent(m : Map; x : X_Pos; y : Y_Pos) return Boolean is
     (Boolean(TCOD_map_is_transparent(m.data, int(x), int(y))));

   function is_walkable(m : Map; x : X_Pos; y : Y_Pos) return Boolean is
     (Boolean(TCOD_map_is_walkable(m.data, int(x), int(y))));

end Libtcod.Maps;
