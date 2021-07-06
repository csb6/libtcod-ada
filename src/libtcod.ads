with Interfaces.C;

package Libtcod is

   type Width is new Interfaces.C.int range 0 .. Interfaces.C.int'Last;
   type Height is new Interfaces.C.int range 0 .. Interfaces.C.int'Last;
   type X_Pos is new Interfaces.C.int range 0 .. Interfaces.C.int'Last;
   type Y_Pos is new Interfaces.C.int range 0 .. Interfaces.C.int'Last;

end Libtcod;
