use <rim.scad>;
use <holder.scad>;
include <parameters.scad>;

rim();
translate([rim_outer_d / 2, -rim_connector_width / 2, 0]) holder();
