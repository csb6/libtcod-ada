with Ada.Assertions, Ada.Numerics.Discrete_Random, Ada.Containers; use Ada.Assertions;
with Libtcod.Input, Libtcod.Color, Libtcod.Maps.BSP;

package body Engines is

    use type Actors.Actor_Id, Maps.X_Pos, Maps.Y_Pos, Maps.Width, Maps.Height, Ada.Containers.Count_Type;

    Player_Id : Actors.Actor_Id renames Actors.Player_Id;

    -- Level generation constants
    Max_Room_Size : constant := 12;
    Min_Room_Size : constant := 6;
    Max_Room_Monsters : constant := 3;

    -- FOV constants
    FOV_Radius : constant := 10;

    -- Subprogram declarations

    procedure generate_level(self : in out Engine);
    function get_actor_at_pos(self : Engine; x : Maps.X_Pos; y : Maps.Y_Pos) return Actors.Actor_Id;
    procedure add_monster(self : in out Engine; x : Maps.X_Pos; y : Maps.Y_Pos);

    -- Subprogram definitions

    package Int_Randoms is new Ada.Numerics.Discrete_Random(Result_Subtype => Natural);
    Int_Random_Gen : Int_Randoms.Generator;
    function Rand(First, Last : Natural) return Natural is (Int_Randoms.Random(Int_Random_Gen, first, last));

    function create(w : Maps.Width; h : Maps.Height) return Engine is
    begin
        return self : Engine := (map_width => Maps.X_Pos(w), map_height => Maps.Y_Pos(h),
                                 map => Maps.create(w, h),
                                 actor_list => <>, status => <>) do
            self.actor_list.Append(Actors.create(0, 0, '@', Actors.create_name("Player"), Libtcod.Color.white));
            generate_level(self);
            Maps.compute_fov(self.map, self.actor_list(Player_Id).x, self.actor_list(Player_Id).y, FOV_Radius);
        end return;
    end create;

    procedure update(self : in out Engine) is
        use type Libtcod.Input.Event_Type;

        key : aliased Libtcod.Input.Key;
        event_kind : Libtcod.Input.Event_Type := Libtcod.Input.check_for_event(Libtcod.Input.Event_Key_Press, key);
        player : Actors.Actor renames self.actor_list(Player_Id);
        player_x : Maps.X_Pos := player.x;
        player_y : Maps.Y_Pos := player.y;

        procedure update_player_state is
            target_id : Actors.Actor_Id;
        begin
            self.status := New_Turn;
            if Maps.is_walkable(self.map, player_x, player_y) then
                -- No map obstructions found here
                target_id := get_actor_at_pos(self, player_x, player_y);
                if target_id = Actors.Invalid_Actor_Id then
                    -- Move
                    player.x := player_x;
                    player.y := player_y;
                    Maps.compute_fov(self.map, player.x, player.y, FOV_Radius);
                else
                    -- Attack the actor present here
                    Actors.attack(player, self.actor_list(target_id));
                end if;
            end if;
        end update_player_state;
    begin
        self.status := Idle;
        if event_kind /= Libtcod.Input.Event_Key_Press then
            return;
        end if;

        case Libtcod.Input.get_key_type(key) is
            when Libtcod.Input.Key_Up =>
                player_y := player_y - Maps.Y_Pos(1);
                update_player_state;
            when Libtcod.Input.Key_Down =>
                player_y := player_y + Maps.Y_Pos(1);
                update_player_state;
            when Libtcod.Input.Key_Left =>
                player_x := player_x - Maps.X_Pos(1);
                update_player_state;
            when Libtcod.Input.Key_Right =>
                player_x := player_x + Maps.X_Pos(1);
                update_player_state;
            when Libtcod.Input.Key_Char =>
                if (Libtcod.Input.meta(key) or else Libtcod.Input.ctrl(key)) and then Libtcod.Input.get_char(key) = 'q' then
                    self.status := Defeat;
                end if;
            when others =>
                -- Ignore all other keypresses
                null;
        end case;

        if self.status = New_Turn then
            for actor_id in Actors.Actor_Id'Succ(Player_Id) .. Actors.Actor_Id(self.actor_list.Length - 1) loop
                Actors.update(self.actor_list(actor_id));
            end loop;
        end if;
    end update;

    procedure render(self : in out Engine; screen : in out Libtcod.Console.Screen) is
    begin
        screen.clear;
        Maps.render(self.map, screen);
        for actor of reverse self.actor_list loop
            if Maps.in_fov(self.map, actor.x, actor.y) then
                Actors.render(actor, screen);
            end if;
        end loop;
    end render;

    procedure generate_level(self : in out Engine) is
        player : Actors.Actor renames self.actor_list(Player_Id);
        room_num : Natural := 0;
        last_x : Maps.X_Pos;
        last_y : Maps.Y_Pos;

        function visit(node : in out Libtcod.Maps.BSP.BSP_Node) return Boolean is
            function "+"(x : Maps.X_Pos; w : Maps.Width) return Integer is (Integer(x) + Integer(w));
            function "+"(y : Maps.Y_Pos; h : Maps.Height) return Integer is (Integer(y) + Integer(h));

            w : Maps.Width;
            h : Maps.Height;
            start_x, end_x, center_x, monster_x : Maps.X_Pos;
            start_y, end_y, center_y, monster_y : Maps.Y_Pos;
            monster_count : Natural;
        begin
            if node.is_leaf then
                w := Maps.Width(Rand(First => Min_Room_Size, Last => Natural(node.w) - 2));
                h := Maps.Height(Rand(First => Min_Room_Size, Last => Natural(node.h) - 2));
                start_x := Maps.X_Pos(Rand(First => Natural(node.x) + 1, Last => node.x + (node.w - w) - 1));
                start_y := Maps.Y_Pos(Rand(First => Natural(node.y) + 1, Last => node.y + (node.h - h) - 1));
                center_x := start_x + Maps.X_Pos(w / 2);
                center_y := start_y + Maps.Y_Pos(h / 2);
                end_x := start_x + Maps.X_Pos(w - 1);
                end_y := start_y + Maps.Y_Pos(h - 1);

                Maps.dig(self.map, start_x, start_y, end_x, end_y);
                if room_num = 0 then
                    -- Place player in room 0
                    player.x := center_x;
                    player.y := center_y;
                else
                    -- Dig corridors connecting to the previous room
                    Maps.dig(self.map, last_x, last_y, center_x, last_y);
                    Maps.dig(self.map, center_x, last_y, center_x, center_y);

                    monster_count := Rand(0, Max_Room_Monsters);
                    for i in 1 .. monster_count loop
                        monster_x := Maps.X_Pos(Rand(Natural(start_x), Natural(end_x)));
                        monster_y := Maps.Y_Pos(Rand(Natural(start_y), Natural(end_y)));
                        if get_actor_at_pos(self, monster_x, monster_y) = Actors.Invalid_Actor_Id then
                            add_monster(self, monster_x, monster_y);
                        end if;
                    end loop;
                end if;
                last_x := center_x;
                last_y := center_y;
                room_num := room_num + 1;
            end if;
            return True;
        end visit;

        bsp : Libtcod.Maps.BSP.BSP_Tree := Libtcod.Maps.BSP.make_BSP(
                Maps.X_Pos'First, Maps.Y_Pos'First,
                Maps.Width(self.map_width), Maps.Height(self.map_height));
        success : Boolean;
    begin
        bsp.split_recursive(
            recursion_level => 8,
            min_w => Max_Room_Size, min_h => Max_Room_Size,
            min_wh_ratio => 1.5, min_hw_ratio => 1.5);

        success := bsp.traverse_inverted_level_order(visit'Access);
        Assert(success);
    end generate_level;

    function get_actor_at_pos(self : Engine; x : Maps.X_Pos; y : Maps.Y_Pos) return Actors.Actor_Id is
        id : Actors.Actor_Id := Actors.Actor_Id'First;
    begin
        for actor of self.actor_list loop
            if actor.x = x and then actor.y = y then
                return id;
            end if;
            id := id + 1;
        end loop;
        return Actors.Invalid_Actor_Id;
    end get_actor_at_pos;

    procedure add_monster(self : in out Engine; x : Maps.X_Pos; y : Maps.Y_Pos) is
    begin
        if Rand(0, 9) < 8 then
            -- Create an orc
            self.actor_list.Append(Actors.create(x, y, 'o', Actors.create_name("Orc"), Libtcod.Color.desaturated_green));
        else
            -- Create a troll
            self.actor_list.Append(Actors.create(x, y, 'T', Actors.create_name("Troll"), Libtcod.Color.darker_green));
        end if;
    end add_monster;

end Engines;