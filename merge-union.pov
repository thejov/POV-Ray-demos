#include "colors.inc"
#include "glass.inc"
#include "textures.inc"

camera {
	location <0, 1.5, -7>
	look_at 0
	angle 36
}

background { color Grey }
light_source { <20,10,-10> White }

union {
	sphere { <0,1,0>, 0.35 }
	cone { <0,0,0>, 0.45, <0,1.2,0>, 0 }
	texture { Glass3 }
	translate <-0.5, 0, 0>
	pigment { color Green transmit 0.7 }
}

merge {
	sphere { <0,1,0>, 0.35 }
	cone { <0,0,0>, 0.45, <0,1.2,0>, 0 }
	texture { Glass3 }
	translate <0.5,0,0>
	pigment { color Green transmit 0.7 }
}
