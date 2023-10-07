limited with Actors, Engines;

package Components.AIs is

    type Kind_Type is (Kind_Player, Kind_Monster);
    type AI(kind : Kind_Type) is record
        case kind is
            when Kind_Monster =>
                move_count : Natural := 0;
            when Kind_Player =>
                null;
        end case;
    end record;

    procedure update(owner : in out Actors.Actor; engine : in out Engines.Engine);

end Components.AIs;