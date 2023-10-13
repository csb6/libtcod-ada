with Ada.Containers;

package body GUIs is

    use type Console_Y;

    package Unbounded renames Ada.Strings.Unbounded;

    function scale(input, max_input, max_output : Natural) return Natural is (Natural(max_output * input / max_input));

    function create(main_screen_width : Console_X) return GUI is
    begin
        return self : GUI := (screen => Libtcod.Console.make_screen(main_screen_width, Panel_Height), msg_log => <>);
    end create;

    procedure clear(self : in out GUI) is
    begin
        self.screen.set_default_bg(Libtcod.Color.black);
        self.screen.clear;
    end clear;

    procedure blit(self : GUI; main_screen : in out Libtcod.Console.Screen) is
    begin
        Libtcod.Console.blit(self.screen, src_x => 0, src_y => 0, width => self.screen.get_width, height => self.screen.get_height,
                             dest => main_screen, dest_x => 0, dest_y => Console_Y(main_screen.get_height - self.screen.get_height));
    end blit;

    procedure render_health_bar(self : in out GUI; x : Console_X; y : Console_Y; value, max_value : Components.Health) is
        remaining_width : Natural;
        formatted_label : String := "HP:" & value'Image & " /" & max_value'Image;
    begin
        self.screen.set_default_bg(Libtcod.Color.darker_red);
        self.screen.rect(x, y, Bar_Width, height => 1);

        self.screen.set_default_bg(Libtcod.Color.light_red);
        remaining_width := scale(input => Natural(value), max_input => Natural(max_value), max_output => Bar_Width);
        self.screen.rect(x, y, Console_X(remaining_width), height => 1);

        self.screen.set_default_fg(Libtcod.Color.white);
        self.screen.print(x, y, formatted_label);
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
        max_line_len : constant Integer := Integer(self.screen.get_width) - Integer(x);
    begin
        for msg of self.msg_log loop
            self.screen.set_default_fg(msg.color * fade_coeff);
            declare
                line : String := Unbounded.To_String(msg.text);
            begin
                if Unbounded.Length(msg.text) > max_line_len then
                    self.screen.print(x, log_y, line(line'First..max_line_len));
                else
                    self.screen.print(x, log_y, line);
                end if;
            end;
            log_y := log_y + 1;
            if fade_coeff < 1.0 then
                fade_coeff := fade_coeff + 0.3;
            end if;
        end loop;
    end render_log;

end GUIs;