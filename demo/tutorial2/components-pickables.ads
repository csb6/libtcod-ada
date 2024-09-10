limited with Engines, Actors;

package Components.Pickables is

    -- Types

    type Kind_Type is (Kind_Health, Kind_Lightning_Bolt);
    type Pickable(kind : Kind_Type) is record
        case kind is
            when Kind_Health =>
                hp : Health;
            when Kind_Lightning_Bolt =>
                bolt_range : Natural;
                bolt_damage : Health;
        end case;
    end record;

    -- Actions

    function pick(owner : in out Actors.Actor; picker : in out Actors.Actor) return Boolean;
    procedure consume(owner : in out Actors.Actor; wearer : in out Actors.Actor; engine : in out Engines.Engine);

end Components.Pickables;