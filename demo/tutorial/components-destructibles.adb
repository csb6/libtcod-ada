with Actors, Engines, Libtcod.Color; use Libtcod;

package body Components.Destructibles is

   -------------
   -- is_dead --
   -------------

   function is_dead(self : Destructible) return Boolean is (self.hp = 0);

   -----------------
   -- take_damage --
   -----------------

   function take_damage(self : in out Destructible'Class; owner : in out Actors.Actor;
                        damage : Health; engine : in out Engines.Engine) return Health is
      real_damage : Health;
   begin
      if Health(self.defense_stat) > damage then
         real_damage := 0;
      else
         real_damage := damage - Health(self.defense_stat);
         if real_damage >= self.hp then
            self.hp := 0;
            self.die(owner, engine);
         else
            self.hp := self.hp - real_damage;
         end if;
      end if;
      return real_damage;
   end take_damage;

   ----------
   -- heal --
   ----------
   function heal(self : in out Destructible; amount : Health) return Health is
      old_hp : Health := self.hp;
   begin
      self.hp := self.hp + amount;
      if self.hp > self.max_hp then
         self.hp := self.max_hp;
      end if;
      return self.hp - old_hp;
   end heal;

   ---------
   -- die --
   ---------

   procedure die(self : in out Destructible; owner : in out Actors.Actor;
                 engine : in out Engines.Engine) is
   begin
      owner.ch := '%';
      owner.color := Color.dark_red;
      owner.blocks := False;
   end die;

   overriding
   procedure die(self : in out Monster_Destructible; owner : in out Actors.Actor;
                 engine : in out Engines.Engine) is
   begin
      engine.gui.log(owner.get_name & " is dead");
      die(Destructible(self), owner, engine);
   end die;

   overriding
   procedure die(self : in out Player_Destructible; owner : in out Actors.Actor;
                 engine : in out Engines.Engine) is
   begin
      engine.gui.log("You died", Color.red);
      die(Destructible(self), owner, engine);
      engine.status := Engines.Status_Defeat;
   end die;

end Components.Destructibles;
