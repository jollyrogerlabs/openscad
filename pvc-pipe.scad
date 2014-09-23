// -*-C-*-
// Limit switch mounts for Fireball v90.
//
// Copyright 2013, Brian Davis
//
// License: LGPL 2.1 or later

//$fn=0;
//$fa=0.01;
//$fs=0.9;

module 2_inch_pvc_pipe(length=100) {
  difference() {
    // OD (outer diameter)
    cylinder(r=30.0, h=length, center=true);
    // ID (inner diameter)
    cylinder(r=52.3/2.0, h=(length + 1.0), center=true);
  }
}

module 2_inch_pvc_connector() {
  difference() {
    cylinder(r=35.0, h=22.0, center=true);
    cylinder(r=30.0, h=23.0, center=true);
  }
}

CXP2_OFFSET = 68;

module 2_inch_pvc_elbow_home_depot() {
  translate([-30, 0, -38])
  union() {
    2_inch_pvc_connector();
    translate([CXP2_OFFSET, 0, CXP2_OFFSET])
      rotate([0, 90, 0])
        2_inch_pvc_connector();
    difference() {
      // Body.
      translate([68, 0, 0])
        rotate([90, 0, 0])
          rotate_extrude(convexity=10)
            translate([68, 0, 0])
              circle(r=61.0/2.0);
      union() {
        // Body.
        translate([68, 0, 0])
          rotate([90, 0, 0])
            rotate_extrude(convexity=10)
              translate([68, 0, 0])
                circle(r=28.0);
        translate([112, 0, 0])
          cube([110, 100, 220], center=true);
        translate([10, 0, -49])
          cube([100, 100, 120], center=true);
      }
    }
  }
}

TEE_OFFSET = 48.0;

module 2_inch_pvc_test_tee() {
  for (x_mult = [-1 : 2 : 1]) {
    translate([x_mult * TEE_OFFSET, 0, 0])
      rotate([0, 90, 0])
        2_inch_pvc_connector();
  }
  translate([0, 0, TEE_OFFSET])
    2_inch_pvc_connector();
  translate([0, 0, 21])
    2_inch_pvc_pipe(length=33.0);
  rotate([0, 90, 0])
    2_inch_pvc_pipe(length=75.0);
}

module 2_inch_pvc_test_tee_adapter() {
  difference() {
    cylinder(r=35.0, h=28.0, center=true);
    cylinder(r=30.0, h=29, center=true);
  }
}

module 2_inch_test_tee_adapted() {
  2_inch_pvc_test_tee();
  translate([0, 0, 73.25])
    2_inch_pvc_test_tee_adapter();
}

LASCO_OD = 69;
LASCO_ID = 60;

LASCO_ELBOW_OFFSET = (LASCO_OD / 2) + (32 / 2);

module 2_inch_lasco_pvc_section(l=10) {
  difference() {
    cylinder(r=LASCO_OD/2, h=l, center=true);
    cylinder(r=LASCO_ID/2, h=l + 0.2, center=true);
  }
}

// Modelled from Lasco schedule 40 elbow.
module 2_inch_pvc_elbow() {
  translate([-18, 0, -35])
  union() {
    translate([57, 0, 50])
      rotate([0, 90, 0])
        2_inch_lasco_pvc_section(l=21);
    translate([1, 0, -5])
      2_inch_lasco_pvc_section(l=21);
    difference() {
      // Body.
      translate([LASCO_ELBOW_OFFSET, 0, 0])
        rotate([90, 0, 0])
          rotate_extrude(convexity=10)
            translate([LASCO_ELBOW_OFFSET, 0, 0])
              circle(r=LASCO_OD/2);
      union() {
        // Body.
        translate([LASCO_ELBOW_OFFSET, 0, 0])
          rotate([90, 0, 0])
            rotate_extrude(convexity=10)
              translate([LASCO_ELBOW_OFFSET, 0, 0])
                circle(r=LASCO_ID/2);
        translate([105, 0, 0])
          cube([110, 100, 220], center=true);
        translate([10, 0, -55.5])
          cube([100, 100, 120], center=true);
      }
    }
  }
}

// Modelled from Lasco schedule 40 tee.
module 2_inch_pvc_tee() {
  difference() {
    union() {
      rotate([0, 90, 0])
        cylinder(r=LASCO_OD/2, h=133, center=true);
      translate([0, 0, 35])
        cylinder(r=LASCO_OD/2, h=65, center=true);
    }
    union() {
      rotate([0, 90, 0])
        cylinder(r=LASCO_ID/2, h=133.2, center=true);
      translate([0, 0, 35])
        cylinder(r=LASCO_ID/2, h=65.2, center=true);
    }
  }
}

*2_inch_pvc_pipe();

*2_inch_pvc_elbow();

*union() {
  2_inch_pvc_test_tee();

  translate([0, 0, 73.25])
    2_inch_pvc_test_tee_adapter();
}

*2_inch_test_tee_adapted();

2_inch_pvc_tee();

*2_inch_pvc_elbow();
