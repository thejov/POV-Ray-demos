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
            translate -35*y    
        }
        box { <0, 30, 0>, <30, 50, 0.00015> }
    }
    
    box { 0, <15, 30, 0.01> }        
    
    texture { NBoldglass }
    pigment { Blue }   
    
    normal {
        pigment_pattern{
            crackle              
            scale 0.6
        }
        2
     }
     finish { ambient 0.05 diffuse 0.95 phong 1 }       
    
}


// cross
merge {    
    box { <6, 5, 0>, <9, 40, 0.02> }
    box { <2, 22, 0>, <13, 25, 0.02> }    
    
    pigment { Brown }
    
    normal {
        pigment_pattern{
            crackle              
            scale 0.6
        }
        2
     }
     finish { ambient 0.05 diffuse 0.95 phong 1 }
}