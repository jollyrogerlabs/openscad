// -*-C-*-
// Model for rounded beam.
//
// Copyright 2013, Brian Davis
//
// License: LGPL 2.1 or later

// A beam (AKA rectangle/cube) with rounded edges.
// width is the distance along the x-axis
// length is the distance along the y-axis
// height is the distance along the z-axis
module roundedbeam(width=10, length=10, height=100) {
  hull() {
    // base
    sphere(r=1);
    translate([width, 0, 0]) sphere(r=1);
    translate([0, length, 0]) sphere(r=1);
    translate([width, length, 0]) sphere(r=1);
    // top
    translate([0, 0, height]) sphere(r=1);
    translate([width, 0, height]) sphere(r=1);
    translate([0, length, height]) sphere(r=1);
    translate([width, length, height]) sphere(r=1);
  }
};

// A rounded beam centered on [0, 0, 0].
// width is the distance along the x-axis.
// length is the distance along the y-axis.
// height is the distance along the z-axis.
module c_roundedbeam(width, length, height) {
  translate([-width / 2, -length / 2, -height / 2])
    roundedbeam(width=width, length=length, height=height);
}
