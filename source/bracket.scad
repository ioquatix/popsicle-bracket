
use <bolts.scad>;

width = 10;
thickness = 6;
stick = 2;
offset = 4;

module rotations(max = 360) {
	for (a = [0:60:max]) {
		rotate([0, 0, a]) children();
	}
}

difference() {
	union() {
		cylinder(h=width, d=thickness, $fn=32);
		
		rotations()
		translate([0, -(thickness/2), 0]) {
			cube([width+offset, thickness, width]);
		}
	}
	
	cylinder_outer(width, 3.2 / 2);
	
	rotations()
	translate([offset, -(stick/2), 0]) {
		#cube([width, stick, width]);
	}
}