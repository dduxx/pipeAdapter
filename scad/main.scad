/* [Top] */
// tells the generator to assign the diameter value as the inner or outer diameter
TOP_IS_INNER_DIAMETER = true;
// pipe adapter top section diameter
TOP_DIAMETER_MM = 100;
// pipe adapter top section height
TOP_HEIGHT_MM = 45;

/* [Bottom] */
// tells the generator to assign the diameter value as the inner or outer diameter
BOT_IS_INNER_DIAMETER = true;
// pipe adapter bottom section diameter
BOT_DIAMETER_MM = 120;
// pipe adapter bottom section height
BOT_HEIGHT_MM = 45;

/* [Transition] */
// height of the transition between the bottom and the top
TRANSITION_HEIGHT_MM = 20;

/* [Wall] */
// thickness of the side wall
WALL_MM = 3;

module __Customizer_Limit__ () {}

$fn = 200;

pipe_section(
    BOT_DIAMETER_MM,
    BOT_IS_INNER_DIAMETER,
    BOT_DIAMETER_MM,
    BOT_IS_INNER_DIAMETER,
    BOT_HEIGHT_MM,
    WALL_MM
);
translate([0, 0, BOT_HEIGHT_MM]) {
    pipe_section(
        TOP_DIAMETER_MM,
        TOP_IS_INNER_DIAMETER,
        BOT_DIAMETER_MM,
        BOT_IS_INNER_DIAMETER,
        TRANSITION_HEIGHT_MM,
        WALL_MM
    );
}
translate([0, 0, BOT_HEIGHT_MM + TRANSITION_HEIGHT_MM]) {
    pipe_section(
        TOP_DIAMETER_MM,
        TOP_IS_INNER_DIAMETER,
        TOP_DIAMETER_MM,
        TOP_IS_INNER_DIAMETER,
        TOP_HEIGHT_MM,
        WALL_MM
    );
}

module pipe_section(top_diam, top_is_inner, bot_diam, bot_is_inner, height, wall) {
    top_outside_rad = get_outer_rad(top_diam, top_is_inner, wall);
    top_inside_rad = get_inner_rad(top_diam, top_is_inner, wall);

    bot_outside_rad = get_outer_rad(bot_diam, bot_is_inner, wall);
    bot_inside_rad = get_inner_rad(bot_diam, bot_is_inner, wall);

    difference() {
        cylinder(h = height, r1 = bot_outside_rad, r2 = top_outside_rad);
        cylinder(h = height, r1 = bot_inside_rad, r2 = top_inside_rad);
    }
}

function get_inner_rad(diam, is_inner, wall) = is_inner ? diam / 2 : (diam / 2) - wall;
function get_outer_rad(diam, is_inner, wall) = is_inner ? (diam / 2) + wall : diam / 2;
