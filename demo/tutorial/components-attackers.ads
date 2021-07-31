package Components.Attackers is

   type Attacker is tagged record
      power : Health;
   end record;
   procedure attack(self : in out Attacker; owner : in out Actors.Actor;
                    target : in out Actors.Actor; engine : in out Engines.Engine);

end Components.Attackers;
