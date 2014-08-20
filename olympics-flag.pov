// Initial olympics flag description obtained from:
// http://news.povray.org/povray.newusers/thread/%3Cweb.498de26469c1735e7c859cee0@news.povray.org%3E

#include "colors.inc"

camera {location <10,8,-8> look_at <4.5,2.5,0>}
light_source {<10,20,-25>, White}

background { Blue }

intersection {
  torus {1,0.08 rotate x*90 translate <2,3,0>}
  box {-0.001*z,<9,5,0.011>}
  pigment { Blue }
}
intersection {
  torus {1,0.08 rotate x*90 translate <4.5,3,0>}
  box {-0.002*z,<9,5,0.012>}
  pigment { Black }
}
intersection {
  torus {1,0.08 rotate x*90 translate <7,3,0>}
  box {-0.003*z,<9,5,0.013>}
  pigment { Red }
}
intersection {
  torus {1,0.08 rotate x*90 translate <3.25,2,0>}
  box {-0.004*z,<9,5,0.014>}
  pigment { Yellow }
}
intersection {
  torus {1,0.08 rotate x*90 translate <5.75,2,0>}
  box {-0.005*z,<9,5,0.015>}
  pigment { Green }
}
box {0,<9,5,0.01>
  pigment { White }
}

