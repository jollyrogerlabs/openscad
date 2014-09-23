// -*-C-*-
// Models for various electronic components.
//
// Copyright 2013, Brian Davis
//
// License: LGPL 2.1 or later

use <centered-primitives.scad>
use <hexagon.scad>

// Single, medium sized LED.  Leads are not included in the model.
module LED(colour="red") {
  color(colour)
  union() {
    cylinder(r=2.5, h=6);
    translate([0, 0, 6])
      sphere(r=2.5);
  };
  color("gray")
  union() {
    translate([1.125, 0, -5])
      cylinder(r=0.25, h=5);
    translate([-1.125, 0, -5])
      cylinder(r=0.25, h=5);
  }
}

// Through-hole resistor.
module resistor() {
  color("aqua")
  union() {
    translate([0, 0, 1.125])
      cylinder(r=1.125, h=5.5);
    translate([0, 0, 1.125])
      sphere(r=1.125);
    translate([0, 0, 6.5])
      sphere(r=1.125);
  };
}

// Top portion of the IR receiver module containing
// the electronics (i.e. everything but the leads.
module ir_receiver_top() {
    color("black")
    union() {
      translate([0, 0, 0])
        c_cube([5.15, 6.15, 3.45]);
      translate([0, 0, 1.5])
        sphere(r=2.15);
    }
}

// Infrared receiver module used to capture signals from
// standard remote control units (e.g. TV or VCR remote).
//
// Part is Radio Shack catalog #276-640.
// AKA Vishay Semiconductor TSOP4838.
module ir_receiver() {
  translate([0, 12.6, -2.75])
  union() {
    translate([0, -0.8, 1.75])
      ir_receiver_top();
    color("gray")
    union() {
      // Left lead
      translate([-1.5, -3.85, 0.75])
        rotate([90, 0, 0])
          cube([0.65, 0.45, 1]);
      translate([-1.75, -4.55, 1])
        rotate([90, 0, 0])
          c_cube([0.75, 0.45, 0.6]);
      translate([-1.75, -16, 1])
        rotate([90, 0, 0])
          c_cube([0.75, 0.45, 23.6]);
      // Center lead
      translate([-0.325, -3.85, 0.75])
        rotate([90, 0, 0])
          cube([0.65, 0.45, 24]);
      // Right lead
      translate([0.85, -3.85, 0.75])
        rotate([90, 0, 0])
          cube([0.65, 0.45, 1]);
      translate([1.75, -4.55, 1])
        rotate([90, 0, 0])
          c_cube([0.75, 0.45, 0.6]);
      translate([1.75, -16, 1])
        rotate([90, 0, 0])
          c_cube([0.75, 0.45, 23.6]);
    }
  }
}

// IR module with bent leads.
module ir_receiver_bent_leads() {
  translate([0, 1, 10])
  union() {
    translate([0, -0.8, 1.75])
      ir_receiver_top();
    color("gray")
    union() {
      // Left lead
      translate([-1.5, -3.85, 0.75])
        rotate([90, 0, 0])
          cube([0.65, 0.45, 1]);
      translate([-1.75, -4.55, 1])
        rotate([90, 0, 0])
          c_cube([0.75, 0.45, 0.6]);
      translate([-1.75, -4.6, -11])
        rotate([180, 0, 0])
          c_cube([0.75, 0.45, 23.6]);

      // Center lead
      translate([-0.325, -3.85, 0.75])
        rotate([90, 0, 0])
          cube([0.65, 0.45, 1]);
      translate([0, -4.75, -10.75])
        rotate([180, 0, 0])
          c_cube([0.65, 0.45, 24]);

      // Right lead
      translate([0.85, -3.85, 0.75])
        rotate([90, 0, 0])
          cube([0.65, 0.45, 1]);
      translate([1.75, -4.55, 1])
        rotate([90, 0, 0])
          c_cube([0.75, 0.45, 0.6]);
      translate([1.75, -4.6, -11])
        rotate([180, 0, 0])
          c_cube([0.75, 0.45, 23.6]);
    }
  }
}

