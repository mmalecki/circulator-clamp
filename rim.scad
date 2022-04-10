use <nutsnbolts/cyl_head_bolt.scad>;
include <parameters.scad>;

module rim () {
  difference () {
    hull () {
      // Chamfered cylinder:
      cylinder(d1 = rim_outer_d - chamfer_inset, d2 = rim_outer_d, h = chamfer_height);

      translate([0, 0, rim_height - chamfer_height])
        cylinder(d1 = rim_outer_d, d2 = rim_outer_d - chamfer_inset, h = chamfer_height);

      // The connector cube:
      translate([rim_outer_d / 2, - rim_connector_width / 2, 0])
        cube([rim_connector_length, rim_connector_width, rim_height]);
    }

    translate([(rim_outer_d + rim_connector_length) / 2, 0, circulator_bolt_height])
      rotate([0, 270, 0])
        nutcatch_sidecut(name = circulator_bolt);

    cylinder(d = circulator_outer_d, h = rim_height);

    translate([(rim_outer_d + rim_connector_length) / 2, 0, 0]) {
      // Nut catches:
      translate([0, 0, rim_connector_inset]) {
        translate([0, 0, rim_connector_nut_height]) {
          translate([0, -rim_connector_nut_offset]) nutcatch_sidecut(name = rim_bolt);
          translate([0, rim_connector_nut_offset]) nutcatch_sidecut(name = rim_bolt);
        }

        translate([0, 0, rim_connector_x_nut_height]) {
          rotate([0, 270, 0]) hole_through(name = rim_bolt, l = rim_bolt_x_length);
          rotate([0, 90, 0]) nutcatch_sidecut(name = rim_bolt);
        }
      }

      // Hole throughs:
      rotate([0, 180, 0]) {
        translate([0, rim_connector_nut_offset]) hole_through(name = rim_bolt, l = rim_bolt_length, h = rim_bolt_head);
        translate([0, -rim_connector_nut_offset]) hole_through(name = rim_bolt, l = rim_bolt_length, h = rim_bolt_head);
      }
    }

    translate([rim_outer_d / 2, -rim_connector_width / 2, 0]) {
      cube([rim_connector_length, rim_connector_width, rim_connector_inset]);
    }

    translate([0, 0, circulator_bolt_height]) {
      translate([circulator_outer_d / 2 + circulator_bolt_pad_inset, 0, 0])
        rotate([0, 270, 0])
          cylinder(d = circulator_bolt_pad_clearence, h = circulator_bolt_pad_length);

      translate([rim_connector_length * 2 + holder_vessel_length + vessel_connector_length, 0]) {
        rotate([0, 90, 0])
          hole_through(name = circulator_bolt, h = circulator_bolt_head, l = circulator_bolt_length, hcld = circulator_bolt_head_clearence);
      }
    }
  }

}
