limited with Actors;

package Components.Pickables is

    type Pickable is abstract tagged null record;

    function pick(self : in out Pickable'Class;
                  picker : in out Actors.Actor;
                  target : Actor_Id) return Boolean;
    function consume(self : in out Pickable;
                     picker : in out Actors.Actor;
                     target : Actor_Id) return Boolean;

    type Healer is new Pickable with record
        amount : Health;
    end record;

    overriding
    function consume(self : in out Healer;
                     picker : in out Actors.Actor;
                     target : Actor_Id) return Boolean;

end Components.Pickables;