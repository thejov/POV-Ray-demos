#include "colors.inc"        
#include "colors.inc"

camera {location <10,8,-8> look_at <4.5,2.5,0>}
light_source {<10,20,-25>, White}

background { Blue }

intersection {
  torus {0.97,0.08 rotate -x*90 translate <2,3,0>}
  box {-0.000001*z,<9,5,0.010001>}
  pigment { Blue }
}
intersection {
  torus {0.97,0.08 rotate -x*90 translate <4.5,3,0>}
  box {-0.000002*z,<9,5,0.010002>}
  pigment { Black }
}
intersection {
  torus {0.97,0.08 rotate -x*90 translate <7,3,0>}
  box {-0.000003*z,<9,5,0.010003>}
  pigment { Red }
}
intersection {
  torus {0.97,0.08 rotate -x*90 translate <3.25,2,0>}
  box {-0.000004*z,<9,5,0.010004>}
  pigment { Yellow }
}
intersection {
  torus {0.97,0.08 rotate -x*90 translate <5.75,2,0>}
  box {-0.000005*z,<9,5,0.010005>}
  pigment { Green }
}
box {0,<9,5,0.01>
  pigment { White }
}

