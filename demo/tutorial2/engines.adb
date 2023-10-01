with Ada.Assertions, Ada.Numerics.Discrete_Random; use Ada.Assertions;
with Libtcod.Input, Libtcod.Color, Libtcod.Maps.BSP;

package body Engines is

    Max_Room_Size : constant := 12;
    Min_Room_Size : constant := 6;
    FOV_Radius : constant := 10;

    Player_Id : constant Actors.Actor_Id := Actors.Player_Id;

    package Int_Randoms is new Ada.Numerics.Discrete_Random(Result_Subtype => Natural);
    Int_Random_Gen : Int_Randoms.Generator;

    -- Subprogram declarations

    procedure generate_terrain(self : in out Engine);

    -- Subprogram definitions

    function Rand(First, Last : Natural) return Natural is (Int_Randoms.Random(Int_Random_Gen, first, last));

    function create(w : Maps.Width; h : Maps.Height) return Engine is
    begin
        return self : Engine := (map_width => Maps.X_Pos(w), map_height => Maps.Y_Pos(h),
                                 map => Maps.create(w, h),
                                 actor_list => <>, running => <>) do
            self.actor_list.Append(Actors.create(0, 0, '@', Libtcod.Color.white));
            generate_terrain(self);
            Maps.compute_fov(self.map, self.actor_list(Player_Id).x, self.actor_list(Player_Id).y, FOV_Radius);
        end return;
    end create;

    procedure update(self : in out Engine) is
        use type Libtcod.Input.Event_Type, Maps.X_Pos, Maps.Y_Pos;

        key : aliased Libtcod.Input.Key;
        event_kind : Libtcod.Input.Event_Type := Libtcod.Input.check_for_event(Libtcod.Input.Event_Key_Press, key);
        player : Actors.Actor renames self.actor_list(Player_Id);
        player_x : Maps.X_Pos := player.x;
        player_y : Maps.Y_Pos := player.y;

        procedure update_player_pos is
        begin
            if Maps.is_walkable(self.map, player_x, player_y) then
                player.x := player_x;
                player.y := player_y;
                Maps.compute_fov(self.map, player.x, player.y, FOV_Radius);
            end if;
        end update_player_pos;
    begin
        if event_kind /= Libtcod.Input.Event_Key_Press then
            return;
        end if;

        case Libtcod.Input.get_key_type(key) is
            when Libtcod.Input.Key_Up =>
                player_y := player_y - Maps.Y_Pos(1);
                update_player_pos;
            when Libtcod.Input.Key_Down =>
                player_y := player_y + Maps.Y_Pos(1);
                update_player_pos;
            when Libtcod.Input.Key_Left =>
                player_x := player_x - Maps.X_Pos(1);
                update_player_pos;
            when Libtcod.Input.Key_Right =>
                player_x := player_x + Maps.X_Pos(1);
                update_player_pos;
            when Libtcod.Input.Key_Char =>
                if (Libtcod.Input.meta(key) or else Libtcod.Input.ctrl(key)) and then Libtcod.Input.get_char(key) = 'q' then
                    self.running := False;
                end if;
            when others =>
                -- Ignore all other keypresses
                null;
        end case;
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

    procedure generate_terrain(self : in out Engine) is
        player : Actors.Actor renames self.actor_list(Player_Id);
        room_num : Natural := 0;
        last_x : Maps.X_Pos;
        last_y : Maps.Y_Pos;

        function visit(node : in out Libtcod.Maps.BSP.BSP_Node) return Boolean is
            use type Maps.Width, Maps.Height, Maps.X_Pos, Maps.Y_Pos;
            function "+"(x : Maps.X_Pos; w : Maps.Width) return Integer is (Integer(x) + Integer(w));
            function "+"(y : Maps.Y_Pos; h : Maps.Height) return Integer is (Integer(y) + Integer(h));

            w : Maps.Width;
            h : Maps.Height;
            x, center_x : Maps.X_Pos;
            y, center_y : Maps.Y_Pos;
        begin
            if node.is_leaf then
                w := Maps.Width(Rand(First => Min_Room_Size, Last => Natural(node.w) - 2));
                h := Maps.Height(Rand(First => Min_Room_Size, Last => Natural(node.h) - 2));
                x := Maps.X_Pos(Rand(First => Natural(node.x) + 1, Last => node.x + (node.w - w) - 1));
                y := Maps.Y_Pos(Rand(First => Natural(node.y) + 1, Last => node.y + (node.h - h) - 1));
                center_x := x + Maps.X_Pos(w / 2);
                center_y := y + Maps.Y_Pos(h / 2);

                Maps.dig(self.map, x, y, x + Maps.X_Pos(w - 1), y + Maps.Y_Pos(h - 1));
                if room_num = 0 then
                    -- Place player in room 0
                    player.x := center_x;
                    player.y := center_y;
                else
                    -- Dig a corridor connecting to the previous room
                    Maps.dig(self.map, last_x, last_y, center_x, last_y);
                    Maps.dig(self.map, center_x, last_y, center_x, center_y);

                    -- 25% chance of spawning a monster in the room
                    if Rand(0, 3) = 0 then
                        self.actor_list.Append(Actors.create(center_x, center_y, '@', Libtcod.Color.yellow));
                    end if;
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
    end generate_terrain;

end Engines;