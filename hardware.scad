// -*-C-*-
// Models for various pieces of useful hardware.
//
// Copyright 2013, Brian Davis
//
// License: LGPL 2.1 or later

use <centered-primitives.scad>

/*
 * Everbilt 2-1/2" hinge 241 008
 *
 * NOTE: the 'angle' parameter is the angle at which the
 * hinge is open, with 0 being fully closed.
 *
 * FIXME: the actual hinge doesn't open more than about
 * 270 degrees.
 */
module 2_point_5_inch_hinge(angle=0) {
  // Side with 3 rings.
  color("silver")
  union() {
    difference() {
      cube([17.5, 63.65, 1.45], centered=true);
      union() {
        translate([0.75, 25.825, 0])
          cylinder(r=3, h=3, centered=true);
        translate([3.25, 0, 0])
          cylinder(r=3, h=3, centered=true);
        translate([0.75, -25.825, 0])
          cylinder(r=3, h=3, centered=true);
      }
    }
    translate([-12.05, 25.825, 0])
      rotate([90, 0, 0])
        cylinder(r=3.3, h=12, centered=true);
    translate([-12.05, 0, 0])
      rotate([90, 0, 0])
        cylinder(r=3.3, h=12, centered=true);
    translate([-12.05, -25.825, 0])
      rotate([90, 0, 0])
        cylinder(r=3.3, h=12, centered=true);
  }

  actual_angle = 360 - angle;

  // Side with 2 rings.
  color("silver")
  translate([-12.05, 0, 0])
  rotate([0, actual_angle, 0])
  translate([12.05, 0, 0])
  union() {
    difference() {
      cube([17.5, 63.65, 1.45], centered=true);
      union() {
        translate([0.75, 25.825, 0])
          cylinder(r=3, h=3, centered=true);
        translate([3.25, 0, 0])
          cylinder(r=3, h=3, centered=true);
        translate([0.75, -25.825, 0])
          cylinder(r=3, h=3, centered=true);
      }
    }
    translate([-12.05, 12.825, 0])
      rotate([90, 0, 0])
        cylinder(r=3.3, h=12, centered=true);
    translate([-12.05, -12.825, 0])
      rotate([90, 0, 0])
        cylinder(r=3.3, h=12, centered=true);
  }
}

/*
 * Metal spacer used with M6 fasteners.
 */
module 6mm_spacer(l=20) {
  color("white")
  difference() {
    cylinder(r=4, h=l, center=true);
    cylinder(r=3.25, h=l, center=true);
  }
}

// Test renders.
$fn=30;

2_point_5_inch_hinge(angle=180);
