

package Libtcod.Console is

   -- Background color blend modes
   type Background_Mode is
     (Background_None,
      Background_Set,
      Background_Multiply,
      Background_Lighten,
      Background_Darken,
      Background_Screen,
      Background_Color_Dodge,
      Background_Color_Burn,
      Background_Add,
      Background_Adda,
      Background_Burn,
      Background_Overlay,
      Background_Alpha,
      Background_Default)
     with Convention => C;

  -- Print justification options.
   type Alignment_Type is 
     (Alignment_Left,
      Alignment_Right,
      Alignment_Center)
     with Convention => C;

end Libtcod.Console;
