// -*-C-*-
// Modules for various hardware connectors.
//
// Copyright 2013, Brian Davis
//
// License: LGPL 2.1 or later

$fn=0;
$fa=0.01;
$fs=0.9;

/*
 * Perforated, galvanized thin angle; available from Home Depot.
 */
module galvanized_angle_1(length=180, odd_holes=true) {
  color("gray")
  difference() {
    union() {
      translate([0, 0, -15.5])
        cube([32, length, 1], center=true);
      translate([-15.5, 0, 0])
        cube([1, length, 32], center=true);
    }
    union() {
      for (y_offset = [0 : 25.5 : length / 2]) {
        for (y_mult = [-1 : 2 : 1]) {
          if (odd_holes) {
            // Odd number of perforations, with one hole
            // centered at 0.
            translate([0, y_mult * y_offset, -15.5])
              cylinder(r=5, h=1.5, center=true);
            translate([-15.5, y_mult * y_offset, 0])
              rotate([0, 90, 0])
                cylinder(r=5, h=1.5, center=true);
          }
          else {
            // Even number of perforations, with 0 point
            // centered between 2 holes.
            translate([0, (y_mult * y_offset) + 12.25, -15.5])
              cylinder(r=5, h=1.5, center=true);
            translate([-15.5, (y_mult * y_offset) + 12.25, 0])
              rotate([0, 90, 0])
                cylinder(r=5, h=1.5, center=true);
          }
        }
      }
      if (!odd_holes) {
        // Add an extra hole in the -y direction.
        translate([0, (-length / 2) + 12.25, -15.5])
          cylinder(r=5, h=1.5, center=true);
        translate([-15.5, (-length / 2) + 12.25, 0])
          rotate([0, 90, 0])
            cylinder(r=5, h=1.5, center=true);
      }
    }
  }
}

/*
 * Generally used for square wooden posts; available from
 * Home Depot.
 */
module galvanized_connector_1() {
  color("gray")
  difference() {
    union() {
      translate([0, 0, 29.25])
        cube([93, 83, 1.5], center=true);
      for (x_mult = [-1 : 2 : 1]) {
        translate([x_mult * 46.5, 0, 0])
          cube([1.5, 83, 60], center=true);
      }
    }
    union() {
      translate([0, 0, 29.25])
        cylinder(r=7.25, h=1.7, center=true);
      for (x_mult = [-1 : 2 : 1]) {
        for (y_mult = [-1 : 2 : 1]) {
          translate([x_mult * 22.5, y_mult * 22.5, 29.25])
            cylinder(r=2.5, h=1.7, center=true);
          translate([x_mult * 46.5, y_mult * 22.5, -22])
            rotate([0, 90, 0])
              cylinder(r=2.5, h=1.7, center=true);
        }
        translate([x_mult * 46.5, 0, -10])
          rotate([0, 90, 0])
            cylinder(r=7.25, h=1.7, center=true);
        translate([x_mult * 46.5, 0, 8])
          rotate([0, 90, 0])
            cylinder(r=2.5, h=1.7, center=true);
      }
    }
  }
}

/*
 * Generally used for square wooden posts; available from
 * Home Depot.
 */
module galvanized_connector_2() {
  color("gray")
  difference() {
    union() {
      translate([0, 0, 45])
        cube([94, 40, 2], center=true);
      for (x_mult = [-1 : 2 : 1]) {
        translate([x_mult * 46.25, 0, 0])
          cube([1.5, 40, 90], center=true);
        translate([x_mult * 64.5, 0, -45])
          linear_extrude(height=2)
            polygon(points=[[x_mult * -17.5,20],[x_mult * 3.5,20],
                            [x_mult * 17.5,4.5],[x_mult * 17.5,-4.5],
                            [x_mult * 3.5,-20],[x_mult * -17.5,-20]],
                    paths=[[0,1,2,3,4,5]]);      
      }
    }
    union() {
      translate([0, 0, 45])
        cylinder(r=2, h=2.1, center=true);
      for (x_mult = [-1 : 2 : 1]) {
        translate([x_mult * 70.5, 0, -44])
          cylinder(r=5.5, h=2.1, center=true);
        translate([x_mult * 47.25, x_mult * -8.25, 17.25])
          rotate([0, 90, 0])
            cylinder(r=2, h=2.1, center=true);
        translate([x_mult * 47.25, x_mult * 10.25, -7.75])
          rotate([0, 90, 0])
            cylinder(r=2, h=2.1, center=true);
      }
    }
  }
}

/*
 * Used for 2" electrical conduit; available from Home Depot.
 */
