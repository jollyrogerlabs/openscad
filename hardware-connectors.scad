// -*-C-*-
// Modules for various hardware connectors.
//
// Copyright 2013, Brian Davis
//
// License: LGPL 2.1 or later

$fn=0;
$fa=0.01;
$fs=0.9;

use <bolts-and-screws.scad>

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
      // Loop that goes over or under the conduit.
      rotate([0, 270, 0])
        difference() {
          cylinder(r=10.5, h=12.5, center=true);
          union() {
            cylinder(r=9, h=13, center=true);
            translate([-6, 0, 0])
              cube([12, 25, 13], center=true);
          }
        }
      // Attachment points
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
    // Loop that goes over or under the conduit.
    rotate([90, 0, 0])
      difference() {
        union() {
          cylinder(r=33, h=19, center=true);
          translate([0, -16, 0])
            cube([66, 34, 19], center=true);
        }
        union() {
          cylinder(r=30, h=20, center=true);
          translate([0, -19, 0])
            cube([60, 34, 20], center=true);
        }
      }
    // Attachment points
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
 * Carlon model E978JC 2" PVC fixture, available from Home Depot.
 *
 * NOTE: sawtooth details not shown.
 */
module carlon_2_inch_pvc_fixture() {
  color("gray")
  difference() {
    union() {
      cube([73, 73, 25], center=true);
      translate([0, -17.5, 0])
        cube([100, 38, 25], center=true);
    }
    union() {
      cylinder(r=30, h=26, center=true);
      for (x_mult = [-1 : 2 : 1]) {
        translate([x_mult * 44.5, -18, 0])
          rotate([90, 0, 0])
            m5bolt_socket_loose(l=40);
        translate([x_mult * 48.5, 0.95, 0])
          cube([10, 2, 14], center=true);
      }
    }
  }
}

/*
 * Yet another connector designed for electrical conduit and
 * available from Home Depot.
 */
