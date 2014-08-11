// -*-C-*-
// Models of various ultrasonic distance sensor units.
//
// Several very similar units are modeled here because
// they have minor differences in dimensions which can
// interfere with getting a good fit when attempting to
// use one unit with a design intended for a different one.
//
// NOTE: these sensors are similar to the Parallax PING)))
// sensor except for the fact that the PING))) has 3 pins.
// There may also be other minor differences in sizing.
//
// Copyright 2013, Brian Davis
//
// License: LGPL 2.1 or later

use <robot-platform-loop-bracket.scad>

// HY-SRF05 5 pin sensor.
module ultrasonic_hy_srf05() {
  // Printed circuit board.
  color("green")
  difference() {
    cube([45, 20.5, 1.6]);
    union() {
      translate([2.25, 2.25, -0.1])
        cylinder(r=1.25, h=5);
      translate([42.75, 18.25, -0.1])
        cylinder(r=1.25, h=5);
    }
  }

  // Left ultrasonic sensor.
  color("silver")
  translate([10.5, 10, 1.6])
    cylinder(r=8, h=12);

  // Right ultrasonic sensor.
  color("silver")
  translate([34.5, 10, 1.6])
    cylinder(r=8, h=12);

  // Oscillator chip.
  color("silver")
  hull() {
    translate([18.75, 1.75, 1.6])
      cylinder(r=1.75, h=3.5);

    translate([26.75, 1.75, 1.6])
      cylinder(r=1.75, h=3.5);
  }

  // 5 pin connector.
  union() {
    color("black")
    translate([15.75, 18, -3.5])
      cube([13, 2.5, 3.5]);

    color("silver")
    translate([16.75, 19, -4])
      cube([1, 8, 1]);

    color("silver")
    translate([19.25, 19, -4])
      cube([1, 8, 1]);

    color("silver")
    translate([22, 19, -4])
      cube([1, 8, 1]);

    color("silver")
    translate([24.5, 19, -4])
      cube([1, 8, 1]);

    color("silver")
    translate([27, 19, -4])
      cube([1, 8, 1]);
  }
}

// HC-SR04 4-pin sensor.
module ultrasonic_hc_sr04() {
  // Printed circuit board.
  color("green")
  difference() {
    cube([45, 20.5, 1.2]);
    union() {
      translate([2.25, 2.25, -0.1])
        cylinder(r=1.25, h=5);
      translate([42.75, 18.25, -0.1])
        cylinder(r=1.25, h=5);
    }
  }

  // Left ultrasonic sensor.
  color("silver")
  translate([10.5, 10, 1.25])
    cylinder(r=8, h=12);

  // Right ultrasonic sensor.
  color("silver")
  translate([34.5, 10, 1.25])
    cylinder(r=8, h=12);

  // Oscillator chip.
  color("silver")
  hull() {
    translate([18.75, 1.75, 1.25])
      cylinder(r=1.75, h=3.5);

    translate([26.75, 1.75, 1.25])
      cylinder(r=1.75, h=3.5);
  }

  // 4 pin connector.
  union() {
    color("black")
    translate([17, 18, -3.5])
      cube([10.5, 2.5, 3.5]);

    color("silver")
    translate([18.25, 19, -4])
      cube([1, 8, 1]);

    color("silver")
    translate([20.5, 19, -4])
      cube([1, 8, 1]);

    color("silver")
    translate([22.75, 19, -4])
      cube([1, 8, 1]);

    color("silver")
    translate([25, 19, -4])
      cube([1, 8, 1]);
  }
}

$fn=30;

*ultrasonic_hy_srf05();

ultrasonic_hc_sr04();
