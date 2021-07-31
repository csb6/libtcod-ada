limited with Libtcod.Input;

package Components.AIs is

   type AI is abstract tagged null record;
   procedure update(self : in out AI; owner : in out Actors.Actor;
                    engine : in out Engines.Engine) is abstract;

   type Player_AI is new AI with null record;
   overriding procedure update(self : in out Player_AI; owner : in out Actors.Actor;
                               engine : in out Engines.Engine);


   Turns_To_Track : constant := 3;

   type Monster_AI is new AI with record
      move_count : Natural := Turns_To_Track;
   end record;
   overriding procedure update(self : in out Monster_AI; owner : in out Actors.Actor;
                               engine : in out Engines.Engine);

end Components.AIs;
