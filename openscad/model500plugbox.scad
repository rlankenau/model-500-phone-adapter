
module plugbox()
{

	/* Drill a hole all the way through the object. */
	module drill_full(x,y) {
		translate([x,y,0]) {
			cylinder(r=1.8, h=55, center=true);
		}
	}

	/* Drill a hole that only extends to the top of the cavity. */
	module drill_partial(x,y,) {
		translate([x,y,0]) {
			cylinder(r=2.5, h=height-5, center=true);
		}
	}

	difference() {
		/* Create outside dimensions */
		cube([size, size, height], center=true);
		
		/* 
			Hollow out a shallow base.  
			The circuit board will sit here.  
			We have 5 mm to work with here.
		*/
		translate([0,0,height-5]) {
			cube([size-4, size-4, height-2],center=true);
		}

		/*
			Hollow out the remainder of the cavity, leaving posts.
		*/
		translate([0,0,5]) {
			cube([size-20, size-4, height-2],center=true);
			cube([size-4, size-20, height-2],center=true);
		}

		/* Create port for telephone line */
		translate([23,0,0]) {
			cube(6,8,8,center=true);
		}

		/* Create holes for plug */
		drill_full(9.26, -7.65);
		drill_full(9.26, 7.65);
		drill_full(-9.26, 6.05);
		drill_full(-9.26, -6.05);

		/* Create holes for standoffs */
		drill_partial((size-12)/2, (size-12)/2);
		drill_partial(-(size-12)/2, (size-12)/2);
		drill_partial((size-12)/2, -(size-12)/2);
		drill_partial(-(size-12)/2, -(size-12)/2);
	}

	size = 50;
	height=20;
}

plugbox();

