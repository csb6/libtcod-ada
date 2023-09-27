with Engines, Ada.Strings.Fixed;

package body GUIs is
   use Ada.Strings;
   use type Console.Y_Pos;

   Log_X : constant := Bar_Width + 2;
   Message_Height : constant := Panel_Height - 1;

   procedure render_bar(self : in out GUI; x : Console.X_Pos; y : Console.Y_Pos;
                        w : Width; name : String; value, max_value : Float;
                        bar_color, bg_color : RGB_Color) is
      bar_w : Width := Width(Float'Rounding(value / max_value * Float(w)));
   begin
      self.screen.set_default_bg(bg_color);
      self.screen.rect(x, y, w, h => 1);
      if bar_w > 0 then
         self.screen.set_default_bg(bar_color);
         self.screen.rect(x, y, bar_w, h => 1);
      end if;
      self.screen.set_default_fg(Color.white);
      self.screen.print(x, y, name & " :"
                        & Integer(value)'Image & " /" & Integer(max_value)'Image);
   end render_bar;


   function make_GUI(screen_w : Width) return GUI is
   begin
      return self : GUI := (screen => Console.make_screen(screen_w, Panel_Height),
                            log => <>);
   end make_GUI;

   procedure render(self : in out GUI; engine : in out Engines.Engine) is
      y : Console.Y_Pos := 1;
   begin
      self.screen.set_default_bg(Color.black);
      self.screen.clear;

      self.render_bar(1, 1, Bar_Width, "HP", Float(engine.player.destructible.hp),
                      Float(engine.player.destructible.max_hp),
                      bar_color => Color.light_red, bg_color => Color.dark_red);

      for message of self.log loop
         self.screen.set_default_fg(message.color);
         self.screen.print(Log_X, y, Log_Strings.To_String(message.text));
         y := y + 1;
      end loop;

      self.screen.blit(0, 0, engine.main_screen.get_width, Panel_Height, engine.main_screen'Access,
                       0, Console.Y_Pos(engine.main_screen.get_height-Panel_Height));
   end render;

   procedure log(self : in out GUI; text : String; color : RGB_Color := Libtcod.Color.light_grey) is
      curr_pos : Positive := text'First;
      newline_pos : Natural;
   begin
      loop
         if self.log.Length = Message_Height then
            self.log.Delete_First;
         end if;
         newline_pos := Fixed.Index(text, ASCII.LF & "", curr_pos);
         if newline_pos = 0 then
            self.log.Append((Log_Strings.To_Bounded_String(text(curr_pos .. text'Last),
                            Drop => Right), color));
            exit;
         end if;

         self.log.Append((Log_Strings.To_Bounded_String(text(curr_pos .. newline_pos - 1),
                         Drop => Right), color));
         curr_pos := newline_pos + 1;
         exit when curr_pos > text'Last;
      end loop;
   end log;
end GUIs;
