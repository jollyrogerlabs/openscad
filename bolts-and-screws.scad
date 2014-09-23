// -*-C-*-
// Module for various types of bolts, screws, nuts, and washers.
//
// NOTE: the various _socket() objects are designed to be
// used with the difference() function to carve out sockets
// in other objects.
//
// Copyright 2013, Brian Davis
//
// License: LGPL 2.1 or later

use <hexagon.scad>

$fn=0;
$fa=0.01;
$fs=0.3;




// Generic support code.

/*
 * NOTE:
 * hs = head side (the length of one side of the hexagonal head)
 * hh = head height (the height/width of the hexagonal head)
 * sr = shaft radius
 * sh = shaft height
 */
module generic_bolt(hs, hh, sr, sh) {
  // Center the model.
  translate([0, 0, -sh / 2])
    union() {
      // head
      hexagon(s=hs, h=hh);
      // shaft
      // NOTE: add extra 0.1 to ensure proper connection
      // between shaft and head.
      translate([0, 0, (hh / 2) - 0.1])
        cylinder(r=sr, h=(sh + 0.1));
    }
}

/*
 * NOTE:
 * hr = head radius
 * hh = head height (the height/width of the hexagonal head)
 * sr = shaft radius
 * sh = shaft height
 * FIXME: philips head slots and some roundedness on the head
 * are not shown.
 */
module generic_machine_screw(hr, hh, sr, sh) {
  // Center the model.
  translate([0, 0, -sh / 2])
    union() {
      // head
      cylinder(r=hr, h=hh);
      // shaft
      // NOTE: add extra 0.1 to ensure proper connection
      // between shaft and head.
      translate([0, 0, (hh / 2) - 0.1])
        cylinder(r=sr, h=(sh + 0.1));
    }
}

/*
 * NOTE:
 * hr = head radius
 * hh = head height (the height/width of the conical head)
 * sr = shaft radius
 * sh = shaft height
 * FIXME: philips head slots and some roundedness on the head
 * are not shown.
 */
module generic_flat_head_machine_screw(hr, hh, sr, sh) {
  // Center the model.
  translate([0, 0, -sh / 2])
    union() {
      // head
    cylinder(r1=hr, r2=sr, h=hh);
      // shaft
      // NOTE: add extra 0.1 to ensure proper connection
      // between shaft and head.
      translate([0, 0, (hh / 2) - 0.1])
        cylinder(r=sr, h=(sh + 0.1));
    }
}

/*
 * NOTE:
 * hs = hexagon side (the length of one side of the outer hexagon)
 * hh = hexagon height
 * ir = inner radius (the radius of the inner hole)
 */
module generic_nut(hs, hh, ir) {
  difference() {
    hexagon(s=hs, h=hh);
    translate([0, 0, -(hh + 0.5) / 2])
      cylinder(r=ir, h=hh+0.5);
  }
}

/*
 * NOTE:
 * ir = inside radius
 * or = outside radius
 * t = thickness
 */
module generic_washer(ir, or, t) {
  difference() {
    cylinder(r=or, h=t, center=true);
    cylinder(r=ir, h=2 * t, center=true);
  }
}

/*
 * NOTE:
 * hr = head radius (the radius of the extra cutout for the head)
 * hh = head height
 * sr = shaft radius
 * sh = shaft height
 */
module generic_loose_socket(hr, hh, sr, sh) {
  // Center the model.
  translate([0, 0, -sh / 2])
    union() {
      // head
      cylinder(r=hr, h=hh, center=true);
      // shaft
      // NOTE: add extra 0.1 to ensure proper connection
      // between shaft and head.
      translate([0, 0, ((sh + hh) / 2) - 0.1])
        cylinder(r=sr, h=(sh + 0.1), center=true);
    };
}




// Fasteners using Metric units.

// M4

/*
 * A hex bolt with 4 mm diameter and variable length shaft with fixed
 * size, hexagonal head 3 mm in width and 4 mm on a side.
 */
