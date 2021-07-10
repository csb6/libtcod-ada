private with Ada.Finalization, fov_types_h;

package Libtcod.Maps is

   Error : exception;
   
   
   type Map is tagged limited private;

   function make_map(w : Width; h : Height) return Map;

   function get_width(m : Map) return Width with Inline;

   function get_height(m : Map) return Height with Inline;

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
   subtype Limited_Controlled is Ada.Finalization.Limited_Controlled;

   overriding procedure Finalize(m : in out Map);

end Libtcod.Maps;