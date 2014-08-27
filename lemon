#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"
 
camera {
    location <0,0,-50>
    look_at <-10,0,0>
}
 
light_source { <5,50,-50> color White }
 
union {
    sphere {
        <0, 1, 0> 10
        pigment { color Yellow }
        scale <1.8,1.3,1.5>
        finish { specular 0.7 roughness 0.03 }
        normal { bumps 0.60 scale 0.20}
   }
   
   sphere {
       <-18,1,0> 3
       pigment { color Yellow }
       scale <1,1.3,1>
       normal { bumps 0.50 scale 0.20}
   }
   
   sphere {
       <18,1,0> 1.5
       pigment { color Yellow }
       scale <1,1.3,1>
       normal { bumps 0.50 scale 0.20}
   }
   
   rotate <0,0,20>
   translate 5*y
   
}
 
plane { y, -15 pigment { checker Black, White } }
