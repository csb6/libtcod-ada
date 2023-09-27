with Engines, Libtcod.Console; use Libtcod;

procedure Tutorial is
   screen_width : constant := 80;
   screen_height : constant := 50;

   context : Console.Context := Console.make_context(screen_width, screen_height, "Libtcod Ada Tutorial");
   engine : Engines.Engine := Engines.make_engine(map_width => screen_width, map_height => screen_height,
                                                  screen_width => screen_width, screen_height => screen_height);
begin
   while not Console.is_window_closed and engine.status not in Engines.Endgame_Status loop
      engine.update;
      engine.render;
      context.present(engine.main_screen);
   end loop;

end Tutorial;
