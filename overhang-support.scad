// -*-C-*-
// Simple model for overhang support.
//
// Copyright 2013, Brian Davis
//
// License: LGPL 2.1 or later

use <centered-primitives.scad>

SUPPORT_WIDTH=0.5;

module overhang_support(width, length, height) {
  for (x_offset = [-(length / 2) : 2 : length / 2]) {
    translate([x_offset, 0, (SUPPORT_WIDTH / 2)])
      c_cube([0.5, width + 1, SUPPORT_WIDTH]);  
  }
  for (y_offset = [-(width / 2) : 2 : width / 2]) {
    translate([0, y_offset, (height / 2) + (SUPPORT_WIDTH / 2)])
      c_cube([length, SUPPORT_WIDTH, height - SUPPORT_WIDTH]);  
  }
}

module overhang_support_2(width, length, height, step=2) {
  for (x_offset = [-(length / 2) : step : length / 2]) {
    translate([x_offset, 0, (SUPPORT_WIDTH / 2)])
      c_cube([0.75, width + 1, SUPPORT_WIDTH]);  
  }
  for (y_offset = [-(width / 2) : step : width / 2]) {
    translate([0, y_offset, (height / 2) + (SUPPORT_WIDTH / 2)])
      c_cube([length, 0.75, height - SUPPORT_WIDTH]);  
  }
}

module cylindrical_overhang_support(r, h, st=2) {
  difference() {
    overhang_support_2(width=2 * r, length=2 * r, height=h, step=st);
    translate([0, 0, ((h + 0.2) / 2) - 0.1])
      difference() {
        cylinder(r=2 * r, h=h + 0.2, center=true);
        cylinder(r=r + 0.1, h=h + 0.4, center=true);
      }
  }
}