module m4bolt(l=20) {
  color("gray")
  generic_bolt(hs=4, hh=3, sr=2, sh=l);
}

/*
 * A nut to fit M4 size bolts/screws.
 */
module m4nut() {
  color("gray")
  generic_nut(hs=4, hh=3, ir=2);
}

/*
 * A washer to fit M4 size bolts/screws.
 */
module m4washer() {
  color("gray")
  generic_washer(ir=2.15, or=6, t=1);
}

/*
 * A socket to tightly fit the head of the M4 size bolt,
 * with variable length.
 */
module m4bolt_socket_tight(l=20, ext=0) {
  generic_bolt(hs=4.25, hh=3.25 + ext, sr=2.25, sh=20);
}

/*
 * A socket to fit the head of the M4 size bolt with room
 * for the bolt to be tightened, with variable length.
 * NOTE:
 * er = the amount of extra radius around the head
 * eh = the amount of extra height for the space around the head
 */
module m4bolt_socket_loose(l=20, er=0, eh=0) {
  generic_loose_socket(hr=6 + er, hh=3.25 + eh, sr=2.2, sh=l);
}

/*
 * A socket to fit the M4 size nut.
 */
module m4nut_socket() {
  hexagon(s=4.25, h=3.25);
}


// M5

/*
 * A hex bolt with 5 mm diameter and variable length shaft with fixed
 * size, hexagonal head 3.6 mm in height/width and 5 mm on a side.
 */
module m5bolt(l=20) {
  color("gray")
  generic_bolt(hs=5, hh=3.6, sr=2.5, sh=l);
}

/*
 * A flat-head machine screw with 5mm diameter and variable length
 * shaft.
 * NOTE: Philips head slots not shown.
 */
module m5flat_head_machine_screw(l=20) {
  color("gray")
  generic_flat_head_machine_screw(hr=4.5, hh=3, sr=2.4, sh=l);
}

/*
 * A nut to fit M5 size bolts/screws.
 */
module m5nut() {
  color("gray")
  generic_nut(hs=5, hh=4, ir=2.5);
}

/*
 * A socket to tightly fit the head of the M5 size bolt,
 * with variable length.
 */
module m5bolt_socket_tight(l=20, ext=0) {
  generic_bolt(hs=5.25, hh=3.85 + ext, sr=2.75, sh=l);
}

/*
 * A socket to fit the head of the M5 size bolt with room
 * for the bolt to be tightened, with variable length.
 * er = the amount of extra radius around the head
 * eh = the amount of extra height for the space around the head
 */
module m5bolt_socket_loose(l=20, er=0, eh=0) {
  generic_loose_socket(hr=7 + er, hh=4.1 + eh, sr=3, sh=l);
}

/*
 * A socket to fit the M5 size nut.
 */
module m5nut_socket() {
  hexagon(s=5.25, h=3.85);
}

/*
 * A lock nut to fit M5 size bolts/screws.
 */
module m5locknut() {
  color("gray")
  union() {
    generic_nut(hs=5, hh=3, ir=2.125);
    translate([0, 0, 2])
      difference() {
        cylinder(r=3.75, h=1, center=true);
        cylinder(r=2.125, h=1.5, center=true);
      }
  }
}


// M6

/*
 * A flat-head machine screw with 6mm diameter and variable length
 * shaft.
 * NOTE: Philips head slots not shown.
 */
module m6flat_head_machine_screw(l=20) {
  color("gray")
  generic_flat_head_machine_screw(hr=5.5, hh=3, sr=2.9, sh=l);
}

/*
 * Standard-sized M6 x 20mm flat-head machine screw.
 * NOTE: the 20mm length includes the head.
 */
module m6x20mm_flat_head_machine_screw() {
  m6flat_head_machine_screw(l=17);
}

/*
 * Standard-sized M6 x 25mm flat-head machine screw.
 * NOTE: the 25mm length includes the head.
 */
