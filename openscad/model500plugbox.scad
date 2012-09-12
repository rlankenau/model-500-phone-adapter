
module plugbox()
{

	size = 50;
	height=20;
	stdoff=35;
	/* Drill a hole all the way through the object. */
	module drill_full(x,y) {
		translate([x,y,0]) {
			cylinder(r=1.8, h=55, $fn=100, center=true);
		}
	}

	/* Drill a hole that only extends to the top of the cavity. */
	module drill_partial(x,y,) {
		translate([x,y,0]) {
			cylinder(r=2.5, h=height-5, $fn=100, center=true);
		}
	}

	difference() {
		/* Create outside dimensions */
		hull(){
			/*cube([size, size, height], center=true);*/
			translate([size/2-3,size/2-3,0]) {
				cylinder(r=3.5,h=height,$fn=100,center=true);
			}
			translate([-size/2+3,-size/2+3,0]) {
				cylinder(r=3.5,h=height,$fn=100,center=true);
			}
			translate([size/2-3,-size/2+3,0]) {
				cylinder(r=3.5,h=height,$fn=100,center=true);
			}
			translate([-size/2+3,size/2-3,0]) {
				cylinder(r=3.5,h=height,$fn=100,center=true);
			}
		}
		/* 
			Hollow out a shallow base.  
			The circuit board will sit here.  
			We have 5 mm to work with here.
		*/
		translate([0,0,height-5]) {
			cube([size-4, size-4, height-2],center=true);
			echo(size-4);
		}

		/*
			Hollow out the remainder of the cavity, leaving posts.
		*/
		translate([0,0,5]) {
			cube([size-25, size-4, height-2],center=true);
			cube([size-4, size-25, height-2],center=true);
		}

		/* Create port for telephone line */
		translate([23,0,0]) {
			cube(6,8,8,center=true);
		}

		/* Create holes for plug */
		drill_full(6.26, -7.65);
		drill_full(6.26, 7.65);
		drill_full(-9.26, 6.05);
		drill_full(-9.26, -6.05);

		/* Create holes for standoffs */

		drill_partial(stdoff/2, stdoff/2);
		drill_partial(-stdoff/2, stdoff/2);
		drill_partial(stdoff/2, -stdoff/2);
		drill_partial(-stdoff/2, -stdoff/2);
	}


}

	plugbox();

