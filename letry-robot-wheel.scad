// -*-C-*-
// Model for the "Letry Robot" plastic wheel.
//
// This wheel is available from several different
// online retailers, and fits with the yellow DC
// gearmotor which is modeled in a separate file.
//
// Copyright 2013, Brian Davis
//
// License: LGPL 2.1 or later

// FIXME: rough model, no spokes
module letry_robot_wheel() {
  translate([0, 0, -15])
  rotate([0, 270, 0])
  union() {
  union() {
    rotate([0, 90, 0])
      union() {
        difference() {
	  // tire
	  color("black")
	  cylinder(h=26, r=33);
	  // cutout that provides space for the rim
	  translate([0, 0, -0.1])
	    cylinder(h=26.2, r=26);
	}
	// rim
	cylinder(h=26, r=26);
      }
  }
  // axle attachment
  translate([26, 0, 0])
    rotate([0, 90, 0])
      cylinder(h=4, r=7.5);
  }
}

letry_robot_wheel();
