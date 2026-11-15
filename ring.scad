$fa=0.1;
$fs=0.4;

// dovetail cut
module dovetail(w0, w1, h, thickness) {
    p0 = [-h, -(w0/2)];
    p1 = [-h, w0/2];
    p2 = [0, w1/2];
    p3 = [0, -(w1/2)];
    linear_extrude(thickness, center=true) polygon([p0, p1, p2, p3]);
}

module ring_assembly(r_inner=15, axial_thickness) {

r_outer = r_inner + 2;

thickness = 6;

TOL = 0.01;
print_tol = 0.30;

mount_thickness = 4;
mount_length = 12;


module justring() {
difference() {
    cylinder(h=thickness, r=r_outer, center=true);
    cylinder(h=thickness+TOL, r=r_inner, center=true);
}
}

// assembly.
difference(){
    union(){
        justring();
        
        // mount surface
        translate([r_outer, 0, 0])
        cube([mount_thickness, mount_length, thickness], center=true);
    }
    
    translate([r_inner + mount_thickness + TOL, 0, 0])
    dovetail(6+TOL, 3+TOL, 2.5+TOL, thickness+TOL);
}
}

for (i_r=[8:0.5:10])
{
    translate([0, 50*(i_r-8), 0]) ring_assembly(i_r);
}

//ring_assembly();