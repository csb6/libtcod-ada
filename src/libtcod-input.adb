with Ada.Unchecked_Conversion, Interfaces.C, Interfaces.C.Extensions;

package body Libtcod.Input is
   use sys_h, console_types_h, mouse_types_h, Interfaces.C;
   use type Interfaces.C.Extensions.bool;

   function TCOD_Keycode_To_Key_Type is new Ada.Unchecked_Conversion
     (Source => TCOD_keycode_t, Target => Key_Type);

   function get_key_type(k : Key) return Key_Type is (TCOD_Keycode_To_Key_Type(k.vk));

   function get_char(k : Key) return Character is (Character(k.c));

   function alt(k : Key) return Boolean is (Boolean(k.lalt or k.ralt));
   function ctrl(k : Key) return Boolean is (Boolean(k.lctrl or k.rctrl));
   function meta(k : Key) return Boolean is (Boolean(k.lmeta or k.rmeta));
   function shift(k : Key) return Boolean is (Boolean(k.shift));

   type Key_Ptr is access all Key;
   type TCOD_Key_Ptr is access all TCOD_key_t;
   type Mouse_Ptr is access all Mouse;
   type TCOD_Mouse_Ptr is access all TCOD_mouse_t;

   -- Should be safe to do since Key is a derived type of TCOD_key_T with no
   -- added constraints
   function Key_Ptr_To_TCOD_Key_Ptr is new Ada.Unchecked_Conversion
     (Source => Key_Ptr, Target => TCOD_Key_Ptr);
   function Mouse_Ptr_To_TCOD_Mouse_Ptr is new Ada.Unchecked_Conversion
     (Source => Mouse_Ptr, Target => TCOD_Mouse_Ptr);

   ---------------------
   -- check_for_event --
   ---------------------

   function check_for_event(kind : Event_Type; m : aliased out Mouse;
                            k : aliased out Key) return Event_Type is
   begin
      return TCOD_sys_check_for_event(int(kind), Key_Ptr_To_TCOD_Key_Ptr(k'Access),
                                      Mouse_Ptr_To_TCOD_Mouse_Ptr(m'Access));
   end check_for_event;
end Libtcod.Input;
