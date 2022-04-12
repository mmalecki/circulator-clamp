use <nutsnbolts/cyl_head_bolt.scad>;
include <parameters.scad>;

module pad (h, h_top, r_top, d, bolt) {
  difference () {
    hull () {
      cylinder(d = d, h = h);
      translate([0, 0, h + h_top - r_top]) sphere(r = r_top);
    }

     rotate([0, 180, 0]) scale([1 / fit, 1 / fit, 1 / fit])
      hole_through(bolt, l = h);
  }
}

pad(vessel_pad_h, vessel_pad_top_h, vessel_pad_top_r, vessel_pad_d, vessel_bolt);
