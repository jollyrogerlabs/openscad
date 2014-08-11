// -*-C-*-
// Models for various battery packs.
//
// Copyright 2013, Brian Davis
//
// License: LGPL 2.1 or later

use <rounded-beam.scad>

// Battery pack holding 4 AA batteries and having a
// small on/off switch in one corner.
//
// Note: details of connection wires are not included.
// Totals:
// width (x-axis): 64.5mm
// length (y-axis): 70.5mm
// height (z-axis): 22mm
module battery_pack_4_AA() {
  // Center the model.
  translate([-32.25, -35.25, -11])
  color("black")
  union() {
    // Main body.
    roundedbeam(width=64.5, length=70.5, height=19.5);
    // On/off switch.
    translate([9, 4, 20])
      cube([7, 4, 2]);
  };
}

// Test renders
$fn=30;

battery_pack_4_AA();
