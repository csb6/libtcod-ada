private with bresenham_h;

package Libtcod.Lines is

   -- Represent line in a data structure
   
   type Line is limited private;
   
   function make_line(start_x : X_Pos; start_y : Y_Pos;
                      end_x : X_Pos; end_y : Y_Pos) return Line;
   
   procedure copy_line(a : Line; b : out Line);
   
   function step(l : aliased in out Line;
                 x : aliased in out X_Pos; y : aliased in out Y_Pos) return Boolean
     with Inline;
   
   
   -- Iterate over a line without an explicit data structure
   
   type Line_Callback is access function(x : X_Pos; y : Y_Pos) return Boolean
     with Convention => C;
   
   function visit_line(start_x : X_Pos; start_y : Y_Pos;
                       end_x : X_Pos; end_y : Y_Pos; cb : Line_Callback) return Boolean
     with Inline;
   
private
   
   type Line is limited record
      data : aliased bresenham_h.TCOD_bresenham_data_t;
   end record;

end Libtcod.Lines;
