with Engines;

package body Actors is

    use Components;
    use type Ada.Containers.Count_Type;

    subtype Console_X is Libtcod.Console.X_Pos;
    subtype Console_Y is Libtcod.Console.Y_Pos;

    -- Player constants
    Max_Player_Inventory_Size : constant := 26;

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
    Player_Inventory : aliased Inventories.Inventory(Capacity => Max_Player_Inventory_Size);

    -- Common monster components
    Orc_Attacker : aliased Attackers.Attacker := (damage => 3);
    Troll_Attacker : aliased Attackers.Attacker := (damage => 4);

    -- Common item components
    Health_Potion_Pickable : aliased Pickables.Pickable := (kind => Pickables.Kind_Health, hp => 4);

    function create(id : Actor_Id; x : Maps.X_Pos; y : Maps.Y_Pos; ch : Wide_Character;
                    name : Actor_Name; color : Libtcod.Color.RGB_Color) return Actor is
    begin
        return self : Actor := (id, x, y, ch, color, name, blocks => True, attacker => <>,
            destructible => <>, ai => <>, pickable => <>, inventory => <>);
    end create;

    procedure update(self : in out Actor; engine : in out Engines.Engine) is
    begin
        AIs.update(self, engine);
    end update;

    procedure attack(self : in out Actor; target : in out Actor; engine : in out Engines.Engine) is
    begin
        Attackers.attack(self, target, engine);
    end attack;

    procedure render(self : Actor; screen : in out Libtcod.Console.Screen) is
    begin
        screen.put_char(Console_X(self.x), Console_Y(self.y), self.ch);
        screen.set_char_fg(Console_X(self.x), Console_Y(self.y), self.color);
    end render;

    procedure add_player(self : in out Engines.Engine) is
    begin
        self.actor_list.Append(Actors.create(Player_Id, 0, 0, '@', Actors.create_name("Player"), Libtcod.Color.white));
        self.actor_list(Player_Id).ai := Player_AI'Access;
        self.actor_list(Player_Id).destructible := Player_Destructible;
        self.actor_list(Player_Id).attacker := Player_Attacker'Access;
        self.actor_list(Player_Id).inventory := Player_Inventory'Access;
    end add_player;

    procedure add_orc(self : in out Engines.Engine; x : Maps.X_Pos; y : Maps.Y_Pos) is
        ai : AI_Ptr;
        monster : Actors.Actor;
        id : Actors.Actor_Id := Actors.Actor_Id(self.actor_list.Length + 1);
    begin
        monster := Actors.create(id, x, y, 'o', Actors.create_name("Orc"), Libtcod.Color.desaturated_green);
        monster.attacker := Orc_Attacker'Access;
        monster.destructible := new_destructible(
            kind => Destructibles.Kind_Monster,
            max_hp => 10, defense => 0);
        ai := new AIs.AI'(AIs.Kind_Monster, move_count => <>);
        monster.ai := ai;
        self.actor_list.Append(monster);
    end add_orc;

    procedure add_troll(self : in out Engines.Engine; x : Maps.X_Pos; y : Maps.Y_Pos) is
        ai : AI_Ptr;
        monster : Actors.Actor;
        id : Actors.Actor_Id := Actors.Actor_Id(self.actor_list.Length + 1);
    begin
        monster := Actors.create(id, x, y, 'T', Actors.create_name("Troll"), Libtcod.Color.darker_green);
        monster.attacker := Troll_Attacker'Access;
        monster.destructible := new_destructible(
            kind => Destructibles.Kind_Monster,
            max_hp => 16, defense => 1);
        ai := new AIs.AI'(AIs.Kind_Monster, move_count => <>);
        monster.ai := ai;
        self.actor_list.Append(monster);
    end add_troll;

    procedure add_item(self : in out Engines.Engine; x : Maps.X_Pos; y : Maps.Y_Pos) is
        potion : Actors.Actor;
        id : Actors.Actor_Id := Actors.Actor_Id(self.actor_list.Length + 1);
    begin
        potion := Actors.create(id, x, y, '!', Actors.create_name("Health potion"), Libtcod.Color.violet);
        potion.blocks := False;
        potion.pickable := Health_Potion_Pickable'Access;
        self.actor_list.Append(potion);
    end add_item;

end Actors;