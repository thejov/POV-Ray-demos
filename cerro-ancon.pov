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
        pigment { color Green }
        normal { granite 3 scale 4}
    }
}

// sky and ground fog are a modified version of the following example:
// http://www.f-lohmueller.de/pov_tut/backgrnd/p_sky1.htm

// sky
plane {
	<0,1,0>,1 hollow
	
      texture {
      	pigment {
      		color rgb<0.1,0.3,0.75>*0.7
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
	pigment { color Green }
	finish { specular 0.7 roughness 0.03 }
      normal { granite 3 scale 4}
}

#declare FlagInner = polygon {
	5, <0, 0>, <0, 1>, <1, 1>, <1, 0>, <0, 0>
	pigment { White }
	normal {
		gradient x
		phase clock
		scale <0.2, 1, 1>
		sine_wave
	}
	
	scale <3, 2, 1>
	translate <-1.5, 0, 0>
}

// the flag is a modified verion of the following example:
// http://www.povray.org/documentation/view/3.7.0/111/
#declare Flag = union {
	object { FlagInner }
	object { FlagInner scale 0.5 translate -0.00001 pigment { Red } }
	
	// flagpole
	cylinder {
		<-1.5, -4, 0>, <-1.5, 2.25, 0>, 0.05
		texture { Silver_Metal }
	}
	
	// polecap
	sphere {
		<-1.5, 2.25, 0>, 0.1
		texture { Silver_Metal }
	}
	
	translate <0,12,-5>
	scale 3
}

union {
	object { Hill scale 1.5 } // the cerra ancon hill
	object { Flag }
	translate 20*z
}

// other hill in front
object { Hill
	translate <-30, 0, -50>
	pigment { DarkGreen }
	scale <1.5,0,0>
}