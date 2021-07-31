with Engines;

package body Actors is

   function make_player(x : Maps.X_Pos; y : Maps.Y_Pos; ch : Wide_Character;
                        name : String; color : RGB_Color;
                        defense_stat : Defense;
                        power, hp, max_hp : Health) return Actor is
      use Attacker_Holders, Destructible_Holders, AI_Holders;

      attacker_comp : Attackers.Attacker := (power => power);
      destructible_comp : Player_Destructible := (max_hp => max_hp, hp => hp,
                                                  defense_stat => defense_stat);
      ai_comp : Player_AI;
   begin
      return result : Actor := (name => Actor_Names.To_Bounded_String(name),
                                pos => (x, y), ch => ch, color => color, blocks => True,
                                attacker_h     => To_Holder(attacker_comp),
                                destructible_h => To_Holder(destructible_comp),
                                ai_h           => To_Holder(ai_comp));
   end make_player;

   function make_monster(x : Maps.X_Pos; y : Maps.Y_Pos; ch : Wide_Character;
                         name : String; color : RGB_Color;
                         defense_stat : Defense;
                         power, hp, max_hp : Health) return Actor is
      use Attacker_Holders, Destructible_Holders, AI_Holders;

      attacker_comp : Attackers.Attacker := (power => power);
      destructible_comp : Monster_Destructible := (max_hp => max_hp, hp => hp,
                                                   defense_stat => defense_stat);
      ai_comp : Monster_AI;
   begin
      return result : Actor := (name => Actor_Names.To_Bounded_String(name),
                                pos => (x, y), ch => ch, color => color, blocks => True,
                                attacker_h     => To_Holder(attacker_comp),
                                destructible_h => To_Holder(destructible_comp),
                                ai_h           => To_Holder(ai_comp));
   end make_monster;

   function get_name(self : Actor) return String is (Actor_Names.To_String(self.name));

   procedure render(self : Actor; screen : in out Console.Screen) is
   begin
      screen.put_char(Console.X_Pos(self.pos.x), Console.Y_Pos(self.pos.y), self.ch);
      screen.set_char_fg(Console.X_Pos(self.pos.x), Console.Y_Pos(self.pos.y), self.color);
   end render;

   procedure update(self : in out Actor; engine : in out Engines.Engine) is
   begin
      if self.is_ai then
         self.ai.update(self, engine);
      end if;
   end update;

end Actors;
