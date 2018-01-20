#include "colors.inc"
#include "stones.inc"

camera {
  //up        <0, 1, 0>
  //right     <0, 0, 1.33>
  right 4/3*x
  up z
  direction <0, 1, -0.5>
  translate <0, -9, 5>
  // location <0, -2.3, 5>
  // look_at <0, -2.5, -5>

  // rotate <180*clock, 0, 0>
  // translate <0, -9 + 12.189*clock, -5 + 5*clock>
  // fisheye
  // angle 360
  //location  <-2.439, 0, 0>
  //direction <0, 0, 1>
  //rotate    <180, 0, 0>
}

light_source {
  <0, -10+10*clock, 3> White
  fade_distance 200
  fade_power 2
  media_attenuation on
}

// Sigil
difference {
  torus {
    2.45, 0.75
    rotate -90*x
    pigment { Green }
    sturm
  }
  torus {
    2.44, 0.75
    rotate -90*x
    sturm
  }
  pigment { Brown }
}

// The Spire
union {
  cone {
    <0, 0, -100>, 50
    <0, 0, -80>, 10
    texture { T_Stone25 scale 40 }
  }
  cone {
    <0, 0, -80>, 10
    <0, 0, -60>, 1
    texture { T_Stone25 scale 40 }
  }
  cone {
    <0, 0, -60>, 1
    <0, 0, -3>, 0
    texture { T_Stone25 scale 40 }
  }
  plane {
    z, -100
    pigment { color Gray50 }
    finish { ambient .3 diffuse .7 }
    texture { T_Stone25 scale 4 }
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

fog {
  distance 10
  color rgb <0.1, 0.1, 0.8>
}
