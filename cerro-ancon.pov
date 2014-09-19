// The Cerro Ancon hill in Panama City
// http://imgur.com/yi0g8zq

#include "colors.inc"
#include "textures.inc"
#include "transforms.inc"

camera {
	location <20, 30, -100>
	look_at <25, 15, 0>
}

light_source { <20,60,-30> Grey }

// ground
plane {
    y, 0
    texture {        
        pigment { color DarkGreen }
        normal { granite 3 scale 4}
    }
}

// sky and ground fog are a slightly modified version of the following example:
// http://www.f-lohmueller.de/pov_tut/backgrnd/p_sky1.htm

// sky
plane {
	<0,1,0>,1 hollow
	
      texture {
      	pigment {
      		color rgb <0.1,0.3,0.75>*0.7
      	}
      	
      	#if (version = 3.7 )  finish { emission 1 diffuse 0 }
      	#else finish { ambient 1 diffuse 0 }
      	#end
      }

	texture {
		pigment { bozo turbulence 0.75
			octaves 6  omega 0.7 lambda 2
			color_map {
				[0.0  color rgb <0.95, 0.95, 0.95> ]
				[0.05  color rgb <1, 1, 1>*1.25 ]
				[0.15 color rgb <0.85, 0.85, 0.85> ]
				[0.55 color rgbt <1, 1, 1, 1>*1 ]
				[1.0 color rgbt <1, 1, 1, 1>*1 ]
			}
			
			translate < 3, 0,-1>
			scale <0.3, 0.4, 0.2>*3
		}
		#if ( version = 3.7 )  finish { emission 1 diffuse 0 }
		#else finish { ambient 1 diffuse 0 }
		#end
	}
	
	scale 10000
}

// ground fog at the horizon
fog {
	fog_type   2
	distance   1000
	White
	fog_offset 0.1
	fog_alt    20
	turbulence 1.8
}

#declare Hill = cone {
	<15,-10,0>, 50, <10,30,0>, 5
	pigment { color DarkGreen }
	finish { specular 0.7 roughness 0.03 }
    normal { granite 5 scale 4 }
}

#declare FlagInner = polygon {
	5, <0, 0>, <0, 1>, <1, 1>, <1, 0>, <0, 0>
	pigment { White }	
	
	scale <3, 2, 1>
	translate <-1.5, 0, 0>							
}

#declare SmallFlagInner = object { FlagInner
    scale 0.5
    translate <-0.7, 0, -0.00001>
    normal {
		gradient x
		phase clock
		scale <1.5, 1, 50>
		sine_wave
	}            
}

#declare PanamaFlag = union {
    object { FlagInner }
	object { SmallFlagInner pigment { Blue } }
	object { SmallFlagInner translate <1.5, 1, 0> pigment { Red } }
	
	object { SmallFlagInner
	    pigment {
            Star_Ptrn(0.25,5,2)
            color_map { [ 0, White ] [ 1, Blue ] }
            translate <0.7, 0.5, 0>
        }
        translate 1*y
    }
    
    object { SmallFlagInner
	    pigment {
            Star_Ptrn(0.25,5,2)
            color_map { [ 0, White ] [ 1, Red ] }
            translate <0.7, 0.5, 0>
        }
        translate 1.5*x
    }
}

#declare FlagPole = union {
    // flagpole
	cylinder { <-1.5, -4, 0>, <-1.5, 2, 0>, 0.08 }
	
	// polecap
	sphere { <-1.5, 2, 0>, 0.14	}
	
    pigment { Gray20 }	
}

#declare FlagWithPole = union {
	object { PanamaFlag
	    scale 0.8
	    translate <-0.3, 0.3>	    
	}		
	
	object { FlagPole }
	
	translate <1.5,14,0>
	scale 3
}

union {
	object { Hill scale 1.5 } // the cerra ancon hill
	object { FlagWithPole }
	translate 20*z
}

light_source { <0,60,-30> White spotlight point_at <-10,1,0> }

// other hill in front
object { Hill
	translate <-30, 0, -50>
	pigment { Gray15 }
	scale <1.5,0,0>
}

// BaseStation constructed using the pylon example at:
// http://www.f-lohmueller.de/pov_tut/x_sam/tec_700e.htm

//--------------------- Dimensions -------
#declare R1 = 0.050; // main radius
#declare R2 = 0.050; // diagonals radius
#declare W = 1.00-R1; // half width(outline!)
#declare H = 2.00; // height

//--------------------- horizontal frame
#macro Square_Q(R1_, W_ )
	union {
		 cylinder { <-W_,0,0>,<W_,0,0>,R1_ translate<0,0,-W_> }
		 sphere { <0,0,0>,R1_ translate <W,0,-W_> }
	}
#end

#macro Square (R10, W0)
	union {
		 object { Square_Q(R10, W0) rotate<0,0*90,0> }
		 object { Square_Q(R10, W0) rotate<0,1*90,0> }
		 object { Square_Q(R10, W0) rotate<0,2*90,0> }
		 object { Square_Q(R10, W0) rotate<0,3*90,0> }
     }
#end
     
//-------------------- vertical elements:
#macro V_Element (R10, R20, W0, H0)
	union {
		 cylinder { <0,0,0>,<0,H0,0>,R10 translate<-W0,0,-W0> }
		 // diagonal:
		 cylinder { <-W0,0,0>,<W0,H0,0>,R20 translate<0,0,-W0+R20> }
		 cylinder { <W0,0,0>,<-W0,H0,0>,R20 translate<0,0,-W0-R20> }
	   }
#end

#macro Element_4 (R11, R21, W1, H1)
	union {
		object { Square (R11, W1) }
		 //vertical:
		object { V_Element(R11,R21,W1,H1) rotate <0,0*90,0> }
		object { V_Element(R11,R21,W1,H1) rotate <0,1*90,0> }
		object { V_Element(R11,R21,W1,H1) rotate <0,2*90,0> }
		object { V_Element(R11,R21,W1,H1) rotate <0,3*90,0> }
		translate <0,R1,0>
	}
#end

// Tower
#declare Nr = 10;
#declare EndNr = 20;

#declare BaseStation = union {
	#while (Nr < EndNr)
		object {
			Element_4 (R1, R2, W, H)
			translate <-10,Nr*H,15>
		}
 		#declare Nr = Nr + 1;
	#end

	object {
		Square (R1, W)
		translate <-10,Nr*H+R1,15>
	}
	translate <0,0.05,0>
}

object { BaseStation }
