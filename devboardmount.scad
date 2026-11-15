use <ring.scad>
use <boxes.scad>

$fa=0.1;
$fs=0.2;

module mount_assembly() {
    
    TOL = 0.01;
    print_tol = 0.7;
    
    module bracket(w, l, h, thickness, overhang, r_rounding) {
        difference() {
            // starting shape...
            roundedCube([w, l, h], r_rounding, sidesonly=true, center=true);
            // center cut
            cube([w-thickness, l-thickness, h+TOL], center=true);
            // mouth cut
            translate([thickness+TOL, 0, 0]) cube([w, l-thickness-overhang, h+TOL], center=true);
        }
    }
    
    
    
    // ASSEMBLY
    // ...
    union() {
        bracket(4, 20.0, 5.3, thickness=2.1, overhang=1.7, r_rounding=0.5);
        translate([-4/2, 0, 0]) cube([print_tol*2, 5, 3-print_tol], center=true);
        translate([(-4/2-print_tol), 0, 0]) rotate([90, 0, 0]) dovetail(6-print_tol, 3-print_tol, 2.5-print_tol, 5);
    }
}

//dovetail(1, 2, 2, 2);
mount_assembly();