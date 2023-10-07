limited with Actors, Engines;

package Components.Attackers is

    type Attacker is record
        damage : Health;
    end record;

    procedure attack(owner : Actors.Actor; target : in out Actors.Actor; engine : in out Engines.Engine);

end Components.Attackers;