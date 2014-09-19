#include "colors.inc"
#include "transforms.inc"

camera {
	angle 10
	location <60, 50, -250>
	look_at <10, 2, 0>	
}

light_source {
	<10, 15, -50>
	color White
}

lathe {
	linear_spline
	6,
	<5, 0>, <3, 1>, <3, 2>, <6, 3>, <5, 5>, <0, 10>
	pigment { Green }	
	finish {
		ambient 0.3
		phong 0.75
	}
	translate <10, 0, -10>
}

lathe {
	linear_spline
	10,
	<0, 0>, <1, 1>, <1, 2>, <3, 3>, <3, 5>, <1, 6>, <1, 8>, <3, 9>, <5, 10>, <0,12>
	pigment { Gold }	
	finish {
		ambient 0.3
		phong 0.75
	}
	translate <25, 0, -30>
}

lathe {
	quadratic_spline
	6,
	<5, 0>, <3, 1>, <3, 2>, <6, 3>, <5, 5>, <3, 10>
	pigment { Scarlet }	
	finish {
		ambient 0.3
		phong 0.75
	}
	translate <10, 0, 30>
}

lathe {
	bezier_spline
	4,
	<5, 0>, <3, 1>, <3, 2>, <6, 3>
	pigment { Navy }	
	finish {
		ambient 0.3
		phong 0.75
	}
	translate <25, 0, 30>
}
 
 
union { 
	lathe {
		linear_spline
		19,
		<2, 0>, <2, 2.8>, <3, 3>, <4, 3.5>, <4,4.5>, <3.5, 5>, <3.5, 6>, <4, 7>, <3.5, 7.5>, <4, 8>, 
		<3.5, 8.5>, <3.5, 9>, <5, 9>, <3.5, 12>, <4, 13>, <4, 16>, <3, 17>, <2, 17.5>, <1, 18>
		pigment { Gold }	
		finish {
			ambient 0.3
			phong 0.75
		}
	}

	lathe {
		linear_spline
		4,
		<7, 17>, <6.5, 17.4>, <4, 17.6>, <4.5, 20>
		Rotate_Around_Trans( -18*z, <4, 17, -20> )
		translate <1.5, -1.4, -5>
		pigment { Grey }
	}
	translate <0, 0, -20>
}
box { <0, 2, -22>, <6, 16, -25> pigment { Black } }

plane { y, -2 pigment { checker Black, White } }