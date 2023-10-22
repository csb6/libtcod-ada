with Ada.Assertions, Ada.Numerics.Discrete_Random, Ada.Containers; use Ada.Assertions;
with Libtcod.Maps.BSP;

package body Engines is

    use type Actors.Actor_Id, Maps.X_Pos, Maps.Y_Pos, Console_Y, Ada.Containers.Count_Type;

    Player_Id : Actors.Actor_Id renames Actors.Player_Id;

    -- Level generation constants
    Max_Room_Size : constant := 12;
    Min_Room_Size : constant := 6;
    Max_Room_Monsters : constant := 3;
    Max_Room_Items : constant := 2;

    -- Subprogram declarations

    procedure generate_level(self : in out Engine);

    -- Subprogram definitions

    package Int_Randoms is new Ada.Numerics.Discrete_Random(Result_Subtype => Natural);
    Int_Random_Gen : Int_Randoms.Generator;
    function Rand(First, Last : Natural) return Natural is (Int_Randoms.Random(Int_Random_Gen, first, last));

    function create(screen_width : Console_X; screen_height : Console_Y) return Engine is
        map_width : constant Maps.X_Pos := Maps.X_Pos(screen_width);
        map_height : constant Maps.Y_Pos := Maps.Y_Pos(screen_height - GUIs.Panel_Height);
    begin
        return self : Engine := (map_width, map_height,
                                 map => Maps.create(map_width, map_height),
                                 gui => GUIs.create(screen_width),
                                 actor_list => <>, status => <>) do
            Actors.add_player(self);
            generate_level(self);
            Maps.compute_fov(self.map, self.actor_list(Player_Id).x, self.actor_list(Player_Id).y);
        end return;
    end create;

    procedure update(self : in out Engine) is
    begin
        Actors.update(self.actor_list(Player_Id), self);
        if self.status = New_Turn then
            for actor_id in Actors.Actor_Id'Succ(Player_Id) .. Actors.Actor_Id(self.actor_list.Length - 1) loop
                Actors.update(self.actor_list(actor_id), self);
            end loop;
            if not self.game_over then
                self.status := Idle;
            end if;
        end if;
    end update;

    procedure render(self : in out Engine; main_screen : in out Libtcod.Console.Screen) is
        player : Actors.Actor renames self.actor_list(Player_Id);
    begin
        main_screen.clear;
        Maps.render(self.map, main_screen);

        -- First, render all non-blocking actors (e.g. items, corpses)
        for actor of self.actor_list loop
            if not actor.blocks and then Maps.in_fov(self.map, actor.x, actor.y) then
                Actors.render(actor, main_screen);
            end if;
        end loop;

        -- Then, render all blocking actors. This ensures they are not covered up by
        -- non-blocking actors.
        for actor of self.actor_list loop
            if actor.blocks and then Maps.in_fov(self.map, actor.x, actor.y) then
                Actors.render(actor, main_screen);
            end if;
        end loop;

        self.gui.clear;
        self.gui.render_health_bar(x => 1, y => 1, value => player.destructible.hp, max_value => player.destructible.max_hp);
        self.gui.render_log(x => GUIs.Log_X, y => 1);
        self.gui.blit_panel(main_screen);
        if self.status = Inventory_Menu then
            self.gui.render_inventory(player.inventory.all, self);
            self.gui.blit_inventory(main_screen);
        end if;
    end render;

    procedure generate_level(self : in out Engine) is
        player : Actors.Actor renames self.actor_list(Player_Id);
        room_num : Natural := 0;
        last_x : Maps.X_Pos;
        last_y : Maps.Y_Pos;

        function visit(node : in out Libtcod.Maps.BSP.BSP_Node) return Boolean is
            start_x, end_x, center_x, place_x, w : Maps.X_Pos;
            start_y, end_y, center_y, place_y, h : Maps.Y_Pos;
            monster_count, item_count : Natural;
        begin
            if node.is_leaf then
                w := Maps.X_Pos(Rand(First => Min_Room_Size, Last => Natural(node.w) - 2));
                h := Maps.Y_Pos(Rand(First => Min_Room_Size, Last => Natural(node.h) - 2));
                start_x := Maps.X_Pos(Rand(First => Natural(node.x) + 1, Last => Natural(node.x + Maps.X_Pos'(node.w - w)) - 1));
                start_y := Maps.Y_Pos(Rand(First => Natural(node.y) + 1, Last => Natural(node.y + Maps.Y_Pos'(node.h - h)) - 1));
                center_x := start_x + (w / 2);
                center_y := start_y + (h / 2);
                end_x := start_x + w - 1;
                end_y := start_y + h - 1;

                Maps.dig(self.map, start_x, start_y, end_x, end_y);
                if room_num = 0 then
                    -- Place player in room 0
                    player.x := center_x;
                    player.y := center_y;
                else
                    -- Dig corridors connecting to the previous room
                    Maps.dig(self.map, last_x, last_y, center_x, last_y);
                    Maps.dig(self.map, center_x, last_y, center_x, center_y);

                    -- Add monsters (if any)
                    monster_count := Rand(0, Max_Room_Monsters);
                    for i in 1 .. monster_count loop
                        place_x := Maps.X_Pos(Rand(Natural(start_x), Natural(end_x)));
                        place_y := Maps.Y_Pos(Rand(Natural(start_y), Natural(end_y)));
                        if get_actor_at_pos(self, place_x, place_y) = Actors.Invalid_Actor_Id then
                            if Rand(0, 9) < 8 then
                                Actors.add_orc(self, place_x, place_y);
                            else
                                Actors.add_troll(self, place_x, place_y);
                            end if;
                        end if;
                    end loop;
                end if;

                -- Add items (if any)
                item_count := Rand(0, Max_Room_Items);
                for i in 1 .. item_count loop
                    place_x := Maps.X_Pos(Rand(Natural(start_x), Natural(end_x)));
                    place_y := Maps.Y_Pos(Rand(Natural(start_y), Natural(end_y)));
                    if get_actor_at_pos(self, place_x, place_y) = Actors.Invalid_Actor_Id then
                        Actors.add_item(self, place_x, place_y);
                    end if;
                end loop;

                last_x := center_x;
                last_y := center_y;
                room_num := room_num + 1;
            end if;
            return True;
        end visit;

        bsp : Libtcod.Maps.BSP.BSP_Tree := Libtcod.Maps.BSP.make_BSP(
                Maps.X_Pos'First, Maps.Y_Pos'First,
                self.map_width, self.map_height);
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
        nonblocking_id : Actors.Actor_Id := Actors.Invalid_Actor_Id;
    begin
        for actor of self.actor_list loop
            if actor.x = x and then actor.y = y then
                if actor.blocks then
                    return id;
                else
                    nonblocking_id := id;
                end if;
            end if;
            id := id + 1;
        end loop;
        return nonblocking_id;
    end get_actor_at_pos;

    function get_pickable_at_pos(self : Engine; x : Maps.X_Pos; y : Maps.Y_Pos) return Actors.Actor_Id is
        id : Actors.Actor_Id := Actors.Actor_Id'First;
    begin
        for actor of self.actor_list loop
            if actor.x = x and then actor.y = y and then actor.pickable /= null then
                return id;
            end if;
            id := id + 1;
        end loop;
        return Actors.Invalid_Actor_Id;
    end get_pickable_at_pos;

end Engines;