module m6x25mm_flat_head_machine_screw() {
  m6flat_head_machine_screw(l=22);
}

/*
 * Standard-sized M6 x 35mm flat-head machine screw.
 * NOTE: the 35mm length includes the head.
 */
module m6x35mm_flat_head_machine_screw() {
  m6flat_head_machine_screw(l=32);
}

/*
 * A hex bolt with 5 mm diameter and variable length shaft with fixed
 * size, hexagonal head 3.6 mm in height/width and 5 mm on a side.
 */
module m6bolt(l=20) {
  color("gray")
  generic_bolt(hs=5.75, hh=4, sr=2.9, sh=l);
}

/*
 * Standard-sized M6 x 45mm hex bolt.
 * NOTE: the 45mm length does not include the head.
 */
module m6x45mm_hex_bolt() {
  m6bolt(l=45);
}

/*
 * A nut to fit M6 size bolts/screws.
 */
module m6nut() {
  color("gray")
  generic_nut(hs=5.5, hh=5, ir=2.9);
}

/*
 * A lock nut to fit M6 size bolts/screws.
 *
 * Modeled on Brighton-Best M6 1.00 DIN 985
 */
module m6locknut() {
  color("gray")
  union() {
    generic_nut(hs=5.5, hh=4, ir=2.9);
    translate([0, 0, 3])
      difference() {
        cylinder(r=5, h=2, center=true);
        cylinder(r=2.9, h=2.5, center=true);
      }
  }
}

/*
 * A washer to fit M6 size bolts/screws.
 */
module m6washer() {
  color("gray")
  generic_washer(ir=3.2, or=6.25, t=1.6);
}

/*
 * A socket to fit the M6 flat-head machine screw.
 */
module m6flat_head_machine_screw_socket(l=20) {
  generic_flat_head_machine_screw(hr=5.75, hh=3.5, sr=3.2, sh=l);
}

/*
 * A socket to fit the head of the M6 size bolt with room
 * for the bolt to be tightened, with variable length.
 * er = the amount of extra radius around the head
 * eh = the amount of extra height for the space around the head
 */
module m6bolt_socket_loose(l=20, er=0, eh=0) {
  generic_loose_socket(hr=7.5 + er, hh=4.1 + eh, sr=3.3, sh=l);
}



// Fasteners using Imperial units.

// TODO: still converting here

// 2-56 round-head screw and nut.

// A 2-56 round-head screw of specified length.
// NOTE: length INCLUDES the height of the screw head.
// Also, flat-head screwdriver slot not shown.
module 2_56_round_head_screw(l=18) {
  translate([0, 0, -l / 2])
    union() {
      // head
      difference() {
        // start with a sphere and then cut away the
        // lower portion
        translate([0, 0, 2])
          sphere(r=2);
        translate([-20, -20, 2])
          cube([40, 40, 40]);
      }
      // shaft
      translate([0, 0, 1.75])
        cylinder(r=1.07, h=(l-1.75));
    }
}

// A nut to fit the 2-56 size screw.
module 2_56_nut() {
  difference() {
    hexagon(s=2.7, h=1.55);
    // center hole
    translate([0, 0, -1.5])
      cylinder(r=1.05, h=3);
  }
}

// A socket to fit the 2-56 size nut.
//
// NOTE: extend parameter allows the depth of the cutout
// to be expanded.
module 2_56_nut_socket(l=18, extend=0) {
  translate([0, 0, -(l + 1.8 + extend) / 2])
    union() {
      translate([0, 0, l])
        hexagon(s=2.95, h=1.8 + extend);
      cylinder(r=1.35, h=l);
    }
}



// 4-40 round-head screw and nut.
// NOTE: 4-40 is a good size to use for securing
// Arduino boards to other objects.

