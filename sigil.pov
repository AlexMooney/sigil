#include "colors.inc"
#include "stones.inc"

camera {
  // location <0, 17000, -9999>
  // look_at <0, 0, -3000>
  location <-244, 0, 0>
  look_at <0, 0, 800>
  sky <1, 0, 0>
  rotate <clock, 0, 0>
}

light_source {
  <0, 0, 1000> Gray50
  shadowless
}

light_source {
  <245, 0, 0> Gray50
  fade_distance 200
  fade_power 2
  shadowless
}

// Sigil
difference {
  torus {
    245, 75
    rotate -90*x
    pigment { DarkBrown }

  }
  cylinder {
    <0, 0, -100>,
    <0, 0, 100>,
    245
  }
  pigment { Brown }
  normal { bumps 0.2 scale 0.1 }
}

// The Spire
union {
  cone {
    <0, 0, -10000>, 5000
    <0, 0, -8000>, 1000
    texture { T_Stone25 scale 40 }
  }
  cone {
    <0, 0, -8000>, 1000
    <0, 0, -6000>, 100
    texture { T_Stone25 scale 40 }
  }
  cylinder {
    <0, 0, -7000>
    <0, 0, -250>
    100
    texture { T_Stone25 scale 40 }
  }
}

sky_sphere {
  pigment {
    gradient z
    color_map {
      [0.000 0.002 color rgb <1.0, 0.2, 0.0>
                   color rgb <1.0, 0.2, 0.0>]
      [0.002 0.200 color rgb <0.8, 0.1, 0.0>
                   color rgb <0.2, 0.2, 0.3>]
    }
    scale 2
    translate -1
  }
  pigment {
    bozo
    turbulence 0.65
    octaves 6
    omega 0.7
    lambda 2
    color_map {
      [0.0 0.1 color rgb <0.85, 0.85, 0.85>
               color rgb <0.75, 0.75, 0.75>]
      [0.1 0.5 color rgb <0.75, 0.75, 0.75>
               color rgbt <1, 1, 1, 1>]
      [0.5 1.0 color rgbt <1, 1, 1, 1>
               color rgbt <1, 1, 1, 1>]
    }
    scale <0.2, 0.5, 0.2>
  }
}

plane {
  z, -10000
  pigment { color Gray50 }
  finish { ambient .3 diffuse .7 }
  texture { T_Stone25 scale 4 }
}
