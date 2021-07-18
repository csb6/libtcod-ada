private with bsp_h;

package Libtcod.Maps.BSP is

   Max_Room_Size : constant := 12;
   Min_Room_Size : constant := 6;

   type BSP_Tree is tagged limited private;

   -- A reference to a node within a BSP_Tree; can't be constructed directly;
   -- used in callbacks
   type BSP_Node is tagged limited private;

   function make_BSP(x : X_Pos; y : Y_Pos; w : Width; h : Height) return BSP_Tree;

   -- Properties

   function is_leaf(self : in out BSP_Tree) return Boolean with Inline;
   function is_leaf(self : in out BSP_Node) return Boolean with Inline;

   function w(self : BSP_Tree) return Width with Inline;
   function w(self : BSP_Node) return Width with Inline;

   function h(self : BSP_Tree) return Height with Inline;
   function h(self : BSP_Node) return Height with Inline;

   function x(self : BSP_Tree) return X_Pos with Inline;
   function x(self : BSP_Node) return X_Pos with Inline;

   function y(self : BSP_Tree) return Y_Pos with Inline;
   function y(self : BSP_Node) return Y_Pos with Inline;

   -- Operations

   procedure split_recursive(self : in out BSP_Tree; recursion_level : Natural;
                             min_w : Width; min_h : Height;
                             min_wh_ratio, min_hw_ratio : Float);

   function traverse_inverted_level_order(self : in out BSP_Tree;
                                          cb : access function(self : in out BSP_Node) return Boolean) return Boolean;

private

   type BSP_Tree is tagged limited record
      data : aliased bsp_h.TCOD_bsp_t;
   end record;

   type BSP_Node is tagged limited record
      data : access bsp_h.TCOD_bsp_t;
   end record;

end Libtcod.Maps.BSP;
