package Components.Destructibles is

   -- Base components

   type Destructible is abstract tagged record
      max_hp, hp : Health;
      defense_stat : Defense;
   end record;
   function is_dead(self : Destructible) return Boolean with Inline;
   function take_damage(self : in out Destructible'Class; owner : in out Actors.Actor;
                        damage : Health; engine : in out Engines.Engine) return Health;
   procedure die(self : in out Destructible; owner : in out Actors.Actor;
                 engine : in out Engines.Engine);


   type Monster_Destructible is new Destructible with null record;
   overriding procedure die(self : in out Monster_Destructible; owner : in out Actors.Actor;
                            engine : in out Engines.Engine);


   type Player_Destructible is new Destructible with null record;
   overriding procedure die(self : in out Player_Destructible; owner : in out Actors.Actor;
                            engine : in out Engines.Engine);

end Components.Destructibles;
