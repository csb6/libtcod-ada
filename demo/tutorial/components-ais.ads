package Components.AIs is

   type AI is abstract tagged null record;
   procedure update(self : in out AI; owner : in out Actors.Actor;
                    engine : in out Engines.Engine) is abstract;

   type Player_AI is new AI with private;
   overriding procedure update(self : in out Player_AI; owner : in out Actors.Actor;
                               engine : in out Engines.Engine);

   type Monster_AI is new AI with private;
   overriding procedure update(self : in out Monster_AI; owner : in out Actors.Actor;
                               engine : in out Engines.Engine);

private

   Turns_To_Track : constant := 3;

   type Player_AI is new AI with null record;

   type Monster_AI is new AI with record
      move_count : Natural := Turns_To_Track;
   end record;

end Components.AIs;
