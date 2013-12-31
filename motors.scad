// -*-C-*-
// Modules for various motors.
//
// Copyright 2013, Brian Davis
//
// License: LGPL 2.1 or later

$fn=0;
$fa=0.01;
$fs=0.8;

/*
 * This is a generic motor unit made from yellow injection molded
 * plastic containing a gearbox and two axle attachment points.  A small
 * DC motor is attached to the body and held in place via a strap.
 *
 * The gearbox on this motor projects directly back from the motor,
 * unlike some similar models in which the gearbox is partially
 * perpindicular.
 *
 * Note: details of the motor attachment mechanism are not modeled
 * precisely, and two cylindrical slots for connections are also not
 * present.
 *
 * Totals:
 * width (x-axis) = 37mm
 * length (y-axis) = 71mm 
 * height (z-axis) = 22.5mm
 */
module yellow_dc_gearmotor_straight() {
  // Center the model.
  translate([-9.5, -33.5, -11.25])
  union() {
    difference() {
      // Square portion of motor body.
      cube([19, 37.75, 22.5]);
      union() {
        // Top mounting through-hole.
        translate([-0.5, 32.25, 20])
          rotate([0, 90, 0])
            cylinder(h=20, r=1.5);
        // Bottom mounting through-hole.
        translate([-0.5, 32.25, 2.5])
          rotate([0, 90, 0])
            cylinder(h=20, r=1.5);
      }
    }
    // Cylindrical portion of motor body.
    difference() {
      difference() {
        translate([9.5, 49.5, 11.25])
          rotate([90, 0, 0])
            cylinder(h=11.75, r=11.25);
        translate([-5, 37.5, 0])
          cube([5, 12.5, 23]);
      }
      translate([19, 37.5, 0])
        cube([5, 12.5, 23]);
    }
    difference() {
      difference() {
        // Motor (note that the top part is actually white).
        color("grey")
        translate([9.5, 63.5, 11.25])
          rotate([90, 0, 0])
            cylinder(h=14, r=10);
        translate([-5, 49, 0])
          cube([5, 15, 23]);
      }
      translate([19, 49, 0])
        cube([5, 15, 23]);
    }
    // Rubber strap holding the motor in place.
    color("grey")
    translate([-0.5, 39.75, 7])
      cube([20, 24, 8.25]);
    // Tabs holding the rubber strap in place.
    translate([-1.75, 44, 8.45])
      cube([22.4, 2.5, 5]);
    // Small portion of the motor sticking out past the strap.
    color("white")
    translate([9.5, 65, 11.25])
      rotate([90, 0, 0])
      cylinder(h=1, r=5);
    // Tip of the motor shaft.
    color("grey")
    translate([9.5, 66, 11.25])
      rotate([90, 0, 0])
      cylinder(h=1, r=0.5);
    // Motor electrical connection points (poorly modeled, actually
    // small copper tabs).
    color("gold")
    translate([17.5, 60, 3.75])
      cube([2, 3, 15]);
    // Rear connection point tab with round hole.
    difference() {
      translate([8, -5, 9])
        cube([3, 5, 5]);
      translate([7.75, -2.5, 11.5])
        rotate([0, 90, 0])
          cylinder(h=3.5, r=1.5);
    }
    // Random round protrusion on side opposite to motor electrical
    // connection point.
    translate([-2, 23.25, 11.5])
      rotate([0, 90, 0])
        cylinder(h=2, r=2);
    // Axles (actually not fully round, but close enough).
    color("white")
    translate([-9, 12.6, 11.5])
      rotate([0, 90, 0])
        cylinder(h=37, r=2.75);
  }
}

/*
 * This is a Denso left side power window motor.  Some details are not
 * modeled precisely.
 */