// A 4-40 round-head screw of specified length.
// NOTE: length INCLUDES the height of the screw head.
// Also, flat-head screwdriver slot not shown.
// Default length of 21 mm is equivalent to a standard
// 1" length screw.
module 4_40_round_head_screw(l=21) {
  color("silver")
  translate([0, 0, -l / 2])
    union() {
      // head
      difference() {
        // start with a sphere and then cut away the
        // lower portion
        translate([0, 0, 2])
          sphere(r=2.5);
        translate([-20, -20, 2])
          cube([40, 40, 40]);
      }
      // shaft
      translate([0, 0, 2.2])
        cylinder(r=1.35, h=(l-2.2));
    }
}

// A nut to fit the 4-40 size screw.
module 4_40_nut() {
  color("silver")
  difference() {
    hexagon(s=3.5, h=2);
    // center hole
    translate([0, 0, -1.5])
      cylinder(r=1.2, h=3);
  }
}

// A socket to fit the 4-40 size nut.
//
// NOTE: extend parameter allows the depth of the cutout
// to be expanded.
module 4_40_nut_socket(l=18, extend=0) {
  translate([0, 0, -(l + 2.5 + extend) / 2])
    union() {
      translate([0, 0, l])
        hexagon(s=4.1, h=2.5 + extend);
      cylinder(r=1.7, h=l);
    }
}

/*
 * A socket to fit the head of the M6 size bolt with room
 * for the bolt to be tightened, with variable length.
 * er = the amount of extra radius around the head
 * eh = the amount of extra height for the space around the head
 */
module 4_40_bolt_socket_loose(l=20, er=0, eh=0) {
  generic_loose_socket(hr=3.25 + er, hh=2.1 + eh, sr=1.7, sh=l);
}



// 6-32 round-head screw and nut.

// A 6-32 round-head screw of specified length.
// NOTE: length INCLUDES the height of the screw head.
// Also, flat-head screwdriver slot not shown.
module 6_32_round_head_screw(l=18) {
  color("silver")
  translate([0, 0, -l / 2])
    union() {
      // head
      difference() {
        // start with a sphere and then cut away the
        // lower portion
        translate([0, 0, 2])
          sphere(r=6.35/2);
        translate([-20, -20, 2])
	       cube([40, 40, 40]);
      }
      // shaft
      translate([0, 0, 2.2])
        cylinder(r=1.35, h=(l-2.2));
    }
}

// A nut to fit the 6-32 size screw.
module 6_32_nut() {
  color("silver")
  difference() {
    hexagon(s=3.6, h=2.3);
    // center hole
    translate([0, 0, -1.5])
      cylinder(r=3.4/2.0, h=3);
  }
}

// A socket to fit the 6-32 size nut.
//
// NOTE: extend parameter allows the depth of the cutout
// to be expanded.
module 6_32_nut_socket(l=18, extend=0) {
  translate([0, 0, -(l + 2.5 + extend) / 2])
    union() {
      translate([0, 0, l])
        hexagon(s=4, h=2.5 + extend);
      cylinder(r=1.9, h=l);
    }
}


// 10-32 round-head screw and nut.

// A 10-32 round-head screw of specified length.
// NOTE: length INCLUDES the height of the screw head.
// Also, flat-head screwdriver slot not shown.
module 10_32_round_head_screw(l=18) {
  color("silver")
  translate([0, 0, -l / 2])
    union() {
      // head
      difference() {
        // start with a sphere and then cut away the
        // lower portion
        translate([0, 0, 9])
          sphere(r=15/2);
        translate([-20, -20, 4.5])
	       cube([40, 40, 40]);
      }
      // shaft
      translate([0, 0, 4.25])
        cylinder(r=4.7/2.0, h=(l-4.25));
    }
}

// A nut to fit the 10-32 size screw.
module 10_32_nut() {
  color("silver")
  difference() {
    hexagon(s=5.5, h=3.15);
    // center hole
    translate([0, 0, -1.6])
      cylinder(r=4.9/2.0, h=4);
  }
}

