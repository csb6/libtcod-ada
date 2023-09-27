with Libtcod.Console;
with Engines;

procedure Tutorial is
    screen_width : constant := 80;
    screen_height : constant := 50;

    context : Libtcod.Console.Context := Libtcod.Console.make_context(screen_width, screen_height, "Libtcod Ada Tutorial");
    screen : Libtcod.Console.Screen := Libtcod.Console.make_screen(screen_width, screen_height);
    engine : Engines.Engine := Engines.create(screen_width, screen_height);
begin
    while engine.is_running loop
        engine.update;
        engine.render(screen);
        context.present(screen);
    end loop;
end Tutorial;