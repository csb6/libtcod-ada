with Engines, Libtcod.Console; use Libtcod;

procedure Tutorial is
   screen_width : constant := 80;
   screen_height : constant := 50;

   context : Console.Context := Console.make_context(screen_width, screen_height, "Libtcod Ada Tutorial");
   screen : Console.Screen := Console.make_screen(screen_width, screen_height);
   engine : Engines.Engine := Engines.make_engine(screen_width, screen_height);
begin
   while not Console.is_window_closed and engine.status not in Engines.Endgame_Status loop
      engine.update;
      engine.render(screen);
      context.present(screen);
   end loop;

end Tutorial;
