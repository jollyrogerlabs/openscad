// -*-C-*-
// Module for metric nuts and bolts.
//
// NOTE: the various _socket() objects are designed to be
// used with the difference() function to carve out sockets
// in other objects.
//
// Copyright 2013, Brian Davis
//
// License: LGPL 2.1 or later

// FIXME: rough model, contains no cutout for blades.
module 80_mm_12_volt_cooling_fan() {
  difference() {
    translate([0, 0, 12.55])
      cube([80, 80, 25], center=true);
    union() {
      // Holes for mounting screws.
      for (y_mult = [-1 : 2 : 1]) {
        for (x_mult = [-1 : 2 : 1]) {
          translate([x_mult * 35.5, y_mult * 35.5, 12.45])
            cylinder(r=2.5, h=25.5, center=true);
        }
      }
      // Corner cutouts.
      // FIXME: not exactly correct, but close enough.
      for (y_mult = [-1 : 2 : 1]) {
        for (x_mult = [-1 : 2 : 1]) {
          translate([x_mult * 35.5, y_mult * 35.5, 12.5])
            cube([15, 15, 17], center=true);
        }
      }
    }
  }
}

80_mm_12_volt_cooling_fan();
