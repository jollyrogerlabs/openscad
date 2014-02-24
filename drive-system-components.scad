// -*-C-*-
// Models for various drive system components.
//
// Copyright 2013, Brian Davis
//
// License: LGPL 2.1 or later

use <hexagon.scad>
use <bolts-and-screws.scad>

$fn=0;
$fa=0.01;
$fs=0.3;

/*
 * Separate module for tensioner arm spring.
 */
module dune_buggy_chain_tensioner_spring() {
  color("silver")
  union() {
    difference() {
      cylinder(r=9, h=5, center=true);
      cylinder(r=7.4, h=5.5, center=true);
    }
    translate([-10, 8.25, 1.75])
      rotate([0, 90, 0])
        cylinder(r=0.8, h=20, center=true);
    translate([-4.5, -22.5, -0.65])
      rotate([355.5, 0, 0])
        rotate([0, 0, 240])
          rotate([0, 90, 0])
            cylinder(r=0.8, h=37, center=true);
    translate([-13.5, -38, -4.25])
      cylinder(r=0.8, h=9, center=true);
  }
  color("black")
  translate([-9, -40, -8.5])
    rotate([0, 0, 340])
      rotate([0, 90, 0])
        cylinder(r=1.75, h=10, center=true);
}

/*
 * Separate module for tensioner arm.
 */
module dune_buggy_chain_tensioner_arm() {
  translate([0, 1.5, 25.5])
    union() {
      // Roller that rests against the chain.
      color("brown")
      union() {
        rotate([90, 0, 0])
          cylinder(r=11, h=12, center=true);
        for (y_mult = [-1 : 2 : 1]) {
          translate([0, y_mult * 6, 0])
            rotate([90, 0, 0])
              cylinder(r=14, h=2, center=true);
        }
      }
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

/*
 * Razor Part Number: W25143501079
 *
 * NOTE: arm_angle is the angle relative to the arm being
 * fully extended (i.e. tensioner arm is parallel to base
 * at an angle of 0)
 */
module dune_buggy_chain_tensioner(arm_angle=0) {
  translate([3.5, 4, 0])
    union() {
      // Arm
      rotate([0, 270 + arm_angle, 0])
        translate([0, -1.5, 33.5])
          dune_buggy_chain_tensioner_arm();
      // Spring
      rotate([0, 278 + arm_angle, 0])
      translate([0, -4.5, 0])
        rotate([270, 0, 0])
          dune_buggy_chain_tensioner_spring();
    // Base
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

/*
 * Spring for Razor Part Number: W20159460079
 */
module scooter_chain_tensioner_spring() {
  color("silver")
  
  union() {
    difference() {
      cylinder(r=8.5, h=3, center=true);
      cylinder(r=7, h=3.5, center=true);
    }
    // Upper portion which rests against the brake
    translate([-9.75, 0, 4.5])
      cylinder(r=0.75, h=7, center=true);
    translate([-7, 3.25, 1.5])
      rotate([0, 90, 50])
        cylinder(r=0.75, h=8, center=true);
    // Lower portion which raps around tensioner arm
    translate([12, -1, -1.5])
      rotate([0, 90, 315])
        cylinder(r=0.75, h=18, center=true);
    translate([19, -8, -3.75])
      rotate([340, 335, 0])
        cylinder(r=0.75, h=6, center=true);
    translate([20, -5, -6.5])
      rotate([90, 0, 0])
        cylinder(r=0.75, h=8, center=true);
  }
}

/*
 * Razor Part Number: W20159460079
 *
 * Chain tensioner for Trikke scooter.
 */
module scooter_chain_tensioner() {
  union() {
    color("silver")
    union() {
      difference() {
        union() {
          cylinder(r=6, h=6, center=true);
          translate([0, 0, -4.25])
            cylinder(r=10, h=2.75, center=true);
        }
        cylinder(r=4, h=20, center=true);
      }
      translate([15.7, 0, -4.25])
        cube([15, 11, 2.75], center=true);
      translate([28.15, 0, -10.375])
        rotate([0, 48, 0])
          cube([17.75, 11, 2.75], center=true);
      translate([37.05, 0, -16.5])
        cube([8, 11, 2.75], center=true);
      translate([46, 0, -16.5])
        cylinder(r=8, h=2.75, center=true);
      translate([46, 0, -14.6])
        cylinder(r=4, h=1, center=true);

      // Tensioner spring is also centered on
      // the socket.
      scooter_chain_tensioner_spring();
    }
    color("brown")
    union() {
      translate([46, 0, -6.1])
        cylinder(r=8, h=16, center=true);
      translate([46, 0, -13.35])
        cylinder(r=10.5, h=1.5, center=true);
      translate([46, 0, 1.15])
        cylinder(r=10.5, h=1.5, center=true);
    }
    translate([46, 0, 3.25])
      m5locknut();
  }
}

module number_25_chain_55_tooth_sprocket() {
  color("silver")
  difference() {
    // NOTE: very crude attempt to indicate the teeth.
    union() {
      cylinder(r=52.5, h=3, center=true);
      cylinder(r=57, h=2, center=true);
    }
    union() {
      cylinder(r=27, h=3.5, center=true);
      for (x_mult = [-1 : 2 : 1]) {
        translate([x_mult * 31.75, 0, 0])
          cylinder(r=3.2, h=5, center=true);
      }
      for (y_mult = [-1 : 2 : 1]) {
        translate([0, y_mult * 31.75, 0])
          cylinder(r=3.2, h=5, center=true);
      }
      for (mult = [-1 : 2 : 1]) {
        translate([mult * 26, mult * 26, 0])
          cylinder(r=5.5, h=5, center=true);
      }
    }
  }
}

*dune_buggy_chain_tensioner_spring();

*dune_buggy_chain_tensioner_arm();

*dune_buggy_chain_tensioner(arm_angle=45);

*scooter_chain_tensioner_spring();

scooter_chain_tensioner();

*number_25_chain_55_tooth_sprocket();
