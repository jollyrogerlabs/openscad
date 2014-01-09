// -*-C-*-
// Models for various drive system components.
//
// Copyright 2013, Brian Davis
//
// License: LGPL 2.1 or later

use <hexagon.scad>

$fn=0;
$fa=0.01;
$fs=0.9;

module dune_buggy_chain_tensioner_arm() {
  translate([0, 1.5, 25.5])
    union() {
      // Roller that rests against the chain.
      color("brown")
      rotate([90, 0, 0])
        cylinder(r=14, h=14, center=true);
      // Head of the screw that connects the tensioner arm to
      // the roller.
      color("silver")
      translate([0, -8.25, 0])
        rotate([90, 0, 0])
          cylinder(r=4.625, h=1.5, center=true);
      // Tensioner arm.
      color("silver")
      union() {
        // Connection to the roller.
        translate([0, -8.5, 0])
          rotate([90, 0, 0])
            cylinder(r=10, h=3, center=true);
        // Main body.
        translate([0, -8.5, -32])
          cube([14, 3, 50], center=true);
        // Connection to the base.
        translate([0, -7, -59])
          rotate([90, 0, 0])
            difference() {
              cylinder(r=6, h=10, center=true);
              cylinder(r=3.1, h=11, center=true);
            }
      }
  }
}

// Razor Part Number: W25143501079
// NOTE: arm_angle is the angle relative to the arm being
// fully extended (i.e. tensioner arm is parallel to base
// at an angle of 0)
module dune_buggy_chain_tensioner(arm_angle=0) {
  translate([3.5, 4, 0])
union() {
  // Moveable portion
  rotate([0, 270 + arm_angle, 0])
    translate([0, -1.5, 33.5])
      dune_buggy_chain_tensioner_arm();
  // Tensioner base.
  color("silver")
  union() {
    // Mount points
    for (y_mult = [-1 : 2 : 1]) {
      hull() {
        translate([0, (y_mult * 6.5) - 7, 0])
          rotate([90, 0, 0])
            cylinder(r=9, h=3, center=true);
        translate([3, (y_mult * 6.5) - 7, -9.5])
          cube([24, 3, 5], center=true);
      }
    }
    difference() {
      // Main body of base.
      translate([34, -7, -11])
        cube([64, 16, 8], center=true);
      union() {
        // Cutout that produces a "trough" in the base.
        translate([34, -7, -8.6])
          cube([64.2, 10, 5.1], center=true);
        // Cutouts for mounting fasteners.
        for (x_mult = [-1 : 2 : 1]) {
          translate([36.5 + (x_mult * 22.25), -7, -11])
            cylinder(r=3.25, h=8.2, center=true);
        }
      }
    }
    translate([0, -17.25, 0])
      rotate([90, 0, 0])
        hexagon(s=6, h=4.5);
    translate([0, 4, 0])
      rotate([90, 0, 0])
        hexagon(s=3.5, h=6);
  }
}
}

module number_25_chain_55_tooth_sprocket() {
  color("silver")
  difference() {
    cylinder(r=57, h=3, center=true);
    union() {
      cylinder(r=27, h=3.5, center=true);
    }
  }
}

*dune_buggy_chain_tensioner_arm();

dune_buggy_chain_tensioner(arm_angle=45);
