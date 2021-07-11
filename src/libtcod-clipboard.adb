with sys_h, Interfaces.C.Strings, Interfaces.C.Extensions;
use sys_h, Interfaces.C;

package body Libtcod.Clipboard is
   use type Extensions.bool;

   ---------
   -- set --
   ---------

   procedure set(value : String) is
      value_ptr : Strings.chars_ptr := Strings.New_String(value);
      status : Extensions.bool := TCOD_sys_clipboard_set(value_ptr);
   begin
      Strings.Free(value_ptr);
      if not status then
         raise Constraint_Error with "Failed to copy to the clipboard";
      end if;
   end set;

   ---------
   -- get --
   ---------

   function get return String is (Strings.Value(TCOD_sys_clipboard_get));

end Libtcod.Clipboard;