module denso_power_window_motor_L() {
  translate([0, 0, 117.5])
    cylinder(r=2, h=10, center=true);
  color("brown")
  translate([-30, 30, 85])
    rotate([0, 90, 0])
    cylinder(r=4.5, h=35, center=true);
  color("gray")
  union() {
    hull() {
      translate([0, 20, 122.5])
        rotate([0, 90, 0])
          cylinder(r=4.5, h=10, center=true);
      translate([0, 30, 85])
        rotate([0, 90, 0])
          cylinder(r=25 / 2, h=10, center=true);
    }
    hull() {
      translate([0, 65, 102.5])
        rotate([0, 90, 0])
	cylinder(r=4.5, h=10, center=true);
      translate([0, 30, 85])
        rotate([0, 90, 0])
	cylinder(r=25 / 2, h=10, center=true);
    }
    hull() {
      translate([6, 10, 115])
        rotate([0, 90, 0])
          cylinder(r=4.5, h=14, center=true);
      translate([6, 30, 85])
        rotate([0, 90, 0])
          cylinder(r=25 / 2, h=14, center=true);
    }
    hull() {
      translate([6, 47.5, 52.5])
        rotate([0, 90, 0])
          cylinder(r=4.5, h=14, center=true);
      translate([6, 30, 85])
        rotate([0, 90, 0])
          cylinder(r=25 / 2, h=14, center=true);
    }
    translate([0, 30, 85])
      rotate([0, 90, 0])
        cylinder(r=30, h=27.5, center=true);
    translate([0, 0, 76.5])
      cylinder(r=13.8 / 2, h=72, center=true);
    translate([0, 0, 55.5])
      cylinder(r=14.8 / 2, h=30, center=true);
    translate([0, 0, 46.5])
      cylinder(r=15.8 / 2, h=12, center=true);
    translate([0, 0, 55])
      difference() {
        cylinder(r=20, h=29, center=true);
        union() {
          translate([-(32 / 2) - 20, 0, 0])
            cube([40, 40, 30], center=true);
          translate([(32 / 2) + 20, 0, 0])
            cube([40, 40, 30], center=true);
          translate([-(23.8 / 2) - 15, 10, 0])
            cube([40, 40, 30], center=true);
          translate([-(23.8 / 2) - 15, -14.9, 12])
            cube([40, 10, 30], center=true);
        }
      }
    hull() {
      translate([18, 16, 40])
        cylinder(r=4.5, h=5, center=true);
      translate([15, 13, 40])
        cube([5, 10, 5], center=true);
    }
    hull() {
      translate([-18, -16, 40])
        cylinder(r=4.5, h=5, center=true);
      translate([-15, -13, 40])
        cube([5, 10, 5], center=true);
    }
    translate([0, 0, 39.5])
      difference() {
        cylinder(r=45.8 / 2, h=2, center=true);
        union() {
          translate([-(37 / 2) - 20, 0, 0])
            cube([40, 40, 3], center=true);
          translate([(37 / 2) + 20, 0, 0])
            cube([40, 40, 3], center=true);
        }
      }
  }
  color("black")
  union() {
    translate([0, 0, 37.5])
      difference() {
        cylinder(r=45.8 / 2, h=2, center=true);
        union() {
          translate([-(37 / 2) - 20, 0, 0])
            cube([40, 40, 74], center=true);
          translate([(37 / 2) + 20, 0, 0])
            cube([40, 40, 3], center=true);
        }
      }
    difference() {
      cylinder(r=43.8 / 2, h=73, center=true);
      union() {
        translate([-(35 / 2) - 20, 0, 0])
          cube([40, 40, 74], center=true);
        translate([(35 / 2) + 20, 0, 0])
          cube([40, 40, 74], center=true);
      }
    }
    translate([0, 0, -54.5])
      cylinder(r2=30 / 2, r1=27.5 / 2, h=18);
    translate([0, 0, -60.5])
      cylinder(r2=16.5 / 2, r1=10 / 2, h=6);
  }
}

/*
 * This is an IG32 gear motor from superdroidrobots.com which has been
 * attached to a square aluminum plate.
 */
module ig32_gear_motor_with_sprocket_and_plate() {
  // Shaft + sprocket
  // FIXME extremely simplified
  color("gray")
  union() {
    translate([0, 0, 57])
      cylinder(r=(11.2 / 2.0), h=8.5, center=true);
    translate([0, 0, 62.75])
      cylinder(r=10.4, h=3, center=true);
  }
  // Mounting plate.
  color("silver")
  translate([0, 0, 51])
  difference() {
    cube([44.4, 44.4, 3.75], center=true);
    union() {
      for (x_mult = [-1 : 2 : 1]) {
        for (y_mult = [-1 : 2 : 1]) {
          translate([x_mult * ((44.4 / 2.0) - 4),
                     y_mult * ((44.4 / 2.0) - 4), 0])
            cylinder(r=2, h=5, center=true);
        }
      }
    }
  }
  // Main motor body
  color("silver")
  translate([0, 0, 46.25])
    cylinder(r=16, h=6, center=true);
  color("black")
  union() {
    translate([0, 0, 42.25])
      cylinder(r1=(35 / 2), r2=16, h=1);
    translate([0, 0, 33.75])
      cylinder(r=(35 / 2), h=17, center=true);
    translate([0, 0, 24.25])
      cylinder(r1=16, r2=(35 / 2), h=1);
  }
  color("silver")
  translate([0, 0, 22])
    cylinder(r=16, h=4.5, center=true);
  color("gray")
  translate([0, 0, 17.5])
    cylinder(r=(35.7 / 2.0), h=4.5, center=true);
  color("gray")
  translate([0, 0, -1.725])
    cylinder(r=(37 / 2.0), h=34, center=true);
  color("gray")
  translate([0, 0, -26.75])
    cylinder(r=(35.7 / 2.0), h=16, center=true);
  color("white")
  translate([0, 0, -36])
    cylinder(r=(35.7 / 2.0), h=2.5, center=true);
  color("black")
  translate([0, 0, -51.25])
    cylinder(r1=(34.5 / 2.0), r2=(35 / 2), h=14);
}