module 2_inch_half_u_strap() {
  color("gray")
  translate([0, 20.25, -29.25])
    union() {
      translate([0, 0, 25])
        rotate([0, 270, 0])
          difference() {
            cylinder(r=33.5, h=28, center=true);
            union() {
              cylinder(r=30.75, h=28.2, center=true);
              translate([-20, 0, 0])
                cube([35, 70, 28.2], center=true);
            }
          }
      translate([0, -32.125, 12])
        cube([28, 3, 24], center=true);
      translate([0, -45.125, 1.5])
        difference() {
          cube([28, 29, 3], center=true);
          translate([0, -5, 0])
            cylinder(r=6, h=3.2, center=true);
        }
      translate([0, -60, 1.5])
        difference() {
          cylinder(r=14, h=3, center=true);
          translate([0, 16, 0])
            cube([30, 30, 3.2], center=true);
        }
      translate([-14, 30.625, 23])
        rotate([270, 0, 0])
          linear_extrude(height=3)
            polygon(points=[[0,0],[7,7],
                            [21,7],[28,0]],
                    paths=[[0,1,2,3]]);      
    }
}

/*
 * Thin strap designed for EMT conduit.
 * Halex product 96161; available from Home Depot.
 */
module half_inch_2_hole_strap() {
  color("gray")
  translate([0, 0, -1.25])
    union() {
      rotate([0, 270, 0])
        difference() {
          cylinder(r=10.5, h=12.5, center=true);
          union() {
            cylinder(r=9, h=13, center=true);
            translate([-6, 0, 0])
              cube([12, 25, 13], center=true);
          }
        }
      for (y_mult = [-1 : 2 : 1]) {
        translate([0, y_mult * 9.75, -4])
          cube([12.5, 1.5, 8], center=true);
        translate([0, y_mult * 16.5, -7.625])
          difference() {
            cube([12.5, 12, 0.75], center=true);
            translate([0, y_mult * 3.5, 0])
              cylinder(r=2.5, h=1.25, center=true);
          }
        translate([0, y_mult * 24, -7.625])
          rotate([0, 0, 90 - (y_mult * 90)])
            translate([-6.5, -1.5, -0.375])
              linear_extrude(height=0.75)
                polygon(points=[[0,0],[3,3],
                                [10,3],[13,0]],
                        paths=[[0,1,2,3]]);      
      }
    }
}

/*
 * Another connector designed for electrical conduit and
 * available from Home Depot.
 */
module 2_inch_plastic_u_strap() {
  color("gray")
  union() {
    rotate([90, 0, 0])
      difference() {
        union() {
          cylinder(r=33, h=19, center=true);
          translate([0, -16, 0])
          cube([66, 34, 19], center=true);
        }
        union() {
          cylinder(r=30, h=19.5, center=true);
          translate([0, -19, 0])
            cube([60, 34, 19.5], center=true);
        }
      }
    for (x_mult = [-1 : 2 : 1]) {
      translate([x_mult * 38.9, 0, -31])
        rotate([0, 90 - (x_mult * 90), 0])
          difference() {
            union() {
              cube([10, 19, 4], center=true);
              translate([-1.5, 0, 0])
                cylinder(r=11.5, h=4, center=true);
            }
            union() {
              translate([3, 0, 0])
                cylinder(r=4, h=4.5, center=true);
              for (y_mult = [-1 : 2 : 1]) {
                translate([0, y_mult * 14.5, 0])
                  cube([12, 10, 4.5], center=true);
              }
              translate([-10.9, 0, 0])
                cube([10, 25, 4.5], center=true);
            }
          }
    }
  }
}

/*
 * Generic piece of angle aluminum which can be ordered
 * in various sizes from e.g. onlinemetals.com.
 */
module angle_aluminum(width=152.5,
                      height=101.5,
                      length=305,
                      thickness=6.35) {
  color("gray")
  union() {
    translate([0, 0, -height / 2])
      cube([width, length, thickness], center=true);
    translate([(width / 2) - (thickness / 2), 0, 0])
      cube([thickness, length, height], center=true);
  }
}

/*
 * U-bolt for securing 2" PVC pipe.
 */
module 2_inch_u_bolt() {
  color("gray")
  union() {
    difference() {
      rotate_extrude(convexity=10)
        translate([36, 0, 0])
          circle(r=3.5, $fn=50);
      translate([0, -50, 0])
        cube([100, 100, 20], center=true);
    }
    for (x_mult = [-1 : 2 : 1]) {
      translate([x_mult * 36, -27.5, 0])
        rotate([90, 0, 0])
          cylinder(r=3.5, h=55, center=true);
    }
  }
}

/*
 * Plate for 2" U-bolt.
 */
module 2_inch_u_bolt_plate() {
  color("gray")
  difference() {
    union() {
      cube([89, 16, 2], center=true);
    }
    union() {
      for (x_mult = [-1 : 2 : 1]) {
        translate([x_mult * 34, 0, 0])
          cylinder(r=3.75, h=2.5, center=true);
        translate([x_mult * 38, 0, 0])
          cylinder(r=3.75, h=2.5, center=true);
        translate([x_mult * 36, 0, 0])
          cube([5, 7.5, 2.5], center=true);
      }
    }
  }
}

// Test renders.

galvanized_angle_1(length=200, odd_holes=false);

*galvanized_connector_1();

*galvanized_connector_2();

*2_inch_half_u_strap();

*half_inch_2_hole_strap();

*2_inch_plastic_u_strap();

*angle_aluminum();

*2_inch_u_bolt();

*2_inch_u_bolt_plate();