module 2_and_half_inch_metal_u_strap() {
  color("gray")
  union() {
    // Loop that goes over or under the conduit.
    rotate([90, 0, 0])
      difference() {
        union() {
          cylinder(r=37.5, h=25.5, center=true);
          translate([0, -15, 0])
            cube([75, 35, 25.5], center=true);
        }
        union() {
          cylinder(r=36.75, h=27, center=true);
          translate([0, -20, 0])
            cube([73.5, 36, 27], center=true);
        }
      }
    // Attachment points
    for (x_mult = [-1 : 2 : 1]) {
      translate([x_mult * 53, 0, -31.75])
        difference() {
          cube([32, 25.5, 1.5], center=true);
          translate([x_mult * 10.5, 0, 0])
            cylinder(r=5, h=3, center=true);
        }
      translate([x_mult * 69.25, 0, -31.75])
        rotate([0, 90 - (x_mult * 90), 0])
        hull() {
          cube([0.5, 25.5, 1.5], center=true);
          translate([3, 0, 0])
            cube([0.5, 20, 1.5], center=true);
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
    translate([0, 0, -((height / 2) - (thickness / 2))])
      cube([width, length, thickness], center=true);
    translate([(width / 2) - (thickness / 2), 0, 0])
      cube([thickness, length, height], center=true);
  }
}

/*
 * U-bolt for securing 2" PVC pipe available from Home Depot.
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
 * Plate for 2" U-bolt available from Home Depot.
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

/*
 * Support module for 4 inch corner brace.
 */
module 4_inch_corner_brace_leg() {
  color("silver")
  difference() {
    cube([22.5, 3, 101], center=true);
    union() {
      translate([0, 0, 41.5])
        rotate([90, 0, 0])
          cylinder(r=4, h=4, center=true);
      translate([0, 0, -24.5])
        rotate([90, 0, 0])
          cylinder(r=4, h=4, center=true);
    }
  }
}

/*
 * 4 inch corner brace available from Home Depot.
 */
module 4_inch_corner_brace() {
  translate([0, -49, 0])
    4_inch_corner_brace_leg();
  translate([0, 0, -49])
    rotate([270, 0, 0])
      4_inch_corner_brace_leg();
}

/*
 * Support module for gusseted 4 inch corner brace.
 */
module right_triangle(leg=1, h=1) {
  linear_extrude(height=h)
    polygon(points=[[-(leg / 2),-(leg / 2)],
                    [-(leg / 2),(leg / 2)],
                    [(leg / 2),-(leg / 2)]],
            paths=[[0,1,2]]);
}

GUSSETED_4_INCH_CORNER_BRACE_HEIGHT = 25;
GUSSETED_4_INCH_CORNER_BRACE_LEG_WIDTH = 99;
GUSSETED_4_INCH_CORNER_BRACE_LEG_HEIGHT = 2.5;
GUSSETED_4_INCH_CORNER_BRACE_HOLE_SPACING = 65;

/*
 * Support module for gusseted 4 inch corner brace.
 */
module 4_inch_gusseted_corner_brace_leg() {
  difference() {
    cube([GUSSETED_4_INCH_CORNER_BRACE_LEG_WIDTH,
          GUSSETED_4_INCH_CORNER_BRACE_HEIGHT,
          GUSSETED_4_INCH_CORNER_BRACE_LEG_HEIGHT], center=true);
    union() {
      for (x_mult = [-1 : 2 : 1]) {
        translate([x_mult * 47.25, 9.25, -1.5])
          rotate([0, 0, 225 - (x_mult * 45)])
            right_triangle(leg=7, h=3.5);
        translate([7 +
                   (x_mult * (GUSSETED_4_INCH_CORNER_BRACE_HOLE_SPACING / 2)),
                   1, 0])
          cylinder(r=3.5, h=3.5, center=true);
      }
    }
  }
  // Small measurement spheres positioned based on different
  // measurements than the original, added to check correctness.
%  union() {
    translate([-50.5 + 25.5 - 0.5, 1, 0])
      sphere(r=0.5);
    translate([50.5 - 11.5 + 0.5, 1, 0])
      sphere(r=0.5);
  }
}

GUSSETED_4_INCH_CORNER_BRACE_WIDTH = 101;
GUSSETED_4_INCH_CORNER_TRIANGLE_BASE_HEIGHT = 3;

/*
 * Everbilt model 831-301 4" gusseted corner brace, available from
 * Home Depot.
 */
module 4_inch_gusseted_corner_brace() {
  color("silver")
  difference() {
    union() {
      // Triangular gusset plate.
      translate([1, 1,
                 -(GUSSETED_4_INCH_CORNER_BRACE_HEIGHT / 2)])
        right_triangle(leg=GUSSETED_4_INCH_CORNER_BRACE_WIDTH,
                       h=GUSSETED_4_INCH_CORNER_TRIANGLE_BASE_HEIGHT);
      // Angle legs.
      translate([-(GUSSETED_4_INCH_CORNER_BRACE_LEG_WIDTH / 2),
                 GUSSETED_4_INCH_CORNER_BRACE_WIDTH -
                 GUSSETED_4_INCH_CORNER_BRACE_LEG_WIDTH,
                 0])
        rotate([90, 0, 90])
          4_inch_gusseted_corner_brace_leg();
      translate([GUSSETED_4_INCH_CORNER_BRACE_WIDTH -
                 GUSSETED_4_INCH_CORNER_BRACE_LEG_WIDTH,
                 -(GUSSETED_4_INCH_CORNER_BRACE_LEG_WIDTH / 2),
                 0])
        rotate([90, 0, 0])
          4_inch_gusseted_corner_brace_leg();
    }
    union() {
      // Attachment holes in triangular plate.
      translate([-30.25, 18.25, 1.25])
        cylinder(r=3.75, h=3, center=true);
      translate([18.25, -30.25, 1.25])
        cylinder(r=3.75, h=3, center=true);
    }
  }
}

/*
 * Tie-plate available from Home Depot.
 * NOTE: holes not modeled.
 */
module tie_plate() {
  color("gray")
  cube([178, 79, 1], center=true);
}

// Test renders.

*galvanized_angle_1(length=200, odd_holes=false);

*galvanized_connector_1();

*galvanized_connector_2();

*2_inch_half_u_strap();

*half_inch_2_hole_strap();

*2_inch_plastic_u_strap();

*carlon_2_inch_pvc_fixture();

*2_and_half_inch_metal_u_strap();

*angle_aluminum();

*2_inch_u_bolt();

*2_inch_u_bolt_plate();

*4_inch_corner_brace();

4_inch_gusseted_corner_brace();

*tie_plate();
