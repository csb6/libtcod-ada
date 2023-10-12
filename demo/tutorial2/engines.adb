with Ada.Assertions, Ada.Numerics.Discrete_Random, Ada.Containers; use Ada.Assertions;
with Libtcod.Color, Libtcod.Maps.BSP;
with Components.AIs, Components.Destructibles, Components.Attackers; use Components;

package body Engines is

    use type Actors.Actor_Id, Maps.X_Pos, Maps.Y_Pos, Console_Y, Ada.Containers.Count_Type;

    Player_Id : Actors.Actor_Id renames Actors.Player_Id;

    -- Level generation constants
    Max_Room_Size : constant := 12;
    Min_Room_Size : constant := 6;
    Max_Room_Monsters : constant := 3;

    -- Subprogram declarations

    procedure generate_level(self : in out Engine);
    procedure add_player(self : in out Engine);
    procedure add_monster(self : in out Engine; x : Maps.X_Pos; y : Maps.Y_Pos);

    -- Subprogram definitions

    package Int_Randoms is new Ada.Numerics.Discrete_Random(Result_Subtype => Natural);
    Int_Random_Gen : Int_Randoms.Generator;
    function Rand(First, Last : Natural) return Natural is (Int_Randoms.Random(Int_Random_Gen, first, last));

    function create(screen_width : Console_X; screen_height : Console_Y) return Engine is
        map_width : constant Maps.X_Pos := Maps.X_Pos(screen_width);
        map_height : constant Maps.Y_Pos := Maps.Y_Pos(screen_height);
    begin
        return self : Engine := (map_width, map_height,
                                 map => Maps.create(map_width, map_height),
                                 actor_list => <>, status => <>, last_living_actor_id => <>) do
            add_player(self);
            generate_level(self);
            Maps.compute_fov(self.map, self.actor_list(Player_Id).x, self.actor_list(Player_Id).y);
        end return;
    end create;

    procedure update(self : in out Engine) is
    begin
        self.status := Idle;
        Actors.update(self.actor_list(Player_Id), self);
        if self.status = New_Turn then
            for actor_id in reverse Actors.Actor_Id'Succ(Player_Id) .. Actors.Actor_Id(self.actor_list.Length - 1) loop
                Actors.update(self.actor_list(actor_id), self);
            end loop;
        end if;
    end update;

    procedure render(self : in out Engine; screen : in out Libtcod.Console.Screen) is
        player : Actors.Actor renames self.actor_list(Player_Id);
    begin
        screen.clear;
        Maps.render(self.map, screen);
        for actor of reverse self.actor_list loop
            if Maps.in_fov(self.map, actor.x, actor.y) then
                Actors.render(actor, screen);
            end if;
        end loop;
        screen.print(1, screen.get_height - 2, "HP:" & player.destructible.hp'Image & " /" & player.destructible.max_hp'Image);
    end render;

    procedure generate_level(self : in out Engine) is
        player : Actors.Actor renames self.actor_list(Player_Id);
        room_num : Natural := 0;
        last_x : Maps.X_Pos;
        last_y : Maps.Y_Pos;

        function visit(node : in out Libtcod.Maps.BSP.BSP_Node) return Boolean is
            start_x, end_x, center_x, monster_x, w : Maps.X_Pos;
            start_y, end_y, center_y, monster_y, h : Maps.Y_Pos;
            monster_count : Natural;
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
    begin
        for actor of self.actor_list loop
            if actor.x = x and then actor.y = y then
                return id;
            end if;
            id := id + 1;
        end loop;
        return Actors.Invalid_Actor_Id;
    end get_actor_at_pos;

    function is_walkable(self : Engine; x : Maps.X_Pos; y : Maps.Y_Pos) return Boolean is
        actor_id : Actors.Actor_Id;
    begin
        if Maps.is_wall(self.map, x, y) then
            return False;
        else
            actor_id := get_actor_at_pos(self, x, y);
            return actor_id = Actors.Invalid_Actor_Id
                or else not self.actor_list(actor_id).blocks;
        end if;
    end is_walkable;

    procedure move_to_back(self : in out Engine; id : Actors.Actor_Id) is
    begin
        self.actor_list.Swap(id, self.last_living_actor_id);
        self.last_living_actor_id := self.last_living_actor_id - 1;
    end move_to_back;

    type AI_Ptr is access AIs.AI;
    type Destructible_Ptr is access Destructibles.Destructible;

    function new_destructible(kind : Destructibles.Kind_Type; max_hp, defense : Health) return Destructible_Ptr is
        (new Destructibles.Destructible'(kind => kind, max_hp => max_hp, hp => max_hp, defense => defense));

    -- Player components
    Player_AI : aliased AIs.AI := (kind => AIs.Kind_Player);
    Player_Destructible : Destructible_Ptr := new_destructible(
            Destructibles.Kind_Player,
            max_hp => 30, defense => 2);
    Player_Attacker : aliased Attackers.Attacker := (damage => 5);

    -- Common monster components
    Orc_Attacker : aliased Attackers.Attacker := (damage => 3);
    Troll_Attacker : aliased Attackers.Attacker := (damage => 4);

    procedure add_player(self : in out Engine) is
    begin
        self.actor_list.Append(Actors.create(Player_Id, 0, 0, '@', Actors.create_name("Player"), Libtcod.Color.white));
        self.actor_list(Player_Id).ai := Player_AI'Access;
        self.actor_list(Player_Id).destructible := Player_Destructible;
        self.actor_list(Player_Id).attacker := Player_Attacker'Access;
    end add_player;

    procedure add_monster(self : in out Engine; x : Maps.X_Pos; y : Maps.Y_Pos) is
        destructible : Destructible_Ptr;
        ai : AI_Ptr;
        monster : Actors.Actor;
        id : Actors.Actor_Id := Actors.Actor_Id(self.actor_list.Length);
    begin
        if Rand(0, 9) < 8 then
            -- Create an orc
            monster := Actors.create(id, x, y, 'o', Actors.create_name("Orc"), Libtcod.Color.desaturated_green);
            monster.attacker := Orc_Attacker'Access;
            destructible := new_destructible(
                kind => Destructibles.Kind_Monster,
                max_hp => 10, defense => 0);
        else
            -- Create a troll
            monster := Actors.create(id, x, y, 'T', Actors.create_name("Troll"), Libtcod.Color.darker_green);
            monster.attacker := Troll_Attacker'Access;
            destructible := new_destructible(
                kind => Destructibles.Kind_Monster,
                max_hp => 16, defense => 1);
        end if;
        monster.destructible := destructible;
        ai := new AIs.AI'(AIs.Kind_Monster, move_count => <>);
        monster.ai := ai;
        self.actor_list.Append(monster);
        self.last_living_actor_id := self.last_living_actor_id + 1;
    end add_monster;

end Engines;