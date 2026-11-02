# pipeAdapter

A parametric pipe adapter generator for OpenSCAD. Generates a reducer-style adapter with a bottom section, a tapered transition, and a top section, all with configurable diameters, heights, and wall thickness.

## Parameters

All parameters are customizable via the OpenSCAD customizer (`scad/main.scad`):

| Parameter | Default | Description |
| --- | --- | --- |
| `TOP_IS_INNER_DIAMETER` | `true` | Whether top diameter is inner (`true`) or outer (`false`) |
| `TOP_DIAMETER_MM` | `100` | Top section diameter |
| `TOP_HEIGHT_MM` | `45` | Top section height |
| `BOT_IS_INNER_DIAMETER` | `true` | Whether bottom diameter is inner or outer |
| `BOT_DIAMETER_MM` | `120` | Bottom section diameter |
| `BOT_HEIGHT_MM` | `45` | Bottom section height |
| `TRANSITION_HEIGHT_MM` | `20` | Height of the tapered transition |
| `WALL_MM` | `3` | Wall thickness |
