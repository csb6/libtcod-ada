with Libtcod.Input, Libtcod.Color;

package body Engines is

    Player_Id : constant Actors.Actor_Id := Actors.Player_Id;

    function create(w : Maps.Width; h : Maps.Height) return Engine is
    begin
        return self : Engine := (map_width => Maps.X_Pos(w), map_height => Maps.Y_Pos(h),
                                 map => Maps.create(w, h),
                                 actor_list => <>, running => <>) do
            self.actor_list.Append(Actors.Actor'(40, 25, '@', Libtcod.Color.white));
        end return;
    end create;

    procedure update(self : in out Engine) is
        use type Libtcod.Input.Event_Type, Maps.X_Pos, Maps.Y_Pos;

        function valid_map_x(x : Integer) return Boolean is (x in Integer(Maps.X_Pos'First) .. Integer(Maps.X_Pos'First + self.map_width) - 1);
        function valid_map_y(y : Integer) return Boolean is (y in Integer(Maps.Y_Pos'First) .. Integer(Maps.Y_Pos'First + self.map_height) - 1);

        key : aliased Libtcod.Input.Key;
        event_kind : Libtcod.Input.Event_Type := Libtcod.Input.check_for_event(Libtcod.Input.Event_Key_Press, key);
        player : Actors.Actor renames self.actor_list(Player_Id);
        player_x : Integer := Integer(player.x);
        player_y : Integer := Integer(player.y);
    begin
        if event_kind /= Libtcod.Input.Event_Key_Press then
            return;
        end if;

        case Libtcod.Input.get_key_type(key) is
            when Libtcod.Input.Key_Up => player_y := player_y - 1;
            when Libtcod.Input.Key_Down => player_y := player_y + 1;
            when Libtcod.Input.Key_Left => player_x := player_x - 1;
            when Libtcod.Input.Key_Right => player_x := player_x + 1;
            when Libtcod.Input.Key_Text =>
                case Libtcod.Input.get_char(key) is
                    when 'q' =>
                        self.running := False;
                    when others => null;
                end case;
            when others =>
                -- Ignore all other keypresses
                null;
        end case;

        if valid_map_x(player_x) and then valid_map_y(player_y)
           and then not Maps.is_wall(self.map, Maps.X_Pos(player_x), Maps.Y_Pos(player_y)) then
            player.x := Maps.X_Pos(player_x);
            player.y := Maps.Y_Pos(player_y);
        end if;
    end update;

    procedure render(self : in out Engine; screen : in out Libtcod.Console.Screen) is
    begin
        screen.clear;
        Maps.render(self.map, screen);

        for actor of reverse self.actor_list loop
            Actors.render(actor, screen);
        end loop;
    end render;

end Engines;