with Ada.Unchecked_Conversion, Interfaces.C.Extensions;

package body Libtcod.Maps.Paths is
   use path_h, Interfaces.C, Interfaces.C.Extensions;

   type Int_Ptr is access all int;

   type X_Pos_Ptr is access all X_Pos;

   type Y_Pos_Ptr is access all Y_Pos;

   function X_Ptr_To_Int_Ptr is new Ada.Unchecked_Conversion
     (Source => X_Pos_Ptr, Target => Int_Ptr);

   function Y_Ptr_To_Int_Ptr is new Ada.Unchecked_Conversion
     (Source => Y_Pos_Ptr, Target => Int_Ptr);

   ---------------
   -- make_path --
   ---------------

   function make_path(m : Map; diagonal_cost : Cost) return Path is
   begin
      return p : Path :=
        Path'(Limited_Controlled with TCOD_path_new_using_map(m.data, Float(diagonal_cost)));
   end make_path;

   overriding procedure Finalize(p : in out Path) is
   begin
      TCOD_path_delete(p.data);
   end Finalize;

   -------------
   -- compute --
   -------------

   function compute(p : in out Path; start_x : X_Pos; start_y : Y_Pos;
                    end_x : X_Pos; end_y : Y_Pos) return Boolean is
     (Boolean(TCOD_path_compute(p.data, int(start_x), int(start_y),
                                int(end_x), int(end_y))));

   ----------
   -- walk --
   ----------

   function walk(p : Path; x : aliased out X_Pos; y : aliased out Y_Pos;
                 recalc_when_needed : Boolean := True) return Boolean is
     (Boolean(TCOD_path_walk(p.data, X_Ptr_To_Int_Ptr(x'Unchecked_Access),
                             Y_Ptr_To_Int_Ptr(y'Unchecked_Access),
                             bool(recalc_when_needed))));

   ---------
   -- get --
   ---------

   procedure get(p : Path; i : Index;
                 x : aliased out X_Pos; y : aliased out Y_Pos) is
   begin
      TCOD_path_get(p.data, int(i), X_Ptr_To_Int_Ptr(x'Unchecked_Access),
                    Y_Ptr_To_Int_Ptr(y'Unchecked_Access));
   end get;

   ---------------
   -- get_start --
   ---------------

   procedure get_start(p : Path; x : aliased in out X_Pos; y : aliased in out Y_Pos) is
   begin
      TCOD_path_get_origin(p.data, X_Ptr_To_Int_Ptr(x'Unchecked_Access),
                           Y_Ptr_To_Int_Ptr(y'Unchecked_Access));
   end get_start;

   -------------
   -- get_end --
   -------------

   procedure get_end(p : Path; x : aliased in out X_Pos; y : aliased in out Y_Pos) is
   begin
      TCOD_path_get_destination(p.data, X_Ptr_To_Int_Ptr(x'Unchecked_Access),
                                Y_Ptr_To_Int_Ptr(y'Unchecked_Access));
   end get_end;

   -----------
   -- empty --
   -----------

   function empty(p : Path) return Boolean is (Boolean(TCOD_path_is_empty(p.data)));

   ----------
   -- size --
   ----------

   function size(p : Path) return Natural is (Natural(TCOD_path_size(p.data)));

   ----------------------
   -- reverse_in_place --
   ----------------------

   procedure reverse_in_place(p : in out Path) is
   begin
      TCOD_path_reverse(p.data);
   end reverse_in_place;

end Libtcod.Maps.Paths;
