// -*-C-*-
// Models of various types of wheels.
//
// Copyright 2013, Brian Davis
//
// License: LGPL 2.1 or later

/*
 * Based on Harbor Freight Item #98950
 */
module 6_inch_semi_solid_wheel() {
  color("black")
  difference() {
    cylinder(r=75, h=37);
    translate([0, 0, -0.05])
      cylinder(r=97 / 2, h=37.1);
  }
  color("white")
  translate([0, 0, -0.05])
  difference() {
    cylinder(r=97 / 2, h=37.1);
    translate([0, 0, -0.05])
      cylinder(r=13 / 2, h=37.2);
  }
  color("white")
  translate([0, 0, 37])
  difference() {
    cylinder(r=21 / 2, h=11);
    translate([0, 0, -0.05])
      cylinder(r=13 / 2, h=11.1);
  }
}

/*
 * Based on Harbor Freight Item #47638
 * NOTE: much detail is lost on the tire and hub.
 */
module 8_inch_inflatable_wheel() {
  color("orange")
  difference() {
    hull() {
      union() {
        rotate_extrude(convexity=10)
          translate([73, 0, 0])
            circle(r=30.0);
        difference() {
          cylinder(r=112.5, h=42, center=true);
          cylinder(r=111.5, h=45, center=true);
        }
      }
    }
    cylinder(r=62.5, h=61, center=true);
  }
  color("silver")
  difference() {
    union() {
      cylinder(r=62.5, h=5, center=true);
      translate([0, 0, 11])
        cylinder(r=20, h=39, center=true);
    }
    union() {
      cylinder(r=8, h=70, center=true);
      for (x_mult = [-1 : 2 : 1]) {
        translate([x_mult * 31.75, 0, 0])
          cylinder(r=3.2, h=20, center=true);
      }
      for (y_mult = [-1 : 2 : 1]) {
        translate([0, y_mult * 31.75, 0])
          cylinder(r=3.2, h=20, center=true);
      }
    }
  }
}


8_inch_inflatable_wheel();
