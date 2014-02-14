// -*-C-*-
// Modules for various batteries.
//
// Copyright 2013, Brian Davis
//
// License: LGPL 2.1 or later

use <rounded-beam.scad>
use <centered-primitives.scad>

// Totals:
// width (x-axis): 26mm
// length (y-axis): 48mm
// height (z-axis): 16.5mm
//
// FIXME: dimensions are not correct due to errors in roundedbeam.
module battery_9v() {
  // Center the model.
  translate([-13, -24, -8.25])
  union() {
    // Body.
    color("black")
    translate([0, 28.5, 0])
      roundedbeam(width=26, length=1.5, height=17);
    color("black")
    roundedbeam(width=26, length=29, height=17);
      translate([0, 30, 0])
        cube([26, 1.5, 17]);
    color("gold")
    translate([0, 31, 0])
      roundedbeam(width=26, length=14, height=17);
    // Positive terminal.
    color("silver")
    translate([9, 47.5, 10.5])
      rotate([90, 0, 0])
        translate([-2.5, -2.5, -1.75])
          cylinder(r=2.5, h=3.5);
    // Negative terminal.
    color("silver")
      translate([17, 45, 6.5])
        roundedbeam(width=4, length=4, height=4);
  }
}

module futaba_connector() {
  c_cube([26.75, 13.25, 7]);
  translate([0, 4.875, 4.1])
    c_cube([1.4, 3.5, 1.2]);
  translate([0, -4.875, 4.1])
    c_cube([1.4, 3.5, 1.2]);
  translate([0, 0, -4.15])
    c_cube([1.5, 7.25, 1.3]);
  translate([11.375, 1.8, 3.5])
    rotate([90, 0, 0])
      linear_extrude(height=3.6)
        polygon(points=[[0,0],[2,0],[0,1.25]],paths=[[0,1,2]]);
}

module eztec_9_6v_rechargeable() {
  color("green")
  // Center the model.
  translate([-48, 0, 0])
  hull() {
    for (offset=[-21.75 : 14.5 : 21.75]) {
      translate([0, offset, 0])
        rotate([0, 90, 0])
          cylinder(r=7.25, h=96);
    }
  }
  color("red")
  translate([48, -28, 2.5])
    rotate([90, 0, 0])
      cylinder(r=1.5, h=75);
  color("black")
  translate([48, -28, -2.5])
    rotate([90, 0, 0])
      cylinder(r=1.5, h=75);
  translate([48, -103, -1])
    rotate([90, 0, 270])
    futaba_connector();
}

module battery_12_volt_sealed_lead_acid() {
  color("black")
  cube([65, 149, 65], center=true);
}

// Test renders.

battery_12_volt_sealed_lead_acid();

*battery_9v();

*futaba_connector();

*eztec_9_6v_rechargeable();
