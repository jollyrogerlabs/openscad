// -*-C-*-
// Models for various cable connectors.
//
// Copyright 2014, Brian Davis
//
// License: LGPL 2.1 or later

/*
 * Model of female terminus of 9 pin DSub connector.
 */
module 9_position_dsub_female() {
  color("silver")
  union() {
    difference() {
      translate([0, 0, 0])
        cube([31, 12.5, 1], center=true);
      for (x_mult = [-1 : 2 : 1]) {
        translate([x_mult * 12.5, 0, 0])
          cylinder(r=1.75, h=2, center=true);
      }
    }
    translate([0, 0, 0.5])
      linear_extrude(height=6)
        polygon(points=[[-8,4],[8,4],[7,-4],[-7,-4]],
                paths=[[0,1,2,3]]);
    translate([0, 0, -4])
      linear_extrude(height=3.5)
        polygon(points=[[-9.5,5.25],[9.5,5.25],
                        [8.5,-5.25],[-8.5,-5.25]],
                paths=[[0,1,2,3]]);
  }
  color("black")
  translate([0, 0, -10])
    linear_extrude(height=6)
      polygon(points=[[-8,4],[8,4],[7,-4],[-7,-4]],
              paths=[[0,1,2,3]]);
}
