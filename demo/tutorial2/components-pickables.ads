limited with Actors;

package Components.Pickables is

    -- Types

    type Kind_Type is (Kind_Health);
    type Pickable(kind : Kind_Type) is record
        case kind is
            when Kind_Health =>
                hp : Health;
        end case;
    end record;

    -- Actions

    function pick(owner : in out Actors.Actor; picker : in out Actors.Actor) return Boolean;
    function consume(owner : in out Actors.Actor; target : in out Actors.Actor) return Boolean;

end Components.Pickables;