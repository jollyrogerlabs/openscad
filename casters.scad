// -*-C-*-
// Models for various casters useful in robot making.
//
// Copyright 2013, Brian Davis
//
// License: LGPL 2.1 or later



// 50x70 metal ball caster.
//
// Note: some details of the top of the caster are not included.
//
// Totals:
// width (x-axis): 61.5mm
// length (y-axis): 50mm
// height (z-axis): 15.5mm
module caster_50_by_70() {
  // Center model at (0, 0, 0)
  translate([0, 0, -0.75])
  color("silver")
  union() {
    // Top portion of the caster body.
    difference() {
      hull() {
        // Left
        translate([-27.5, 0, 14])
          cylinder(h=1.5, r=6.5);
        // Right
        translate([27.5, 0, 14])
          cylinder(h=1.5, r=6.5);
        // Center
        translate([0, 0, 14])
          cylinder(h=1.5, r=25);
      }
      // Mounting holes.
      union() {
        // Left
        translate([-27.5, 0, 13.5])
          cylinder(h=2.5, r=2.5);
        // Right
        translate([27.5, 0, 13.5])
          cylinder(h=2.5, r=2.5);
      }
    }
    // Main portion of caster body.
    hull() {
      // Upper
      translate([0, 0, 4])
        cylinder(h=11, r=20.75);
      // Lower
      translate([0, 0, -6])
        cylinder(h=3, r=15.5);
    }
    // Lowest portion holding the ball.
    translate([0, 0, -8])
      cylinder(h=2, r=15.5);
    // Ball
    sphere(r=15.25);
  }
}



// 30x50 metal ball caster.
//
// Note: some details of the top of the caster are not included.
//
// Totals:
// width (x-axis): 48mm
// length (y-axis): 32mm
// height (z-axis): 21mm
module caster_30_by_50() {
  // Center model at (0, 0, 0)
  translate([0, 0, -0.75])
  color("silver")
  union() {
    // Top portion of the caster body.
    difference() {
      hull() {
        // Left
        translate([-20, 0, 12.5])
          cylinder(h=1, r=4);
        // Right
        translate([20, 0, 12.5])
          cylinder(h=1, r=4);
        // Center
        translate([0, 0, 12.5])
          cylinder(h=1, r=16);
      }
      // Mounting holes.
      union() {
        // Left
        translate([-20, 0, 12])
          cylinder(h=2.5, r=2);
        // Right
        translate([20, 0, 12])
          cylinder(h=2.5, r=2);
      }
    }
    // Main portion of caster body.
    hull() {
      // Upper
      translate([0, 0, 0])
        cylinder(h=12.5, r=14);
      // Lower
      translate([0, 0, -3.5])
        cylinder(h=3.5, r=10.5);
    }
    // Ball
    sphere(r=9);
  }
}


// 4 inch swivel wheel caster.
module swivel_caster_4_inch() {
  color("blue")
  rotate([0, 90, 0])
    cylinder(r=50, h=22, center=true);
  color("silver")
  union() {
    translate([0, 38, 68])
      cube([62, 96, 2], center=true);
    // NOTE: this portion is only used to generate the
    // .stl file to include in the Utili-bot .urdf file.
//    translate([0, 35, 66])
//      cube([30, 45, 2], center=true);
    for (x_mult = [-1 : 2 : 1]) {
      translate([x_mult * 15, 35, 62])
        hull() {
          cube([2, 45, 10], center=true);
	    translate([0, -35, -62])
	      rotate([0, 90, 0])
	        cylinder(r=6, h=2, center=true);
        }
    }
  }
}


// 6 inch swivel wheel caster.
module swivel_caster_6_inch() {
  color("gray")
  rotate([0, 90, 0])
    cylinder(r=63, h=37, center=true);
  color("silver")
  union() {
    translate([0, 38, 87])
      cube([73, 92, 3.75], center=true);
    translate([0, 38, 82])
      cylinder(r1=31.5, r2=36.5, h=6, center=true);
    for (x_mult = [-1 : 2 : 1]) {
      translate([x_mult * 25, 30, 74])
	     hull() {
          cube([2, 70, 10], center=true);
	       translate([x_mult * -2, -30, -62])
	         rotate([0, 90, 0])
	           cylinder(r=7, h=2.75, center=true);
        }
    }
  }
}

// Test renders.
$fn=30;

*caster_30_by_50();

*caster_50_by_70();

caster_4_inch();

*caster_6_inch();
