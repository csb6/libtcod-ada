package body Libtcod.Color is
   use Interfaces.C;

   ---------------------
   -- make_RGB_color --
   ---------------------

   function make_RGB_color(r, g, b : RGB_Component) return RGB_Color is
   begin
      return result : RGB_Color :=
        RGB_Color(color_h.TCOD_color_RGB(unsigned_char(r), unsigned_char(g),
                  unsigned_char(b)));
   end make_RGB_color;

   --------------------
   -- make_HSV_color --
   --------------------

   function make_HSV_color(h : Hue; s : Saturation; v : Value) return RGB_Color is
   begin
      return result : RGB_Color :=
        RGB_Color(color_h.TCOD_color_HSV(float(h), float(s), float(v)));
   end make_HSV_color;

   -------------
   -- set_RGB --
   -------------

   procedure set_RGB(color : in out RGB_Color; r, g, b : RGB_Component) is
   begin
      color.r := unsigned_char(r);
      color.g := unsigned_char(g);
      color.b := unsigned_char(b);
   end set_RGB;

   -------------
   -- set_RGBA --
   -------------

   procedure set_RGBA(color : in out RGBA_Color; r, g, b : RGB_Component;
                      a : Alpha) is
   begin
      color.r := unsigned_char(r);
      color.g := unsigned_char(g);
      color.b := unsigned_char(b);
      color.a := unsigned_char(a);
   end set_RGBA;

   -------------
   -- set_red --
   -------------

   procedure set_red(color : in out RGB_Color; r : RGB_Component) is
   begin
      color.r := unsigned_char(r);
   end set_red;

   procedure set_red(color : in out RGBA_Color; r : RGB_Component) is
   begin
      color.r := unsigned_char(r);
   end set_red;

   -------------
   -- get_red --
   -------------

   function get_red(color : RGB_Color) return RGB_Component is
     (RGB_Component(color.r));

   function get_red(color : RGBA_Color) return RGB_Component is
     (RGB_Component(color.r));

   ---------------
   -- set_green --
   ---------------

   procedure set_green(color : in out RGB_Color; g : RGB_Component) is
   begin
      color.g := unsigned_char(g);
   end set_green;

   procedure set_green(color : in out RGBA_Color; g : RGB_Component) is
   begin
      color.g := unsigned_char(g);
   end set_green;

   ---------------
   -- get_green --
   ---------------

   function get_green(color : RGB_Color) return RGB_Component is
     (RGB_Component(color.g));

   function get_green(color : RGBA_Color) return RGB_Component is
     (RGB_Component(color.g));

   --------------
   -- set_blue --
   --------------

   procedure set_blue(color : in out RGB_Color; b : RGB_Component) is
   begin
      color.b := unsigned_char(b);
   end set_blue;

   procedure set_blue(color : in out RGBA_Color; b : RGB_Component) is
   begin
      color.b := unsigned_char(b);
   end set_blue;

   --------------
   -- get_blue --
   --------------

   function get_blue(color : RGB_Color) return RGB_Component is
     (RGB_Component(color.b));

   function get_blue(color : RGBA_Color) return RGB_Component is
     (RGB_Component(color.b));

   --------------
   -- set_alpha --
   --------------

   procedure set_alpha(color : in out RGBA_Color; a : Alpha) is
   begin
      color.a := unsigned_char(a);
   end set_alpha;

   --------------
   -- get_alpha --
   --------------

   function get_alpha(color : RGBA_Color) return Alpha is (Alpha(color.a));

   -------------
   -- set_HSV --
   -------------

   procedure set_HSV(color : aliased in out RGB_Color;
                     h : Hue; s : Saturation; v : Value) is
   begin
      TCOD_color_set_HSV(color'Access, float(h), float(s), float(v));
   end set_HSV;

   -------------
   -- get_HSV --
   -------------

   procedure get_HSV(color : RGB_Color;
                     h : out Hue; s : out Saturation; v : out Value) is
      -- This looks like a lot of copying, but checking on Compiler Explorer,
      -- this actually compiles down to same assembly (plus range checks) in -O3
      -- as passing/setting args with plain Floats and pointers
      temp_h, temp_s, temp_v : aliased Float;
   begin
      TCOD_color_get_HSV(color, temp_h'Access,
                         temp_s'Access, temp_v'Access);
      h := Hue(temp_h);
      s := Saturation(temp_s);
      v := Value(temp_v);
   end get_HSV;

   -------------
   -- set_hue --
   -------------

   procedure set_hue(color : aliased in out RGB_Color; h : Hue) is
   begin
      TCOD_color_set_hue(color'Access, float(h));
   end set_hue;

   -------------
   -- get_hue --
   -------------

   function get_hue(color : RGB_Color) return Hue is
     (Hue(TCOD_color_get_hue(color)));

   --------------------
   -- set_saturation --
   --------------------

   procedure set_saturation(color : aliased in out RGB_Color; s : Saturation) is
   begin
      TCOD_color_set_saturation(color'Access, float(s));
   end set_saturation;

   --------------------
   -- get_saturation --
   --------------------

   function get_saturation(color : RGB_Color) return Saturation is
     (Saturation(TCOD_color_get_saturation(color)));

   ---------------
   -- set_value --
   ---------------

   procedure set_value(color : aliased in out RGB_Color; v : Value) is
   begin
      TCOD_color_set_value(color'Access, float(v));
   end set_value;

   ---------------
   -- get_value --
   ---------------

   function get_value(color : RGB_Color) return Value is
     (Value(TCOD_color_get_value(color)));

   ---------
   -- "=" --
   ---------

   function "="(a, b : RGB_Color) return Boolean is
     (Boolean(TCOD_color_equals(a, b)));

   ---------
   -- "-" --
   ---------

   function "-"(a, b : RGB_Color) return RGB_Color is
     (TCOD_color_subtract(a, b));

   ---------
   -- "+" --
   ---------

   function "+"(a, b : RGB_Color) return RGB_Color is
     (TCOD_color_add(a, b));

   ---------
   -- "*" --
   ---------

   function "*"(a, b : RGB_Color) return RGB_Color is
     (TCOD_color_multiply(a, b));

   ---------
   -- "*" --
   ---------

   function "*"(a : RGB_Color; scalar : Color_Factor) return RGB_Color is
     (TCOD_color_multiply_scalar(a, float(scalar)));

   -----------------
   -- interpolate --
   -----------------

   function interpolate(a, b : RGB_Color; coeff : Color_Factor) return RGB_Color is
     (TCOD_color_lerp(a, b, float(coeff)));

   ---------------
   -- shift_hue --
   ---------------

   procedure shift_hue(color : aliased in out RGB_Color; shift : Hue) is
   begin
       TCOD_color_shift_hue(color'Access, float(shift));
   end shift_hue;

   ---------------
   -- scale_HSV --
   ---------------

   procedure scale_HSV(color : aliased in out RGB_Color;
                       sat_coeff : Saturation; value_coeff : Value) is
   begin
      TCOD_color_scale_HSV(color'Access, float(sat_coeff), float(value_coeff));
   end scale_HSV;

end Libtcod.Color;
