$fn = 100;
fit = 1.01;

chamfer_height = 2.5;
chamfer_inset = 2.5;

// As per https://anovaculinary.com/sous-vide-cooler-guide/:
circulator_outer_d = 60.325 * fit;
rim_thickness = 4;
rim_outer_d = circulator_outer_d + rim_thickness * 2;

rim_height = 40;

rim_connector_width = 30;
rim_connector_length = 12.5;

rim_connector_inset = rim_height / 2;
rim_connector_nut_height = (rim_height - rim_connector_inset) / 3;
rim_connector_nut_offset = rim_connector_width / 3;

// The actual bolt length:
// rim_bolt_length = rim_connector_inset + rim_connector_nut_height;
// The approximation, to appease engineering gods:
rim_bolt = "M3";
rim_bolt_head = 3.5;
rim_bolt_length = 25;

circulator_bolt = "M5";
circulator_bolt_height = 4/5 * rim_height;
circulator_bolt_length = 100;
circulator_bolt_head = 5.5;
circulator_bolt_head_clearence = 4;
circulator_bolt_pad_inset = rim_thickness * 2;
circulator_bolt_pad_length = rim_thickness * 3;
circulator_bolt_pad_clearence = 10;

vessel_bolt = "M8";
vessel_bolt_height = rim_connector_inset / 2;
vessel_bolt_head = 8.5;
vessel_bolt_head_clearence = 4;
vessel_bolt_length = 30;

holder_vessel_length = 30;

vessel_inset = rim_height / 1.5;

vessel_connector_length = 25;
vessel_nutcatch_offset = vessel_connector_length / 6;