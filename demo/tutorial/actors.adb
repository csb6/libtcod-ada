package body Actors is

   function make_actor(x : Maps.X_Pos; y : Maps.Y_Pos; ch : Wide_Character;
                       color : RGB_Color) return Actor is
   begin
      return result : Actor := (pos => (x, y), ch => ch, color => color);
   end make_actor;
   
   procedure render(self : Actor; screen : in out Console.Screen) is
   begin
      screen.put_char(Console.X_Pos(self.x), Console.Y_Pos(self.y), self.ch);
      screen.set_char_fg(Console.X_Pos(self.x), Console.Y_Pos(self.y), self.color);
   end render;
   
end Actors;
