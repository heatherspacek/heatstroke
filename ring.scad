$fa=0.1;
$fs=0.4;
r_outer = 17;
r_inner = 15;
thickness = 6;

TOL = 0.01;
print_tol = 0.30;

mount_thickness = 4;
mount_length = 12;


// ring
module justring() {
difference() {
    cylinder(h=thickness, r=r_outer, center=true);
    cylinder(h=thickness+TOL, r=r_inner, center=true);
}
}
difference(){
    union(){
        justring();
        
        // mount surface
        translate([r_outer, 0, 0])
        cube([mount_thickness, mount_length, thickness], center=true);
    }
    
    translate([r_inner + mount_thickness, 0, 0]) dovetail(6, 3, 2.5, thickness);
}

// dovetail cut
module dovetail(w0, w1, h, thickness) {
    p0 = [-h-TOL, -(w0/2)];
    p1 = [-h-TOL, w0/2];
    p2 = [0+TOL, w1/2];
    p3 = [0+TOL, -(w1/2)];
    linear_extrude(thickness + TOL, center=true) polygon([p0, p1, p2, p3]);
}
