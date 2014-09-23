// -*-C-*-
// Model for various types of Arduino boards.
//
// Copyright 2013, Brian Davis
//
// License: LGPL 2.1 or later

use <electronics.scad>

// NOTE: details of the circuits on the board are not provided.
// Totals:
// width (x-axis): 53mm
// length (y-axis): 108mm
// height (z-axis): 13mm
//
// FIXME: add details of hanging pins below the board.
module arduino_mega() {
  // Center the model.
  translate([-26.5, -54, -6.5])
    union() {
      // PCB
      color("green")
      difference() {
        union() {
          cube([53, 100, 2]);
          translate([15, 100, 0])
            hull() {
              cube([35, 2, 2]);
              translate([-3, -1, 0])
                cube([41, 1, 2]);
            }
        }
        // Holes for connections.
        union() {
          translate([2.5, 15, -0.75])
            cylinder(h=3, r=1.75);
          translate([50.5, 15, -0.75])
            cylinder(h=3, r=1.75);
          translate([18, 61, -0.75])
            cylinder(h=3, r=1.75);
          translate([45, 61, -0.75])
            cylinder(h=3, r=1.75);
          translate([2.5, 95, -0.75])
            cylinder(h=3, r=1.75);
          translate([50.5, 97, -0.75])
            cylinder(h=3, r=1.75);
        }
      }
    
      // USB port
      color("silver")
      translate([9, -6, 2])
        cube([12, 16, 11]);
    
      // Power connector
      color("black")
      union() {
        translate([41, -1.5, 2])
          cube([8.5, 3, 11]);
        translate([41, -1.5, 2])
          cube([8.5, 11, 6]);
        translate([49, 4, 13])
          rotate([90, 0, 0])
            translate([-4, -4, -5.5])
              cylinder(r=4, h=8);
      }
    
      // Female headers
      color("black")
      union() {
        // Left side
        translate([1, 17.5, 2])
          cube([2.5, 21, 8.5]);
        translate([1, 39.5, 2])
          cube([2.5, 21, 8.5]);
        translate([1, 62.5, 2])
          cube([2.5, 21, 8.5]);
        // Right side
        translate([49.5, 27, 2])
          cube([2.5, 21, 8.5]);
        translate([49.5, 50, 2])
          cube([2.5, 21, 8.5]);
        translate([49.5, 73, 2])
          cube([2.5, 21, 8.5]);
        // Top
        translate([1, 93.5, 2])
          cube([46, 5, 8.5]);
      }
    }
}

// NOTE: details of the circuits on the board are not provided.
// Totals:
//
// NOTE: USB and power are at the rear of the board.
module arduino_uno_r2() {
    union() {
      // PCB
      color("green")
      difference() {
        union() {
          // Main body.
          translate([0, -1.5, 0.875])
            cube([53.25, 66, 1.75], center=true);
          // Extra portion at the front for forward mounting holes.
          translate([5.125, 33, 0.875])
            hull() {
              cube([33, 2, 2], center=true);
              translate([0, -2.5, 0])
                cube([38, 2, 2], center=true);
            }
        }
        // Holes for connections.
        union() {
          // Right rear.
          translate([24.125, -20.25, 0.875])
            cylinder(h=3, r=1.75, center=true);
          // Left rear.
          translate([-24.125, -18.25, 0.875])
            cylinder(h=3, r=1.75, center=true);
          // Right forward.
          translate([18.25, 32, 0.875])
            cylinder(h=3, r=1.75, center=true);
          // Left forward.
          translate([-9.25, 32, 0.875])
            cylinder(h=3, r=1.75, center=true);
        }
      }
    
      // USB port
      translate([-11.125, -32.5, 7.25])
        type_b_jack_usb_connector();

      // Power connector
      translate([18.625, -30.375, 4])
        2_point_1_mm_barrel_jack();

      // Right forward headers.
      translate([24.375, 23, 4])
        female_headers(count=6);

      // Right rear headers.
      translate([24.375, 5.5, 4])
        female_headers(count=6);

      // Left forward headers.
      translate([-24.375, 20.5, 4])
        female_headers(count=8);

      // Left rear headers.
      translate([-24.375, -0.5, 4])
        female_headers(count=8);

      // Forward capacitor.
      color("gray")
      translate([22.125, -5.5, 4])
        cylinder(r=3, h=5, center=true);

      // Rear capacitor.
      color("gray")
      translate([22.125, -13, 4])
        cylinder(r=3, h=5, center=true);

      // Forward male headers.
      translate([-1.125, 31, 2])
        rotate([180, 0, 90])
          male_headers(count=3);
      translate([-1.125, 28.5, 2])
        rotate([180, 0, 90])
          male_headers(count=3);

      // Rear male headers.
      translate([-19, -17, 2])
        rotate([180, 0, 0])
          male_headers(count=3);
      translate([-21, -17, 2])
        rotate([180, 0, 0])
          male_headers(count=3);

      // DIP ATMega328 (only showing the socket).
      translate([10, 12.5, 4.25])
        28_pin_dip_ic_socket();
    }
}

// Test renders.
$fn=30;

arduino_mega();

// Measurements for UNO R2
*union() {
  %translate([-25, -25.5, 2])
    rotate([0, 0, 90])
      cube([18, 2, 2], center=true);

  %translate([25, -26.5, 2])
     rotate([0, 0, 90])
       cube([16, 2, 2], center=true);

  %translate([21.5, 35, 2])
     cube([10, 2, 2], center=true);
  %color("red")
     translate([4.5, 32, 2])
       cube([31, 2, 2], center=true);
}

*arduino_uno_r2();
