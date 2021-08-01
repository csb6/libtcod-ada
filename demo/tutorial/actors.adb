with Engines, System.Pool_Local;

package body Actors is

   -- Pool used to store/free components used for actors
   component_pool : System.Pool_Local.Unbounded_Reclaim_Pool;

   type Attacker_Ptr is access Attacker with Storage_Pool => component_pool;
   type Destructible_Ptr is access Destructible'Class with Storage_Pool => component_pool;
   type AI_Ptr is access AI'Class with Storage_Pool => component_pool;

   function make_player(x : Maps.X_Pos; y : Maps.Y_Pos; ch : Wide_Character;
                        name : String; color : RGB_Color;
                        defense_stat : Defense;
                        power, hp, max_hp : Health) return Actor is

      attacker_comp : Attacker_Ptr := new Attacker'(power => power);
      destructible_comp : Destructible_Ptr := new Player_Destructible'(max_hp => max_hp, hp => hp,
                                                                       defense_stat => defense_stat);
      ai_comp : AI_Ptr := new Player_AI;
   begin
      return result : Actor := (name => Actor_Names.To_Bounded_String(name),
                                x => x, y => y, ch => ch, color => color, blocks => True,
                                attacker     => attacker_comp,
                                destructible => destructible_comp,
                                ai           => ai_comp);
   end make_player;

   function make_monster(x : Maps.X_Pos; y : Maps.Y_Pos; ch : Wide_Character;
                         name : String; color : RGB_Color;
                         defense_stat : Defense;
                         power, hp, max_hp : Health) return Actor is

      attacker_comp : Attacker_Ptr := new Attacker'(power => power);
      destructible_comp : Destructible_Ptr := new Monster_Destructible'(max_hp => max_hp, hp => hp,
                                                                        defense_stat => defense_stat);
      ai_comp : AI_Ptr := new Monster_AI;
   begin
      return result : Actor := (name => Actor_Names.To_Bounded_String(name),
                                x => x, y => y, ch => ch, color => color, blocks => True,
                                attacker     => attacker_comp,
                                destructible => destructible_comp,
                                ai           => ai_comp);
   end make_monster;

   function get_name(self : Actor) return String is (Actor_Names.To_String(self.name));

   procedure render(self : Actor; screen : in out Console.Screen) is
   begin
      screen.put_char(Console.X_Pos(self.x), Console.Y_Pos(self.y), self.ch);
      screen.set_char_fg(Console.X_Pos(self.x), Console.Y_Pos(self.y), self.color);
   end render;

   procedure update(self : in out Actor; engine : in out Engines.Engine) is
   begin
      if self.is_ai then
         self.ai.update(self, engine);
      end if;
   end update;

end Actors;
