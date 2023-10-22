with Ada.Containers;
with Engines, Actors;

package body GUIs is

    use Actors.Name_Operators;
    use type Console_Y;

    -- Types

    package Unbounded renames Ada.Strings.Unbounded;

    -- Constants

    Inventory_Width : constant := 50;
    Inventory_Height : constant := 28;

    -- Subprogram declarations

    function scale(input, max_input, max_output : Natural) return Natural is (Natural(max_output * input / max_input));

    -- Subprogram definitions

    function create(main_screen_width : Console_X) return GUI is
    begin
        return self : GUI := (
            bottom_panel => Libtcod.Console.make_screen(main_screen_width, Panel_Height),
            inventory => Libtcod.Console.make_screen(Inventory_Width, Inventory_Height),
            msg_log => <>
        );
    end create;

    procedure clear(self : in out GUI) is
    begin
        self.bottom_panel.set_default_bg(Libtcod.Color.black);
        self.bottom_panel.clear;
    end clear;

    procedure blit_panel(self : GUI; main_screen : in out Libtcod.Console.Screen) is
    begin
        Libtcod.Console.blit(self.bottom_panel, src_x => 0, src_y => 0,
                             width => self.bottom_panel.get_width, height => self.bottom_panel.get_height,
                             dest => main_screen, dest_x => 0, dest_y => Console_Y(main_screen.get_height - self.bottom_panel.get_height));
    end blit_panel;

    procedure blit_inventory(self : GUI; main_screen : in out Libtcod.Console.Screen) is
    begin
        Libtcod.Console.blit(self.inventory, src_x => 0, src_y => 0,
                             width => self.inventory.get_width, height => self.inventory.get_height,
                             dest => main_screen, dest_x => 0,
                             dest_y => Console_Y(main_screen.get_height / 2 - self.inventory.get_height / 2));
    end blit_inventory;

    procedure render_health_bar(self : in out GUI; x : Console_X; y : Console_Y; value, max_value : Components.Health) is
        remaining_width : Natural;
        formatted_label : String := "HP:" & value'Image & " /" & max_value'Image;
    begin
        self.bottom_panel.set_default_bg(Libtcod.Color.darker_red);
        self.bottom_panel.rect(x, y, Bar_Width, height => 1);

        self.bottom_panel.set_default_bg(Libtcod.Color.light_red);
        remaining_width := scale(input => Natural(value), max_input => Natural(max_value), max_output => Bar_Width);
        self.bottom_panel.rect(x, y, Console_X(remaining_width), height => 1);

        self.bottom_panel.set_default_fg(Libtcod.Color.white);
        self.bottom_panel.print(x, y, formatted_label);
    end render_health_bar;

    procedure log(self : in out GUI; text : String; color : Libtcod.Color.RGB_Color := Libtcod.Color.white) is
        use type Ada.Containers.Count_Type;
    begin
        if self.msg_log.Length = self.msg_log.Capacity then
            self.msg_log.Delete_First;
        end if;
        self.msg_log.Append(Message'(text => Unbounded.To_Unbounded_String(text), color => color));
    end log;

    procedure render_log(self : in out GUI; x : Console_X; y : Console_Y) is
        use type Libtcod.Color.RGB_Color, Libtcod.Color.Color_Factor;
        fade_coeff : Libtcod.Color.Color_Factor := 0.4;
        log_y : Console_Y := y;
        max_line_len : constant Integer := Integer(self.bottom_panel.get_width) - Integer(x);
    begin
        for msg of self.msg_log loop
            self.bottom_panel.set_default_fg(msg.color * fade_coeff);
            declare
                line : String := Unbounded.To_String(msg.text);
            begin
                if Unbounded.Length(msg.text) > max_line_len then
                    self.bottom_panel.print(x, log_y, line(line'First..max_line_len));
                else
                    self.bottom_panel.print(x, log_y, line);
                end if;
            end;
            log_y := log_y + 1;
            if fade_coeff < 1.0 then
                fade_coeff := fade_coeff + 0.3;
            end if;
        end loop;
    end render_log;

    procedure render_inventory(self : in out GUI; inventory : Components.Inventories.Inventory; engine : Engines.Engine) is
        shortcut : Character := 'a';
        y : Console_Y := 1;
    begin
        self.inventory.set_default_bg(Libtcod.Color.black);
        self.inventory.set_default_fg(Libtcod.Color.make_RGB_color(200, 180, 50));
        self.inventory.print_frame(0, 0, Inventory_Width, Inventory_Height, text => "Inventory",
                                      empty => True);

        self.inventory.set_default_fg(Libtcod.Color.white);
        for item_id of inventory loop
            self.inventory.print(2, y, text => "(" & shortcut & ") " & engine.actor_list(item_id).name);
            y := y + 1;
            shortcut := Character'Succ(shortcut);
        end loop;
    end render_inventory;

end GUIs;