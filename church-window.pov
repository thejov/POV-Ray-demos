#include "colors.inc"
#include "glass.inc"
#include "textures.inc"
#include "stones1.inc"

camera {
	location <25, 30, -55>
	look_at <15, 15, 0>
}

light_source { <0,30,-10> White }

union {
    plane { x, -15 }    
    plane { z, 0.1 }
    texture {
        T_Grnt7
        scale 5
    }
}

plane {
    y, -3    

    texture {        
        T_Grnt15
        scale 8
    }
}

// window
union {    
    
    // window background
    intersection {
        sphere {
            <7.5, 30, 0> 7.5
            scale <1,2,1>
            translate -33*y
        }
        box { <0, 30, 0>, <30, 50, 0.00000015> }
    }
    
    box { 0, <15, 30, 0> }        
    
    pigment {
        checker
            color Cyan
            color Blue
    }                  
    texture { NBoldglass }
}

// cross
union {    
    box { <6, 5, 0>, <9, 30, -0.0002> }
    box { <2, 22, 0>, <13, 25, -0.0002> }    
    translate -0.0015*z
    pigment { Brown }
    texture { NBoldglass }
}

// hover behind cross
intersection {
    sphere { <7.5, 23.5, 0> 7.5 }
    box { <0, 15, 0>, <30, 50, 0.00015> }
    pigment { Yellow }
    texture { NBoldglass }
    translate -0.001*z
}