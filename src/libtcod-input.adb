package body Libtcod.Input is

   ---------------------
   -- check_for_event --
   ---------------------

   function check_for_event (m : aliased out Mouse;
                             k : aliased out Key) return Event_Type is
     (Event_Type(TCOD_sys_check_for_event(0, k'Access, m'Access)));

end Libtcod.Input;
