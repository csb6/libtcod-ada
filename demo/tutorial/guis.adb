with Libtcod.Color, Engines;

package body GUIs is

   subtype RGB_Color is Color.RGB_Color;

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
      return self : GUI := (screen => Console.make_screen(screen_w, Panel_Height));
   end make_GUI;

   procedure render(self : in out GUI; main_screen : in out Console.Screen;
                    engine : in out Engines.Engine) is
   begin
      self.screen.set_default_bg(Color.black);
      self.screen.clear;

      self.render_bar(1, 1, Bar_Width, "HP", Float(engine.player.destructible.hp),
                      Float(engine.player.destructible.max_hp),
                      bar_color => Color.light_red, bg_color => Color.dark_red);
      self.screen.blit(0, 0, main_screen.get_width, Panel_Height, main_screen,
                       0, Console.Y_Pos(main_screen.get_height-Panel_Height));
   end render;

end GUIs;