// A socket to fit the 10-32 size nut.
//
// NOTE: extend parameter allows the depth of the cutout
// to be expanded.
module 10_32_nut_socket(l=18, extend=0) {
  translate([0, 0, -(l + 2.5 + extend) / 2])
    union() {
      translate([0, 0, l])
        hexagon(s=5.7, h=3.5 + extend);
      cylinder(r=2.7, h=l);
    }
}

// 10-24 round-head screw and nut.

// A 10-24 round-head screw of specified length.
// NOTE: length DOES NOT INCLUDE the height of the screw head.
// Also, flat-head screwdriver slot not shown.
module 10_24_machine_screw(l=20) {
  color("gray")
  generic_machine_screw(hr=4.5, hh=3.5, sr=2.25, sh=l);
}

// A nut to fit the 10-24 size screw.
module 10_24_nut() {
  color("gray")
  generic_nut(hs=4, hh=3.85, ir=2.05);
}

//// A socket to fit the 10-24 size nut.
////
//// NOTE: extend parameter allows the depth of the cutout
//// to be expanded.
//module 10_24_nut_socket(l=18, extend=0) {
//  translate([0, 0, -(l + 2.5 + extend) / 2])
//    union() {
//      translate([0, 0, l])
//        hexagon(s=5.7, h=3.5 + extend);
//      cylinder(r=2.7, h=l);
//    }
//}





// 1/4" bolt/nut/washer.

// A 1/4" bolt of specified length.
// NOTE: length INCLUDES the height of the bolt head.
module 1_4_inch_bolt(l=98) {
  color("silver")
  translate([0, 0, -l / 2])
    union() {
      // head
      hexagon(s=6.5, h=4);
      // shaft
      cylinder(h=l - 4, r=3.2);
    };
}

// A nut to fit the 1/4" size bolt.
module 1_4_inch_nut() {
  color("silver")
  difference() {
    hexagon(s=6.5, h=4);
    // center hole
    translate([0, 0, -1.6])
      cylinder(r=3.1, h=4);
  }
}

// A washer to fit the 1/4" size bolt.
module 1_4_inch_washer() {
  color("gray")
  difference() {
    cylinder(r=7.9, h=1.5, center=true);
    cylinder(r=3.65, h=1.75, center=true);
  }
}

// A socket to fit the 1/4" size nut.
//
// NOTE: extend parameter allows the depth of the cutout
// to be expanded.
module 1_4_inch_nut_socket(l=18, extend=0) {
  translate([0, 0, -(l + 2.5 + extend) / 2])
    union() {
      translate([0, 0, l])
        hexagon(s=6.7, h=5 + extend);
      cylinder(r=3.5, h=l);
    }
}

// A socket to fit the 1/4" size bolt with room for an
// appropriate washer and variable length.
// er = the amount of extra radius around the head
// eh = the amount of extra height for the space around the head
module 1_4_inch_bolt_socket_loose(l=20, er=0, eh=0) {
  // NOTE: using slightly larger default head radius than the
  // radius of the 3/8" washer.
  generic_loose_socket(hr=8.5 + er, hh=6.5 + eh, sr=3.5, sh=l);
}



// 3/8" bolt/nut/washer.

// A 3/8" bolt of specified length.
// NOTE: length DOES NOT INCLUDE the height of the bolt head.
module 3_8_inch_bolt(l=98) {
  color("gray")
  generic_bolt(hs=8, hh=5.4, sr=4.66, sh=l);
}

/*
 * Standard-sized 3/8" x 1/2" hex bolt.
 * NOTE: the 1/2" length does not include the head.
 */
module 3_8x1_2_inch_bolt() {
  color("gray")
  generic_bolt(hs=8, hh=5.4, sr=4.66, sh=12.5);
}

/*
 * Standard-sized 3/8" x 5/8" hex bolt.
 * NOTE: the 5/8" length does not include the head.
 */
module 3_8x5_8_inch_bolt() {
  color("gray")
  generic_bolt(hs=8, hh=5.4, sr=4.66, sh=16);
}

