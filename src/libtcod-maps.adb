with fov_h, Interfaces.C.Extensions;

package body Libtcod.Maps is
   use fov_h, Interfaces.C, Interfaces.C.Extensions;

   subtype Limited_Controlled is Ada.Finalization.Limited_Controlled;

   procedure increment(x : in out X_Pos; d : X_Diff) is
   begin
      x := X_Pos(X_Diff(x) + d);
   end increment;

   function "+"(x : X_Pos; d : X_Diff) return X_Pos is (X_Pos(X_Diff(x) + d));

   function "-"(x : X_Pos; d : X_Pos) return X_Diff is (X_Diff(x) - X_Diff(d));

   procedure increment(y : in out Y_Pos; d : Y_Diff) is
   begin
      y := Y_Pos(Y_Diff(y) + d);
   end increment;

   function "+"(y : Y_Pos; d : Y_Diff) return Y_Pos is (Y_Pos(Y_Diff(y) + d));

   function "-"(x : Y_Pos; d : Y_Pos) return Y_Diff is (Y_Diff(x) - Y_Diff(d));

   function make_map(width : X_Pos; height : Y_Pos) return Map is
   begin
      return result : Map :=
        Map'(Limited_Controlled with TCOD_map_new(int(width), int(height)));
   end make_map;

   overriding procedure Finalize(m : in out Map) is
   begin
      TCOD_map_delete(m.data);
   end Finalize;

   function get_width(m : Map) return X_Pos is (X_Pos(TCOD_map_get_width(m.data)));

   function get_height(m : Map) return Y_Pos is (Y_Pos(TCOD_map_get_height(m.data)));

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
