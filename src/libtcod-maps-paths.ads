private with path_h, Ada.Iterator_Interfaces;

package Libtcod.Maps.Paths is

   -- Note that an iterator is defined for Path, but that it does not recalculate
   -- the path if a new obstacle appears. For that capability, use walk().
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
   
   procedure get_start(p : Path; x : aliased in out X_Pos; y : aliased in out Y_Pos);
   
   procedure get_end(p : Path; x : aliased in out X_Pos; y : aliased in out Y_Pos);
   
   function empty(p : Path) return Boolean;
   
   function size(p : Path) return Natural;
   
   procedure reverse_in_place(p : in out Path);

private

   type Path is new Ada.Finalization.Limited_Controlled with record
      data : access path_h.TCOD_Path;
   end record
     with Default_Iterator => Iterate,
          Iterator_Element => Point,
          Constant_Indexing => Element_Value;

   overriding procedure Finalize(p : in out Path);

   type Cursor;

   function Has_Element(pos : Cursor) return Boolean;

   package Line_Iterators is new Ada.Iterator_Interfaces(Cursor, Has_Element);

   type Iterator is new Line_Iterators.Forward_Iterator with record
      data : access path_h.TCOD_Path;
      i : Index;
   end record;

   type Cursor is record
      data : access path_h.TCOD_Path;
      i : Index;
   end record;

   overriding function First(it : Iterator) return Cursor;
   overriding function Next(it : Iterator; pos : Cursor) return Cursor;

   function Iterate(p : Path) return Line_Iterators.Forward_Iterator'Class;

   function Element_Value(p : Path; pos : Cursor) return Point;

end Libtcod.Maps.Paths;
