include <parameters.scad>;

difference () {
  cylinder(d = knob_head_d + 2 * knob_head_wall_thickness, h = knob_head_h);
  cylinder(d = knob_head_d, h = knob_head_h);
}

translate([0, 0, knob_head_h - knob_head_inset])
  cylinder(d = knob_head_slot_d, h = knob_head_inset, $fn = 6);

translate([0, 0, knob_head_h]) {

  for (i = [0 : knob_points - 1])
    rotate([0, 0, i * (360 / knob_points)])
      translate([knob_point_outset, 0, 0]) {
        cylinder(d = knob_point_d, h = knob_head_h - chamfer_height);
        translate([0, 0, knob_head_h - chamfer_height])
          cylinder(d1 = knob_point_d, d2 = knob_point_d - 2 * chamfer_inset, h = chamfer_height);
      }

  cylinder(d = 2 * knob_point_outset + knob_point_d / 2, h = knob_head_h);
}
