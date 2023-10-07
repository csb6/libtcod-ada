limited with Actors, Engines;

package Components.Destructibles is

    -- Types

    type Kind_Type is (Kind_Player, Kind_Monster);
    type Destructible(kind : Kind_Type) is record
        max_hp : Health;
        hp : Health;
        defense : Health;
    end record;

    -- Properties

    function is_dead(self : Destructible) return Boolean is (self.hp = 0);

    -- Actions

    function take_damage(owner : in out Actors.Actor; damage : Health; engine : in out Engines.Engine) return Health;
    procedure die(owner : in out Actors.Actor; engine : in out Engines.Engine);

end Components.Destructibles;