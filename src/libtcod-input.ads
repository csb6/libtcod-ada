with sys_h;
private with mouse_types_h, console_types_h;

package Libtcod.Input is

   type Mouse is private;

   type Key is private;

   -- A kind of event
   subtype Event_Type is sys_h.TCOD_event_t;

   Event_None : constant Event_Type := sys_h.TCOD_EVENT_NONE;
   Event_Key_Press : constant Event_Type := sys_h.TCOD_EVENT_KEY_PRESS;
   Event_Key_Release : constant Event_Type := sys_h.TCOD_EVENT_KEY_RELEASE;
   Event_Key : constant Event_Type := sys_h.TCOD_EVENT_KEY;
   Event_Mouse_Move : constant Event_Type := sys_h.TCOD_EVENT_MOUSE_MOVE;
   Event_Mouse_Press : constant Event_Type := sys_h.TCOD_EVENT_MOUSE_PRESS;
   Event_Mouse_Release : constant Event_Type := sys_h.TCOD_EVENT_MOUSE_RELEASE;
   Event_Mouse : constant Event_Type := sys_h.TCOD_EVENT_MOUSE;
   Event_Finger_Move : constant Event_Type := sys_h.TCOD_EVENT_FINGER_MOVE;
   Event_Finger_Press : constant Event_Type := sys_h.TCOD_EVENT_FINGER_PRESS;
   Event_Finger_Release : constant Event_Type := sys_h.TCOD_EVENT_FINGER_RELEASE;
   Event_Finger : constant Event_Type := sys_h.TCOD_EVENT_FINGER;
   Event_Any : constant Event_Type := sys_h.TCOD_EVENT_ANY;

   -- A kind of keypress
   type Key_Type is
     (Key_None,
      Key_Escape,
      Key_Backspace,
      Key_Tab,
      Key_Enter,
      -- Modifiers
      Key_Shift, Key_Control, Key_Alt,
      Key_Pause,
      Key_Capslock,
      Key_Pageup, Key_Pagedown,
      Key_End,
      Key_Home,
      -- Arrows
      Key_Up, Key_Left, Key_Right, Key_Down,
      Key_Printscreen,
      Key_Insert, Key_Delete,
      Key_Lwin, Key_Rwin,
      Key_Apps,
      -- Digits
      Key_0, Key_1, Key_2, Key_3, Key_4, Key_5, Key_6, Key_7, Key_8, Key_9,
      -- Keypad Digits
      Key_Kp0, Key_Kp1, Key_Kp2, Key_Kp3, Key_Kp4, Key_Kp5, Key_Kp6, Key_Kp7,
      Key_Kp8, Key_Kp9,
      -- Keypad Operators
      Key_Kpadd, Key_Kpsub, Key_Kpdiv, Key_Kpmul,
      Key_Kpdec,
      Key_Kpenter,
      -- Function keys
      Key_F1, Key_F2, Key_F3, Key_F4, Key_F5, Key_F6, Key_F7, Key_F8, Key_F9, Key_F10,
      Key_F11, Key_F12,
      Key_Numlock,
      Key_Scrolllock,
      Key_Space,
      Key_Char,
      -- (note: use Key_Text, then get_char to get characters that respect
      -- holding shift)
      Key_Text)
     with Convention => C;

   subtype Arrow_Key_Type is Key_Type range Key_Up .. Key_Down;
   subtype Function_Key_Type is Key_Type range Key_F1 .. Key_F12;
   subtype Whitespace_Key_Type is Key_Type
     with Static_Predicate => Whitespace_Key_Type in Key_Tab | Key_Enter | Key_Space;

   function get_key_type(k : Key) return Key_Type with Inline;
   -- Note: get_char assumes that the current Key's Key_Type is Key_Text
   function get_char(k : Key) return Character with Inline;
   function alt(k : Key) return Boolean with Inline;
   function ctrl(k : Key) return Boolean with Inline;
   function meta(k : Key) return Boolean with Inline;
   function shift(k : Key) return Boolean with Inline;


   function check_for_event(kind : Event_Type;
                            k : aliased out Key) return Event_Type with Inline;
   function check_for_event(kind : Event_Type; m : aliased out Mouse;
                            k : aliased out Key) return Event_Type with Inline;

private

   type Mouse is new mouse_types_h.TCOD_mouse_t;

   type Key is new console_types_h.TCOD_key_t;

end Libtcod.Input;
