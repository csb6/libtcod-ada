with Interfaces.C, Interfaces.C.Extensions, Ada.Unchecked_Conversion;

package body Libtcod.Lines is
   use bresenham_h, Interfaces.C, Interfaces.C.Extensions;
   
   type Int_Ptr is access all int;

   type X_Pos_Ptr is access all X_Pos;

   type Y_Pos_Ptr is access all Y_Pos;

   function X_Ptr_To_Int_Ptr is new Ada.Unchecked_Conversion
     (Source => X_Pos_Ptr, Target => Int_Ptr);

   function Y_Ptr_To_Int_Ptr is new Ada.Unchecked_Conversion
     (Source => Y_Pos_Ptr, Target => Int_Ptr);
   
   function Line_Cb_To_TCOD_Cb is new Ada.Unchecked_Conversion
     (Source => Line_Callback, Target => TCOD_line_listener_t);

   ---------------
   -- make_line --
   ---------------
   
   function make_line(start_x : X_Pos; start_y : Y_Pos;
                      end_x : X_Pos; end_y : Y_Pos) return Line is
   begin
      return l : Line do
         TCOD_line_init_mt(int(start_x), int(start_y),
                           int(end_x), int(end_y), l.data'Access);
      end return;
   end make_line;
   
   ---------------
   -- copy_line --
   ---------------
   
   procedure copy_line(a : Line; b : out Line) is
   begin
      b.data := a.data;
   end copy_line;
   
   ----------
   -- step --
   ----------
   
   function step(l : aliased in out Line;
                 x : aliased in out X_Pos; y : aliased in out Y_Pos) return Boolean is
     (Boolean(TCOD_line_step_mt(X_Ptr_To_Int_Ptr(x'Unchecked_Access),
                                Y_Ptr_To_Int_Ptr(y'Unchecked_Access),
                                l.data'Access)));
   
   ----------------
   -- visit_line --
   ----------------
   
   function visit_line(start_x : X_Pos; start_y : Y_Pos;
                       end_x : X_Pos; end_y : Y_Pos; cb : Line_Callback) return Boolean is
     (Boolean(TCOD_line(int(start_x), int(start_y), int(end_x), int(end_y),
                        Line_Cb_To_TCOD_Cb(cb))));
   
end Libtcod.Lines;
