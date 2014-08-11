// -*-C-*-
// Modules for modularity.
//
// Copyright 2013, Brian Davis
//
// License: LGPL 2.1 or later

use <overhang-support.scad>
use <bolts-and-screws.scad>
use <makerbot-replicator-build-plate.scad>

$fn=0;
$fa=0.01;
$fs=0.9;

module spaced_connection_point() {
  cylinder(r=1.7, h=10.2, center=true);
  for (z_mult = [-1 : 2 : 1]) {
    translate([0, 0, (z_mult * 2.7) + (z_mult * 0.1)])
      cylinder(r=3, h=1.6, center=true);
  }
}

module cross_support(width, length, height) {
  cube([width, 0.5, height], center=true);
  cube([0.5, length, height], center=true);
}

// Test renders of spaced connection point
CSW = 6;  // Cross support width
CSL = 6;  // Cross support length
CSH = 1.5;  // Cross support height

translate([0, 0, 3.5])
  difference() {
    union() {
      difference() {
        cube([165, 70, 7], center=true);
        union() {
          for (y_mult = [-1 : 2 : 1]) {
            translate([0, y_mult * 34.6, -3.1])
              cube([10, 1, 2], center=true);
          }

          // Holes for connection points.  Columns are left to
          // right, rows are back to front.
          for (row = [-10 : 20 : 10]) {
            for (col = [-60 : 20 : 60]) {
              translate([col, row, 0])
                union() {
                  spaced_connection_point();
                  translate([0, 0, -15])
                    cross_support(width=2, length=2, height=2);
                }
            }
          }
          for (row = [-20 : 20 : 20]) {
            for (col = [-70 : 20 : 70]) {
              translate([col, row, 0])
                union() {
                  spaced_connection_point();
                }
            }
          }
        }
        for (x_mult = [-1 : 2 : 1]) {
          for (y_mult = [-1 : 2 : 1]) {
            translate([x_mult * 62, y_mult * 28, 0])
//            cylinder(r=1.7, h=10.2, center=true);
10_32_nut_socket();
          }
        }
      }
      // Overhang support for indentations.
      for (row = [-10 : 20 : 10]) {
        for (col = [-60 : 20 : 60]) {
          translate([col, row, -2.75])
            cross_support(width=CSW, length=CSL, height=CSH);
        }
      }
      for (row = [-20 : 20 : 20]) {
        for (col = [-70 : 20 : 70]) {
          translate([col, row, -2.75])
            cross_support(width=CSW, length=CSL, height=CSH);
        }
      }
    }
*translate([-20, 0, 0])
cube([17, 17, 30], center=true);
}

%makerbot_replicator_build_plate();
