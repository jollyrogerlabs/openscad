// -*-C-*-
// Model for 2WD turtle robot IR sensor mounting bracket.
//
// This bracket is part of the "Turtle - 2WD Mobile Platform"
// manufactured by DFRobot and featured in the book "Make an Arduino-
// Controlled Robot" by Michael Margolis.
//
// Copyright 2013 Brian Davis
//
// License: LGPL 2.1 or later

module robot_platform_loop_bracket() {
  color("black")
  // Center the model.
  translate([0, -16.5, -3.95])
    union() {
      difference() {
        union() {
          // Rounded upper portion of main bracket body.
          translate([0, 21.5, 0])
            cylinder(r=11.5, h=1.5);
          // Rectangular lower portion of main bracket body.
          translate([-11.5, 0, 0])
            cube([23, 21.5, 1.5]);
        }
        union() {
          // Main loop hole.
          translate([0, 21.5, -1])
            cylinder(r=9, h=3);
          // Left mounting hole.
          translate([-7, 10, -1])
            cylinder(r=1.5, h=3);
          // Bottom mounting hole.
          translate([7, 10, -1])
            cylinder(r=1.5, h=3);
        }
      }
      // Perpindicular bottom mount point.
      // NOTE: forward edge is rounded.
      translate([-11.5, 0, 0])
        rotate([90, 0, 0])
          difference() {
            cube([23, 7.9, 1.5]);
            union() {
              // Left bottom mounting hole.
              translate([3.5, 4.45, -1])
                cylinder(r=1.5, h=3);
              // Right bottom mounting hole.
              translate([20, 4.45, -1])
                cylinder(r=1.5, h=3);
              // Center bottom mounting hole.
              translate([11.5, 4.45, -1])
                cylinder(r=1.5, h=3);
            }
          }
      }
}

// Test renders.
$fn=30;

robot_platform_loop_bracket();
