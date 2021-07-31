limited with Actors, Engines;
private with Ada.Text_IO;

package Components is

   -- Stats

   type Health is range 0 .. 1000;
   type Defense is range 0 .. 25;

private

   package IO renames Ada.Text_IO;

end Components;