// Similar to Radio Shack catalog #275-645
module spst_mountable_toggle_switch(lower_attachment_offset = 0, upper_attachment_offset = 0) {
  color("red")
  union() {
    c_cube([8, 5, 7]);

    // Feet
    translate([3.5, 2, -4])
      c_cube([1, 1, 1]);
    translate([-3.5, 2, -4])
      c_cube([1, 1, 1]);
    translate([3.5, -2, -4])
      c_cube([1, 1, 1]);
    translate([-3.5, -2, -4])
      c_cube([1, 1, 1]);
  }

  color("gold")
  union() {
    translate([0, 0, -5.5])
      c_cube([0.5, 0.8, 4.5]);
    translate([2.2, 0, -5.5])
      c_cube([0.5, 0.8, 4.5]);
  }

  color("silver")
  union() {
    // Main switch body
    translate([0, 0, 3.75])
      c_cylinder(r=3, h=0.5);
    // NOTE: this portion is actually threaded
    translate([0, 0, 6.25])
      c_cylinder(r=2.375, h=6);
    // Switch
    // NOTE: this portion is actually narrower at
    // the bottom, and rounded on the top
    translate([0.5, 0, 11])
      rotate([0, 15, 0])
        c_cylinder(r=1.25, h=9.5);

    // Lower attachment nut
    translate([0, 0, 4.35 + lower_attachment_offset])
      hexagon(s=4, h=1.2);

    union() {
      // Tabbed washer to prevent twisting
      translate([0, 0, 5.2 + upper_attachment_offset])
        c_cylinder(r=5.625, h=0.5);
      translate([5.25, 0, 4.25 + upper_attachment_offset])
        rotate([0, 90, 0])
          c_cube([2, 2.5, 0.5]);

      // Locking washer
      translate([0, 0, 5.5 + upper_attachment_offset])
        c_cylinder(r=4, h=0.5);

      // Upper attachment nut
      translate([0, 0, 6.1 + upper_attachment_offset])
        hexagon(s=4, h=1.2);  
    }
  }
}

// 2.1 mm barrel jack power connector.
module 2_point_1_mm_barrel_jack() {
  color("black")
  union() {
    // Cylindrical portion of body.
    translate([0, 1.625, 3.5])
      rotate([90, 0, 0])
        c_cylinder(r=4, h=10.5);
    // Rectangular portion of body.
    translate([0, 1.625, 1])
      c_cube([9, 10.5, 6.5]);
    // Rectangular portion surrounding the socket.
    translate([0, -5.125, 3.27])
      c_cube([9, 3.5, 11]);
  }
  // Leads.
  color("silver")
  union() {
    translate([4, 3.75, -3.7])
      c_cube([0.5, 2.0, 4]);
    translate([0, 6.875, -3.7])
      c_cube([2.0, 0.5, 4]);
    translate([0, 0, -3.7])
      c_cube([2.0, 0.5, 4]);
  }
}

module female_headers(count=1) {
  translate([0, 0, 1.75])
  union() {
    color("black")
    c_cube([2.5, 2.5 * count, 8.5]);
    // Pins below the PCB.
    color("silver")
    union() {
      for (index = [-((2.5 * (count / 2.0)) - 1.25) : 2.5 : ((2.5 * (count / 2.0)) - 1.25)]) {
        translate([0, index , -5.75])
          c_cube([0.5, 0.5, 3]);
      }
    }
  }
}

module male_headers(count=1) {
  union() {
    color("black")
    translate([0, 0, -1.125])
      c_cube([2.5, 2.5 * count, 2.5]);
    // Pins below the PCB.
    color("gold")
    union() {
      for (index = [-((2.5 * (count / 2.0)) - 1.25) : 2.5 : ((2.5 * (count / 2.0)) - 1.25)]) {
        translate([0, index , -2.75])
          c_cube([0.5, 0.5, 12]);
      }
    }
  }
}

