with mouse_types_h, sys_h, console_types_h;

package Libtcod.Input is

   subtype Mouse is mouse_types_h.TCOD_mouse_t;

   subtype Key is console_types_h.TCOD_key_t;

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

   function check_for_event(m : aliased out Mouse;
                            k : aliased out Key) return Event_Type;

end Libtcod.Input;
