#include "colors.inc"
#include "glass.inc"
#include "textures.inc"
#include "stones1.inc"
#include "transforms.inc"

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
# declare Window = union {        
    intersection {
        sphere {
            <7.5, 30, 0> 7.5
            scale <1,2,1>
            translate -33*y
        }
        box { <0, 30, 0>, <30, 50, 0.00000015> }
    }
    
    box { 0, <15, 30, 0.0001> }        
                   
    pigment { Blue }                   
    texture { NBoldglass }
}

object { Window  }

// cross
union {    
    box { <6, 5, 0>, <9, 30, -0.0002> }
    box { <2, 22, 0>, <13, 25, -0.0002> }    
    translate -0.0015*z
    pigment { Brown }
    texture { NBoldglass }
}

// light circle behind cross
intersection {
    sphere { <7.5, 23.5, 0> 7.5 }
    box { <0, 15, 0>, <30, 50, 0.00015> }
    pigment { Yellow }
    texture { NBoldglass }
    translate -0.001*z
}

// shine lines
#declare Line = box {
	<7.5, 23.5, 0>, <8, 50, -0.00002>
	pigment { Yellow }
	texture { NBoldglass }
}

intersection {
    object { Window translate -0.00002*z}
    
    union {
    	#declare lineAngle = 0;
    	
    	#while ( lineAngle <= 60 )
    	
    	    object { Line Rotate_Around_Trans( lineAngle*6*z, <7.5, 23.5, 0> ) }	    
    	    
    	    #declare lineAngle = lineAngle + 1;
    	#end	
    }
}