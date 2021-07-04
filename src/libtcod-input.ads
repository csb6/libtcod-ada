with mouse_types_h, console_types_h;

package Libtcod.Input is
   
   subtype Mouse is mouse_types_h.TCOD_mouse_t;
   
   subtype Key is console_types_h.TCOD_key_t;

end Libtcod.Input;
