
module plugbox()
{
	stdoff=35;       

	/* Drill a hole all the way through the object. */
	module drill_full(x,y) {
		translate([x,y,0]) {
			cylinder(r=1.8, h=55, center=true);
		}
	}

	/* Drill a hole that only extends to the top of the cavity. */
	module drill_standoff(x,y) {
		translate([x,y,-1]) {
			cylinder(r=2.5, h=height+4, $fn=100,     center=true);
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
		
		/* Dish out the center */
		translate([0,0,2]) {
     
			cube([size-25, size, 4],center=true);
			cube([size, size-25, 4],center=true);

		}
	
		translate([-size/2,0,2])
			cube([4,size,4],center=true);
		translate([size/2,0,2])
			cube([4,size,4],center=true);
		translate([0,-size/2,2])
			cube([size,4,4],center=true);
		translate([0,size/2,2])
			cube([size,4,4],center=true);

		/* Create holes for standoffs */
		drill_standoff(stdoff/2, stdoff/2);
		drill_standoff(-stdoff/2, stdoff/2);
		drill_standoff(stdoff/2, -stdoff/2);
		drill_standoff(-stdoff/2, -stdoff/2);
	}

	size = 50;
	height=6;
}

plugbox();

