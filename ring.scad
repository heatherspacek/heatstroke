
r_outer = 14;
r_inner = 12;
thickness = 5;

TOL = 0.01;


// ring
difference() {
    cylinder(h=thickness, r=r_outer, center=true);
    cylinder(h=thickness+TOL, r=r_inner, center=true);
}

// mount surface
