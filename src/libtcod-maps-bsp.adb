with Interfaces.C.Extensions, Interfaces.C, System, System.Address_To_Access_Conversions;

package body Libtcod.Maps.BSP is
   use Interfaces.C, bsp_h;

   --------------
   -- make_BSP --
   --------------

   function make_BSP(x : X_Pos; y : Y_Pos; w : Width; h : Height) return BSP_Tree is
   begin
      return self : BSP_Tree :=
        (data => (tree => (others => null),
                  horizontal => False,
                  x => int(x), y => int(y), w => int(w), h => int(h),
                  level => 0, others => 0));
   end make_BSP;

   function is_leaf(self : in out BSP_Tree) return Boolean is (Boolean(TCOD_bsp_is_leaf(self.data'Access)));
   function is_leaf(self : BSP_Node) return Boolean is (Boolean(TCOD_bsp_is_leaf(self.data)));

   function w(self : BSP_Tree) return Width is (Width(self.data.w));
   function w(self : BSP_Node) return Width is (Width(self.data.w));

   function h(self : BSP_Tree) return Height is (Height(self.data.h));
   function h(self : BSP_Node) return Height is (Height(self.data.h));

   function x(self : BSP_Tree) return X_Pos is (X_Pos(self.data.x));
   function x(self : BSP_Node) return X_Pos is (X_Pos(self.data.x));

   function y(self : BSP_Tree) return Y_Pos is (Y_Pos(self.data.y));
   function y(self : BSP_Node) return Y_Pos is (Y_Pos(self.data.y));

   ---------------------
   -- split_recursive --
   ---------------------

   procedure split_recursive(self : in out BSP_Tree; recursion_level : Natural;
                             min_w : Width; min_h : Height;
                             min_wh_ratio, min_hw_ratio : Float) is
   begin
      TCOD_bsp_split_recursive(self.data'Access, null, int(recursion_level),
                               int(min_w), int(min_h), min_wh_ratio,
                               min_hw_ratio);
   end split_recursive;

   -----------------------------------
   -- traverse_inverted_level_order --
   -----------------------------------

   type Callback is access function(self : in out BSP_Node) return Boolean;

   package Callback_Converter is new System.Address_To_Access_Conversions(Callback);

   function traverse_helper(node : access TCOD_bsp_t;
                            data : System.Address) return Extensions.bool
     with Convention => C;

   function traverse_helper(node : access TCOD_bsp_t;
                            data : System.Address) return Extensions.bool is
      ada_cb : access Callback := Callback_Converter.To_Pointer(data);
      node_obj : BSP_Node := (data => node);
   begin
      return Extensions.bool(ada_cb.all(node_obj));
   end traverse_helper;

   function traverse_inverted_level_order(self : in out BSP_Tree;
                                          cb : access function(self : in out BSP_Node) return Boolean) return Boolean is
   begin
      return Boolean(TCOD_bsp_traverse_inverted_level_order(self.data'Access,
                     traverse_helper'Access, cb'Address));
   end traverse_inverted_level_order;

end Libtcod.Maps.BSP;
