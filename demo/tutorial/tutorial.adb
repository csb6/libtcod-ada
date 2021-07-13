with Engines, Libtcod.Console; use Libtcod;

procedure Tutorial is
   map_width : constant := 80;
   map_height : constant := 50;
   
   root : Console.Root := Console.init_root(map_width, map_height, "Libtcod Ada Tutorial");
   screen : Console.Screen := Console.make_screen(map_width, map_height);
   engine : Engines.Engine := Engines.make_engine(map_width, map_height);
begin
   while not Console.is_window_closed loop
      engine.update;
      engine.render(screen);
      screen.blit;
      Console.flush;
   end loop;
   
end Tutorial;