/*
 * Standard-sized 3/8" x 1 1/2" hex bolt.
 * NOTE: the 1 1/2" length does not include the head.
 */
module 3_8x1_and_1_2_inch_bolt() {
  color("gray")
  generic_bolt(hs=8, hh=5.4, sr=4.66, sh=37.5);
}

// A nut to fit the 3/8" size bolt.
module 3_8_inch_nut() {
  color("gray")
  generic_nut(hs=9.25, hh=7.8, ir=4.1);
}

// A washer to fit the 3/8" size bolt.
module 3_8_inch_washer() {
  color("gray")
  /* difference() { */
  /*   cylinder(r=11, h=1.5, center=true); */
  /*   cylinder(r=4.875, h=2.1, center=true); */
  /* } */
  generic_washer(ir=4.875, or=11, t=1.5);
}

// A socket to fit the 3/8" size bolt with room for an
// appropriate washer and variable length.
// er = the amount of extra radius around the head
// eh = the amount of extra height for the space around the head
module 3_8_inch_bolt_socket_loose(l=20, er=0, eh=0) {
  // NOTE: using slightly larger default head radius than the
  // radius of the 3/8" washer.
  generic_loose_socket(hr=(11.25 + er), hh=(9.5 + eh), sr=5, sh=l);
}



// 5/8" bolt/nut/washer.

// A nut to fit the 5/8" size bolt.
module 5_8_inch_nut() {
  color("gray")
  generic_nut(hs=14.5, hh=13.8, ir=6.825);
}

// A washer to fit the 5/8" size bolt.
module 5_8_inch_washer() {
  color("gray")
  generic_washer(ir=8.75, or=19.2, t=2);
}


// Test renders.

*m4bolt();
*m4bolt_socket_tight();
*m4bolt_socket_loose();
*m4nut();

*m5flat_head_machine_screw();

*m6flat_head_machine_screw();
*m6x35mm_flat_head_machine_screw();
*m6locknut();

2_56_round_head_screw();
*2_56_nut();
*2_56_nut_socket();
// This section is used for test printing of
// 2-56 nut sockets.
*translate([-14, 0, 0])
difference() {
  translate([-5, -5, 0])
    cube([10, 10, 5]);
  union() {
    translate([0, 0, 2.6])//5.01 - (1.8 / 2)])
      2_56_nut_socket(l=5);
  }
}


*4_40_round_head_screw();
*4_40_nut();
*%4_40_nut_socket();
// This section is used for test printing of
// 4-40 nut sockets.
*difference() {
  translate([-8, -8, 0])
    cube([16, 16, 8]);
  union() {
    translate([0, 0, 4.1])
      4_40_nut_socket(l=8);
  }
}


*6_32_round_head_screw();
*6_32_nut();
*%6_32_nut_socket();
// This section is used for test printing of
// 6-32 nut sockets.
*translate([17, 0, 0])
difference() {
  translate([-8, -8, 0])
    cube([16, 16, 8]);
  union() {
    translate([0, 0, 4.1])
      6_32_nut_socket(l=8);
  }
}


*10_32_round_head_screw();
*translate([0, 0, 3.5/2.0])
10_32_nut();
*%10_32_nut_socket();
// This section is used for test printing of
// 10-32 nut sockets.
*translate([17, 0, 0])
difference() {
  translate([-8.5, -8.5, 0])
    cube([17, 17, 8]);
  union() {
    translate([0, 0, 4.1])
      10_32_nut_socket(l=8);
  }
}

*%1_4_inch_bolt();
*%1_4_inch_nut_socket();
*1_4_inch_nut();
// This section is used for test printing of
// 1/4" nut sockets.
//translate([0, 0, 0])
*difference() {
  translate([0, 0, 0])
    cube([17, 17, 10]);
  union() {
    translate([8.5, 8.5, 5.01])
      1_4_inch_nut_socket(l=8);
  }
}

*5_8_inch_nut();

*5_8_inch_washer();
