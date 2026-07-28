$fn=500;

inner_d = 5;
wall = 3;
height = 3;
stroke = 15;
rod = 10;

module PushRod() {
    difference() {
        hull() {
            translate([0, -stroke/2, 0])
                cylinder(h=height, d=inner_d+2*wall);
            translate([0, stroke/2, 0])
                cylinder(h=height, d=inner_d+2*wall);
        }
        
        hull() {
            translate([0, -stroke/2, 0])
                cylinder(h=3*height, d=inner_d, center=true);
            translate([0, stroke/2, 0])
                cylinder(h=3*height, d=inner_d, center=true);
        }
    }
    
    translate([wall+inner_d/2, -height/2, 0])
        cube([rod, height, height]);
}

//PushRod();

tube_size = (5/8)*25.4 * 1.1;
pellet_d = (1/4)*25.4 * 1.1;
pellet_h = 15;
hose_attach = 10;
pipe_d = 2*25.4;
pipe_attach = 10;
pipe_inner_d = pipe_d-2*wall;

module Magazine() {
    outter_l = tube_size + 2*wall;
    base_height = height+pellet_h+hose_attach;
    difference() {
        hull() {
            translate([-stroke, -outter_l/2, 0])
                cube([stroke, outter_l, base_height]);
            
            translate([-wall, -pipe_d/2-wall, -pipe_attach-wall])
                cube([pipe_d, pipe_d+2*wall, pipe_attach+wall+pellet_h]);
        }
            
        translate([-stroke/2, 0, height+pellet_h])
            cylinder(h=base_height, d=tube_size);
        
        translate([-stroke/2, 0, height])
            cylinder(h=base_height, d=pellet_d);
        
        translate([-1.5*stroke, -height/2, height+pellet_h/2-height/2])
            cube([3*stroke, height, height]);
        
        translate([-0.5*stroke, -pellet_d/2, height])
            cube([stroke, pellet_d, 2*pellet_h]);
        
        translate([pipe_d/2-wall, 0, -2*pipe_attach-wall])
            cylinder(h=2*pipe_attach, d=pipe_d);
        
        translate([pipe_d/2-wall, 0, 0])
            cylinder(h=1000, d=pipe_inner_d, center=true);
        
        translate([0, -1.5*(pipe_d+2*wall), pellet_h])
            cube([2*(pipe_d+wall), 3*(pipe_d+2*wall), 1000]);
    }
}

Magazine();