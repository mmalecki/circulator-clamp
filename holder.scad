use <nutsnbolts/cyl_head_bolt.scad>;
use <utils.scad>;
include <parameters.scad>;

module holder () {
  difference () {
    union () {
      difference () {
        cube([rim_connector_length, rim_connector_width * (1 / fit), rim_connector_inset]);

        translate([rim_connector_length / 2, rim_connector_width / 2, 0]) {
          rotate([0, 180, 0]) {
            translate([0, rim_connector_nut_offset]) hole_through(name = rim_bolt, l = rim_bolt_length, h = rim_bolt_head);
            translate([0, -rim_connector_nut_offset]) hole_through(name = rim_bolt, l = rim_bolt_length, h = rim_bolt_head);
            hole_through(name = rim_bolt, l = rim_bolt_length, h = 3);
          }
        }
      }

      translate([rim_connector_length, -(fit - 1) * rim_connector_width / 2, 0]) {
        cube([rim_connector_length, rim_connector_width, rim_height]);

        translate([rim_connector_length, 0, 0]) {
          difference () {
            translate([0, 0, vessel_inset])
              cube([holder_vessel_length, rim_connector_width, rim_height - vessel_inset]);

            translate([holder_vessel_length / 2, rim_connector_width / 2, circulator_bolt_height])
              rotate([0, 270, 0])
                nutcatch_sidecut(name = circulator_bolt);
          }

          translate([holder_vessel_length, 0, 0]) {
            difference () {
              cube([vessel_connector_length, rim_connector_width, rim_height]);

              translate([0, rim_connector_width / 2, vessel_bolt_height]) {
                translate([vessel_nutcatch_offset, 0, 0])
                  rotate([0, 270, 0])
                    nutcatch_sidecut(name = vessel_bolt);

                translate([vessel_connector_length, 0, 0]) {
                  rotate([0, 90, 0])
                    hole_through(name = vessel_bolt, h = vessel_bolt_head, l = vessel_bolt_length, hcld = vessel_bolt_head_clearence);
                }
              }
            }
          }
        }
      }
    }


    translate([rim_connector_length * 2 + holder_vessel_length + vessel_connector_length, rim_connector_width / 2, circulator_bolt_height]) {
      rotate([0, 90, 0])
        hole_through(name = circulator_bolt, h = circulator_bolt_head, l = circulator_bolt_length, hcld = circulator_bolt_head_clearence);
    }
  }
}

