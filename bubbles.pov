#include "colors.inc"
#include "glass.inc"
#include "textures.inc"

camera {
	location <0, 0, -15>
	look_at 0
}

background { color Grey }
light_source { <0,30,-10> White }

blob {
	threshold 0.6
	sphere { <0.75,0,0>, 1, 1 }
	sphere { <-0.375, 0.64952, 0>, 1, 1 }
	sphere { <-0.375, -0.64952, 0>, 1, 1 }
	texture {
		pigment { color red 1 blue 1 green 0 }
		finish { phong 1 }
	}
}

blob {
	threshold 0.6
	sphere { <0.75,0,0>, 1, 1 }
	sphere { <-0.375, 0.64952, 0>, 1, 1 }
	sphere { <-0.375, -0.64952, 0>, 1, 1 }
	texture {
		pigment { color red 1 blue 1 green 0 }
		finish { phong 1 }
	}
	translate 5*x
	scale <0.5,0.5,0.5>
}	

blob {
	threshold 0.6
	sphere { <0.75,0,0>, 1, 1 }
	sphere { <-0.375, 0.64952, 0>, 1, 1 }
	sphere { <-0.375, -0.64952, 0>, 1, 1 }
	texture {
		pigment { color red 1 blue 1 green 0 }
		finish { phong 1 }
	}
	translate -2*x
	scale <3,3,3>
}
           
plane { -y, 5
    pigment { checker color Black, color White }
}