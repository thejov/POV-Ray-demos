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
#declare MainRadius = 0.050;
#declare DiagonalsRadius = 0.050;
#declare CylinderHalfWidth = 1.00 - MainRadius;
#declare Height = 2.00;

#declare HorizontalCylinder = cylinder {
    <-CylinderHalfWidth,0,0>, <CylinderHalfWidth,0,0>, MainRadius
    translate <0,0,-CylinderHalfWidth>
}

#declare HorizontalSquare = union {
    object { HorizontalCylinder rotate<0,0*90,0> }
    object { HorizontalCylinder rotate<0,1*90,0> }
    object { HorizontalCylinder rotate<0,2*90,0> }
    object { HorizontalCylinder rotate<0,3*90,0> }
}

#declare VerticalCylinders = union {
    // vertical
    cylinder {
        <0,0,0>,<0,Height,0>,MainRadius
        translate<-CylinderHalfWidth,0,-CylinderHalfWidth>
    }
    
    // diagonal
    cylinder {
        <-CylinderHalfWidth,0,0>, <CylinderHalfWidth,Height,0>, DiagonalsRadius
        translate<0,0,-CylinderHalfWidth + DiagonalsRadius>
    }
    cylinder {
        <CylinderHalfWidth,0,0>,<-CylinderHalfWidth,Height,0>,DiagonalsRadius
        translate<0,0,-CylinderHalfWidth - DiagonalsRadius>
    }
}

#declare PylonBox = union {
    object { HorizontalSquare }   
    object { VerticalCylinders rotate <0,0*90,0> }
    object { VerticalCylinders rotate <0,1*90,0> }
    object { VerticalCylinders rotate <0,2*90,0> }
    object { VerticalCylinders rotate <0,3*90,0> }
    translate <0,MainRadius,0>
}

#declare Nr = 10;
#declare EndNr = 20;

#declare BaseStation = union {
	#while (Nr < EndNr)
		object {
			PylonBox
			translate <-10, Nr* Height, 15>
		}
 		#declare Nr = Nr + 1;
	#end

	object {
		HorizontalSquare
		translate <-10, Nr * Height + MainRadius, 15>
	}
	translate <0,0.05,0>
}

object { BaseStation }