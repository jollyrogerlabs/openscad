// -*-C-*-
// Model of Makerbot Replicator build plate.
//
// Drop this model into test renders to determine the size
// of the print relative to the size of the build plate
// on the Makerbot Replicator (not Replicator2).
//
// Copyright 2013, Brian Davis
//
// License: LGPL 2.1 or later

module makerbot_replicator_build_plate() {
  // Center, but render just below the X-Y plane.
  translate([-114, -75, -1])
    cube([228, 150, 1]);
};