/*
 * This is a Unite model MY1016 motor for electric scooter or go-kart.
 */
module unite_my1016() {
  color("gray")
  union() {
    translate([-44, 0, 55])
      rotate([0, 90, 0])
        cylinder(r=14.5, h=5, center=true);
    translate([-36, 0, 55])
      rotate([0, 90, 0])
        cylinder(r=47.5, h=11, center=true);
    for (x_mult = [-1 : 2 : 1]) {
      translate([x_mult * 29, 0, 55])
        rotate([0, 90, 0])
          cylinder(r=50.5, h=3, center=true);
    }
    translate([32.5, 0, 55])
      rotate([0, 90, 0])
        cylinder(r=47.5, h=4, center=true);
  }
  color("black")
  union() {
    // Central main body.
    translate([0, 0, 55])
      rotate([0, 90, 0])
        cylinder(r=51, h=55, center=true);
    // Shaft
    translate([43.5, 0, 55])
      rotate([0, 90, 0])
        cylinder(r=5, h=26, center=true);
    // Sprocket
    // NOTE: diameter is correct but teeth are not shown.
    translate([47, 0, 55])
      rotate([0, 90, 0])
        cylinder(r=12, h=3, center=true);
    // Mounts.
    for (y_mult = [-1 : 2 : 1]) {
      difference() {
        translate([7, y_mult * 47.5, 2])
          cube([55, 13, 4], center=true);
        union() {
          for (x_mult = [-1 : 2 : 1]) {
            translate([7 + (x_mult * 20.5), y_mult * 47.25, 2])
              cylinder(r=3.25, h=5.5, center=true);
          }
        }
      }
      hull() {
        translate([7, y_mult * 40.5, 2])
          cube([55, 1, 4], center=true);
        translate([7, y_mult * 32.5, 2])
          cube([32, 9, 4], center=true);
      }
      translate([7, y_mult * 25.5, 5.5])
        rotate([y_mult * -45, 0, 0])
          cube([32, 12, 4], center=true);
    }
  }
}


/*
 * This is a Unite model MY6812 motor for electric scooter or go-kart.
 */
module unite_my6812() {
  color("gray")
  union() {
    // Shaft + sprocket end.
    translate([40.25, 0, 0])
      rotate([0, 90, 0])
        cylinder(r=34, h=9.5, center=true);
    // Rear end.
    translate([-40, 0, 0])
      union() {
        rotate([0, 90, 0])
          cylinder(r=34, h=9, center=true);
        translate([-9.75, 0, 0])
          rotate([0, 90, 0])
            cylinder(r=15, h=10.5, center=true);
    }
  }
  color("black")
  union() {
    // Central main body.
    translate([0, 0, 0])
      rotate([0, 90, 0])
        cylinder(r=34, h=71, center=true);
    // Shaft + Sprocket.
    translate([57.5, 0, 0])
      union() {
        // Shaft
        rotate([0, 90, 0])
          cylinder(r=6, h=25, center=true);
        // Sprocket
        // NOTE: diameter is correct but teeth are not shown.
        translate([1, 0, 0])
          rotate([0, 90, 0])
            cylinder(r=12, h=2.75, center=true);
      }
  }
}

// Test renders.

yellow_dc_gearmotor_straight();

*denso_power_window_motor_L();

*ig32_gear_motor_with_sprocket_and_plate();

// Unite MY1016 with measurements.
*union() {
  unite_my1016();
  color("green")
  union() {
    // Lengths (i.e. X-axis distances).
    // Length between the extreme edges of the mounts.
    translate([7, 54, -1])
      cube([55, 1, 2], center=true);
    // Length between the outer edges of the mount holes.
    translate([7, 46.5, -1])
      cube([48, 1, 2], center=true);
    // Length between the inner edges of the mount holes.
    translate([7, 47.5, -1])
      cube([35, 1, 2], center=true);
  }
  color("blue")
  union() {
    // Widths (i.e. Y-axis distances).
    // Width between the extreme edges of the mounts.
    translate([-20, 0, -1])
      cube([1, 108, 2], center=true);
    // Width between the outer edges of the mount holes.
    translate([-13, 0, -1])
      cube([1, 101, 2], center=true);
    // Width between the inner edges of the mount holes.
    translate([-14, 0, -1])
      cube([1, 88, 2], center=true);
  }
}

// Unite MY6812 with measurements.
*union() {
  unite_my6812();
  color("green")
  union() {
    // Lengths (i.e. X-axis distances).
    // Full body length
    translate([0.25, 34, 0])
      cube([89.5, 1, 1], center=true);
    // Length between shaft base and sprocket.
    translate([51, 6, 0])
      cube([12, 1, 1], center=true);
    // Length between sprocket and shaft end.
    translate([65, 6, 0])
      cube([10, 1, 1], center=true);
  }
}
