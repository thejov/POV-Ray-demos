#include "colors.inc"
#include "textures.inc"
#include "glass_old.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"

// front view
#declare Camera_0 = camera {
	angle 75
	location <0.0, 1.0, -3.0>
	right x * image_width / image_height
	look_at <0.0, 1.0, 0.0>
}

// diagonal view
#declare Camera_1 = camera {
	angle 90
	location <2.0, 2.5, -3.0>
	right x * image_width / image_height
	look_at <0.0, 1.0, 0.0>
}	

// right side view
#declare Camera_2 = camera {
	angle 90
	location <3.0, 1.0, 0.0>
	right x * image_width / image_height
	look_at <0.0, 1.0, 0.0>
}

// top view
#declare Camera_3 = camera {
	angle 90
	location <0.0, 3.0, -0.001>
	right x * image_width / image_height
	look_at <0.0, 1.0, 0.0>
}

camera { Camera_1 }

light_source {
	0*x
	color rgb <1, 1, 1>
	spotlight
	translate <40, 80, -40>
	point_at <0, 0, 0>
	radius 1
	tightness 50
	falloff 3
}

sky_sphere {
	pigment { color rgb <0.0, 0.0, 0.1> }
}

plane { 
	<0, 1, 0>, 0
	texture { 
		pigment { checker color White color Black }
		finish { phong 0.1 }
	}
}

#declare Ball = sphere {
	<0, 0, 0>, 0.3
	scale <1, 1, 1>
	rotate <0, 0, 0>
	translate <0, 0.5, 0>
	material {
		texture { Ruby_Glass }
		interior { I_Glass }
	}
}

union {
	#declare NrX = 0;
	#declare EndNrX = 5;
	
	#while ( NrX <= 5 )
	
	    #declare NrZ = 0;
	    #declare EndNrZ = 6;

	    #while ( NrZ < EndNrZ )
	        
	        object { Ball translate < NrX * 0.75, NrX * 0.2 + NrZ * 0.3, NrZ * 0.75 > }
	        #declare NrZ = NrZ + 1;
	    #end
	    
	    #declare NrX = NrX + 1;
	#end
	
	rotate <0, 0, 0>
	translate <-3, 0, -1.5>
}