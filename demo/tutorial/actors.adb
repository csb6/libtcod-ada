package body Actors is

   function make_actor(x : Maps.X_Pos; y : Maps.Y_Pos; ch : Wide_Character;
                       name : String; color : RGB_Color) return Actor is
   begin
      return result : Actor := (name => Actor_Names.To_Bounded_String(name),
                                pos => (x, y), ch => ch, color => color);
   end make_actor;

   function name(self : Actor) return String is (Actor_Names.To_String(self.name));

   procedure render(self : Actor; screen : in out Console.Screen) is
   begin
      screen.put_char(Console.X_Pos(self.pos.x), Console.Y_Pos(self.pos.y), self.ch);
      screen.set_char_fg(Console.X_Pos(self.pos.x), Console.Y_Pos(self.pos.y), self.color);
   end render;

   procedure update(self : in out Actor) is
   begin
      null;
   end update;

end Actors;
