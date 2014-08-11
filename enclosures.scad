// -*-C-*-
// Models for various project enclosures, generally used for
// electronics.
//
// Copyright 2014, Brian Davis
//
// License: LGPL 2.1 or later

/*
 * BUD Industries CU-347 Aluminum Econobox.
 */
module BUD_CU_347_enclosure() {
  color("gray")
  cube([187, 119, 81], center=true);
}

/*
 * Radio Shack aluminum project enclosure 270-238
 * Dimensions: 5 1/4" x 3" x 2 1/8" (13.3x7.6x5.4 cm)
 */

module radio_shack_project_enclosure_lid() {
  color("gray")
  union() {
    translate([0, 0, 0.5])
      cube([130, 73, 1], center=true);
    for (y_mult = [-1 : 2 : 1]) {
      translate([0, y_mult * 36, 26])
        cube([130, 1, 52], center=true);
    }
  }
}

module radio_shack_project_enclosure_base() {
  color("gray")
  union() {
    translate([0, 0, 0.5])
      cube([133, 76, 1], center=true);
    for (x_mult = [-1 : 2 : 1]) {
      translate([x_mult * 66, 0, 27])
        cube([1, 74, 54], center=true);
      for (y_mult = [-1 : 2 : 1]) {
        translate([0, y_mult * 37.5, 5])
          cube([133, 1, 10], center=true);
        translate([x_mult * 61.5, y_mult * 37.5, 27])
          cube([10, 1, 54], center=true);
      }
    }
  }
}
