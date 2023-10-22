with Libtcod.Input, Libtcod.Color;
with Engines, GUIs, Maps, Actors, Components.Destructibles, Components.Pickables;

package body Components.AIs is

    use Actors.Name_Operators;
    use type Engines.Game_Status, Maps.X_Pos, Maps.Y_Pos, Maps.X_Diff, Maps.Y_Diff, Actors.Actor_Id;

    -- Types

    type Action_Kind is (Action_None, Action_Move, Action_Melee);

    -- Subprogram declarations

    procedure update_player(player : in out Actors.Actor; engine : in out Engines.Engine);
    procedure update_monster(monster : in out Actors.Actor; engine : in out Engines.Engine);
    function perform_action(actor : in out Actors.Actor; target_x : Maps.X_Pos; target_y : Maps.Y_Pos; engine : in out Engines.Engine) return Action_Kind;

    -- Subprogram definitions

    procedure update(owner : in out Actors.Actor; engine : in out Engines.Engine) is
    begin
        if owner.ai = null then
            return;
        end if;

        case owner.ai.kind is
            when Kind_Player => update_player(owner, engine);
            when Kind_Monster => update_monster(owner, engine);
        end case;
    end update;

    procedure update_player(player : in out Actors.Actor; engine : in out Engines.Engine) is
        use type Libtcod.Input.Event_Type;

        target_x : Maps.X_Pos := player.x;
        target_y : Maps.Y_Pos := player.y;

        procedure update_player_state is
            action : Action_Kind;
        begin
            engine.status := Engines.New_Turn;
            action := perform_action(player, target_x, target_y, engine);
            if action = Action_Move then
                Maps.compute_fov(engine.map, player.x, player.y);
            end if;
        end update_player_state;

        procedure pickup_item is
            target_id : Actors.Actor_Id := engine.get_pickable_at_pos(target_x, target_y);
        begin
            if target_id /= Actors.Invalid_Actor_Id then
                if Pickables.pick(engine.actor_list(target_id), picker => player) then
                    engine.gui.log("You pick up the " & engine.actor_list(target_id).name, Libtcod.Color.light_grey);
                else
                    engine.gui.log("Your inventory is full", Libtcod.Color.light_grey);
                end if;
            else
                engine.gui.log("Nothing to pick up here", Libtcod.Color.light_grey);
            end if;
            engine.status := Engines.New_Turn;
        end pickup_item;

        procedure use_inventory_item(key_char : Character) is
            index : Integer;
            item_index : Actors.Actor_Id;
        begin
            if key_char not in 'a' .. 'z' then
                return;
            end if;
            index := Integer(Character'Pos(key_char)) - Integer(Character'Pos('a'));
            if index not in player.inventory.First_Index .. player.inventory.Last_Index then
                return;
            end if;
            item_index := player.inventory(index);
            if not Pickables.consume(engine.actor_list(item_index), target => player) then
                engine.gui.log("You cannot use that now", Libtcod.Color.yellow);
            end if;
        end use_inventory_item;

        key : aliased Libtcod.Input.Key;
        key_char : Character;
        event_kind : Libtcod.Input.Event_Type;
    begin
        if Destructibles.is_dead(player.destructible.all) then
            return;
        end if;

        event_kind := Libtcod.Input.check_for_event(Libtcod.Input.Event_Key_Press, key);
        if event_kind /= Libtcod.Input.Event_Key_Press then
            return;
        end if;

        case Libtcod.Input.get_key_type(key) is
            when Libtcod.Input.Key_Up =>
                target_y := target_y - Maps.Y_Pos(1);
                update_player_state;
            when Libtcod.Input.Key_Down =>
                target_y := target_y + Maps.Y_Pos(1);
                update_player_state;
            when Libtcod.Input.Key_Left =>
                target_x := target_x - Maps.X_Pos(1);
                update_player_state;
            when Libtcod.Input.Key_Right =>
                target_x := target_x + Maps.X_Pos(1);
                update_player_state;
            when Libtcod.Input.Key_Escape =>
                if engine.status = Engines.Inventory_Menu then
                    engine.status := Engines.Idle;
                end if;
            when Libtcod.Input.Key_Char =>
                key_char := Libtcod.Input.get_char(key);
                if key_char = 'q' and then (Libtcod.Input.meta(key) or else Libtcod.Input.ctrl(key)) then
                    engine.status := Engines.Defeat;
                elsif engine.status = Engines.Inventory_Menu then
                    use_inventory_item(key_char);
                else
                    case key_char is
                        when 'g' => pickup_item;
                        when 'i' => engine.status := Engines.Inventory_Menu;
                        when others => null;
                    end case;
                end if;
            when others => null;
        end case;
    end update_player;

    procedure update_monster(monster : in out Actors.Actor; engine : in out Engines.Engine) is
        player : Actors.Actor renames engine.actor_list(Actors.Player_Id);
        Turns_To_Track : constant := 3;
        dx : Maps.X_Diff;
        dy : Maps.Y_Diff;
        action : Action_Kind;
        pragma Unreferenced (action);
    begin
        if Destructibles.is_dead(monster.destructible.all) then
            return;
        end if;

        if Maps.in_fov(engine.map, monster.x, monster.y) then
            monster.ai.move_count := Turns_To_Track;
        end if;

        if monster.ai.move_count > 0 then
            monster.ai.move_count := monster.ai.move_count - 1;
            dx := (if player.x < monster.x then -1 elsif player.x = monster.x then 0 else 1);
            dy := (if player.y < monster.y then -1 elsif player.y = monster.y then 0 else 1);
            if not Maps.is_wall(engine.map, monster.x + dx, monster.y + dy) then
                action := perform_action(monster, target_x => monster.x + dx, target_y => monster.y + dy, engine => engine);
            elsif dx /= 0 and then not Maps.is_wall(engine.map, monster.x + dx, monster.y) then
                action := perform_action(monster, target_x => monster.x + dx, target_y => monster.y, engine => engine);
            elsif dy /= 0 and then not Maps.is_wall(engine.map, monster.x, monster.y + dy) then
                action := perform_action(monster, target_x => monster.x, target_y => monster.y + dy, engine => engine);
            end if;
        end if;
    end update_monster;

    -- TODO: find out why monsters sometimes stuck in bottom right corner of rooms
    function perform_action(actor : in out Actors.Actor; target_x : Maps.X_Pos; target_y : Maps.Y_Pos; engine : in out Engines.Engine) return Action_Kind is
        target_id : Actors.Actor_Id;
    begin
        if Maps.is_wall(engine.map, target_x, target_y) then
            return Action_None;
        end if;

        target_id := engine.get_actor_at_pos(target_x, target_y);
        if target_id = Actors.Invalid_Actor_Id then
            -- Move to empty tile
            actor.x := target_x;
            actor.y := target_y;
            return Action_Move;
        elsif not engine.actor_list(target_id).blocks then
            -- Move to tile containing non-blocking actor(s)
            actor.x := target_x;
            actor.y := target_y;
            if actor.id = Actors.Player_Id then
                engine.gui.log("There is a " & engine.actor_list(target_id).name & " here.", Libtcod.Color.light_grey);
            end if;
            return Action_Move;
        elsif engine.actor_list(target_id).ai.kind /= actor.ai.kind then
            -- Melee the target if it is not like us
            Actors.attack(actor, engine.actor_list(target_id), engine);
            return Action_Melee;
        end if;
        return Action_None;
    end perform_action;

end Components.AIs;