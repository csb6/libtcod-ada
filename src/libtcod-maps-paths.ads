private with path_h;

package Libtcod.Maps.Paths is

   type Path is limited private;


   type Cost is new Float;

   type Index is range 0 .. Integer'Last;


   function make_path(m : Map; diagonal_cost : Cost) return Path;

   function compute(p : in out Path; start_x : X_Pos; start_y : Y_Pos;
                    end_x : X_Pos; end_y : Y_Pos) return Boolean;

   function walk(p : Path; x : aliased out X_Pos; y : aliased out Y_Pos;
                 recalc_when_needed : Boolean := True) return Boolean;

   procedure get(p : Path; i : Index;
                 x : aliased out X_Pos; y : aliased out Y_Pos);

   procedure get_start(p : Path; x : aliased out X_Pos; y : aliased out Y_Pos);

   procedure get_end(p : Path; x : aliased out X_Pos; y : aliased out Y_Pos);

   function empty(p : Path) return Boolean with Inline;

   function size(p : Path) return Natural with Inline;

   procedure reverse_in_place(p : in out Path) with Inline;

private

   type Path is new Ada.Finalization.Limited_Controlled with record
      data : access path_h.TCOD_Path;
   end record;

   overriding procedure Finalize(p : in out Path);

end Libtcod.Maps.Paths;