module type_b_jack_usb_connector() {
  color("silver")
  union() {
    c_cube([12, 16, 11]);
    // Pins below the PCB.
    translate([6.5, 1.5, -6.5])
      c_cube([2, 1.5, 5]);
    translate([-6.5, 1.5, -6.5])
      c_cube([2, 1.5, 5]);
  }
}

module 28_pin_dip_ic_socket() {
  color("black")
    c_cube([10, 35, 4.5]);
  // Pins below the PCB.
  color("silver")
  union() {
    for (index = [-6.5 : 1 : 6.5]) {
      translate([-5, (index * 2.5), -3.5])
        c_cube([0.5, 0.5, 3.5]);
      translate([5, (index * 2.5), -3.5])
        c_cube([0.5, 0.5, 3.5]);
    }
  }
}

module rocker_switch() {
  // Main plastic body.
  color("black")
  translate([0, 0, 6.5])
    c_cube([17.25, 11.9, 11]);

  // Faceplate
  color("black")
  translate([0, 0, 12])
    c_cube([21, 14.9, 2]);

  // Small tabs projecting down
  color("black")
  translate([17.25 / 2, 0, 3.15 / 2.0])
    c_cube([1.1, 11.9, 3.15]);
  color("black")
  translate([-(17.25 / 2), 0, 3.15 / 2.0])
    c_cube([1.1, 11.9, 3.15]);

  // Small ridges below faceplate. (NOTE: Actually black)
  for (x_mult = [-1 : 2 : 1]) {
    for (y_mult = [-1 : 2 : 1]) {
      color("red")
      translate([8 * x_mult, 6 * y_mult, 11 - (3.25 / 2)])
        c_cube([1, 0.5, 3.25]);
      color("red")
      translate([1.2 * x_mult, 6 * y_mult, 11 - (3.25 / 2)])
        c_cube([0.7, 0.5, 3.25]);
    }
  }

  // Angled tabs on the sides. (NOTE: Actually black)
  translate([9.5, 0, 5])
    rotate([0, 25, 0])
      c_cube([0.5, 5, 4.5]);
  translate([9.5, 0, 9])
    rotate([0, 335, 0])
      c_cube([0.5, 5, 4.5]);
  translate([-9.5, 0, 5])
    rotate([0, 335, 0])
      c_cube([0.5, 5, 4.5]);
  translate([-9.5, 0, 9])
    rotate([0, 25, 0])
      c_cube([0.5, 5, 4.5]);
  // Switch. (NOTE: Actually black)
  translate([8.5, -5, 13])
    rotate([90, 0, 180])
      //translate([0, -2.25, 0])
      linear_extrude(height=10)
        polygon(points=[[0,0],[8,0],[2,3]],
          paths=[[0,1,2]]);

  // Blade connectors.
  color("gray")
  translate([7.5, 0, -2.5])
    c_cube([0.8, 4.75, 7]);
  color("gray")
  translate([0, 0, -2.5])
    c_cube([0.8, 4.75, 7]);
}

/*
 * Model of Sharp GP1S53VJ000F photointerrupter.
 * NOTE: dimensions based on data sheet.  Ignored minor
 * details at the tops of the arms.
 */
module photointerrupter_gp1s53vj000f() {
  color("black")
  union() {
    for (x_mult = [-1 : 2 : 1]) {
      translate([x_mult * 4.675, 0, 0])
        cube([4.35, 5.2, 10], center=true);
    }
    translate([0, 0, -3.75])
      cube([5, 5.2, 2.5], center=true);
  }
}

// Test renders.
$fn=30;

*LED();

resistor();

*ir_receiver_top();

*ir_receiver();

*ir_receiver_bent_leads();

*spst_mountable_toggle_switch();

*2_point_1_mm_barrel_jack();

*male_headers(10);

*rocker_switch();

*optointerrupter_gp1s53vj000f();
