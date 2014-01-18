// -*-C-*-
// Model of a hexagon.
//
// Copyright 2013, Brian Davis
//
// License: LGPL 2.1 or later

// sine of 60 degrees
SIN_60=0.866025403784439;

// A 3D hexagon with height h and side length s.
//
// NOTE: the default values s=4, h=3 are for an M4 bolt.
//
// See http://www.rdwarf.com/lerickson/hex/
module hexagon(s=4, h=3) {
  A=0.5 * s;
  B=SIN_60 * s;
  C=s;

  translate([-s, -s * SIN_60, -h / 2])
    linear_extrude(height=h)
      polygon([[0, B], [A, 0],
	       [A + C, 0], [2 * C, B],
	       [A + C, 2 * B], [A, 2 * B]],
	      paths=[[0, 1, 2, 3, 4, 5]]);
}

// Test renders.
$fn=0;
$fa=0.01;
$fs=0.9;

hexagon();
