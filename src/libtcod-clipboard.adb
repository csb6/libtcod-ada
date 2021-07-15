with sys_h, Interfaces.C.Strings, Interfaces.C.Extensions;
use sys_h, Interfaces.C;

package body Libtcod.Clipboard is
   use type Extensions.bool;

   ---------
   -- set --
   ---------

   procedure set(value : String) is
      c_value : aliased char_array := To_C(value);
      status : Extensions.bool
        := TCOD_sys_clipboard_set(Strings.To_Chars_Ptr(c_value'Unchecked_Access));
   begin
      if not status then
         raise Constraint_Error with "Failed to copy to the clipboard";
      end if;
   end set;

   ---------
   -- get --
   ---------

   function get return String is (Strings.Value(TCOD_sys_clipboard_get));

end Libtcod.Clipboard;
