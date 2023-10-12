private with Ada.Finalization, fov_types_h;

package Libtcod.Maps is

   Error : exception;

   type X_Pos is new Interfaces.C.int range 0 .. Interfaces.C.int'Last;
   type Y_Pos is new Interfaces.C.int range 0 .. Interfaces.C.int'Last;
   type X_Diff is new Interfaces.C.int;
   type Y_Diff is new Interfaces.C.Int;

   procedure increment(x : in out X_Pos; d : X_Diff);
   function "+"(x : X_Pos; d : X_Diff) return X_Pos;
   function "-"(x : X_Pos; d : X_Pos) return X_Diff;
   procedure increment(y : in out Y_Pos; d : Y_Diff);
   function "+"(y : Y_Pos; d : Y_Diff) return Y_Pos;
   function "-"(x : Y_Pos; d : Y_Pos) return Y_Diff;

   type Radius is range 0 .. Integer'Last;


   type Map is tagged limited private;

   function make_map(width : X_Pos; height : Y_Pos) return Map;

   function get_width(m : Map) return X_Pos with Inline;

   function get_height(m : Map) return Y_Pos with Inline;

   function get_cell_count(m : Map) return Natural with Inline;

   procedure set_properties_all(m : in out Map; transparent, walkable : Boolean)
     with Inline;

   procedure set_properties(m : in out Map; x : X_Pos; y : Y_Pos;
                            transparent, walkable : Boolean) with Inline;

   function is_transparent(m : Map; x : X_Pos; y : Y_Pos) return Boolean
     with Inline;

   function is_walkable(m : Map; x : X_Pos; y : Y_Pos) return Boolean
     with Inline;

private

   type Map is new Ada.Finalization.Limited_Controlled with record
      data : access fov_types_h.TCOD_Map;
   end record;

   overriding procedure Finalize(m : in out Map);

end Libtcod.Maps;
