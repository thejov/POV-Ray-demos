#include "colors.inc"
#include "glass.inc"
#include "textures.inc"

camera {
	location <0, 1.5, -50>
	look_at 0
	angle 36
}

background { color Grey }
light_source { <20,10,-10> White }

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
	sphere { <-1.5,2,2>, 2, 1 }
	sphere { <-0.75, 2.59808, 0>, 2, 1 }
	sphere { <-0.75, -2.59808, 0>, 2, 1 }
	texture {
		pigment { color red 1 blue 1 green 0 }
		finish { phong 1 }
	}
}	

blob {
	threshold 0.6
	sphere { <0.75,0,0>, 1, 1 }
	sphere { <-0.375, 2.59808, 0>, 1, 1 }
	sphere { <-0.375, -2.59808, 0>, 1, 1 }
	texture {
		pigment { color red 1 blue 1 green 0 }
		finish { phong 1 }
	}
}
