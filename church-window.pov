#include "colors.inc"
#include "glass.inc"
#include "textures.inc"
#include "stones1.inc"
#include "transforms.inc"

camera {
	location <70, 30, -62>
	look_at <25, 15, 0>
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


#declare ChurchWindow = union {

    // window
    #declare Window = union {        
        intersection {
            sphere {
                <7.5, 30, 0> 7.5
                scale <1,2,1>
                translate -33*y
            }
            box { <0, 30, 0>, <30, 50, 0.00000015> }
        }
        
        box { 0, <15, 30, 0.0001> }                                         
        
        pigment { crackle scale 1.5 turbulence 0.35
         	color_map {
         		[0.00 Black]
	            [0.12 Blue]
      	        [0.30 Navy]
         	}
         	scale 0.2
    	 } 
    }
    
    object { Window  }
    
    // cross
    union {    
        box { <6, 5, 0>, <9, 30, -0.0002> }
        box { <2, 22, 0>, <13, 25, -0.0002> }    
        translate -0.0015*z
        pigment { Brown }
        
        pigment { crackle scale 1.5 turbulence 0.35
         	color_map {
         		[0.00 Black]
             	[0.08 Black]
	            [0.32 DarkBrown]
      	        [1.00 VeryDarkBrown]
         	}
         	scale 0.2
    	 } 
    }
    
    // light circle behind cross
    intersection {
        sphere { <7.5, 23.5, 0> 7.5 }
        box { <0, 15, 0>, <30, 50, 0.00015> }
        translate -0.001*z
        
        pigment { crackle scale 1.5 turbulence 0.35
         	color_map {
         		[0.00 Black]
	            [0.12 Yellow]
      	        [0.60 Gold]
         	}
         	scale 0.2
    	 } 
    }
    
    // shine lines
    #declare Line = box {
    	<7.5, 23.5, 0>, <8, 50, -0.00002>
    	    pigment { crackle scale 1.5 turbulence 0.35
         	color_map {
         		[0.00 Black]
	            [0.12 Yellow]
      	        [0.60 Gold]
         	}
         	scale 0.2
    	 }
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
    
    #declare RedWindow = object { Window pigment { Red } translate <-1.5, -1.5, 0.001> scale <1.2,1.2,1.2> }
    object { RedWindow 
        pigment { crackle scale 1.5 turbulence 0.35
         	color_map {
         		[0.00 Black]
             	[0.08 Black]
	            [0.32 Red]
          	    [1.00 Scarlet]
         	}
         	scale 0.6
    	} 
   }   
}

#declare i = 0;

#while ( i <= 3 )
    
    object { ChurchWindow translate i*25*x texture { pigment { filter 0.7 } } }
     
    #declare i = i + 1;
    
#end