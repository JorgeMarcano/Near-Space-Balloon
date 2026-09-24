$fn=5;

pitch = 15.24;
turns = 20;
diameter=13;
wire_dia=0.75;

module tracePath(path, size){
    for(i=[0:len(path)-1]){
        if(i+1 < len(path)){
            hull(){
                translate(path[i])
                    sphere(d=size);

                translate(path[i+1])
                    sphere(d=size);
            }
        }
    }
}

function spiral(twist,height,spiral_radius) =
    [ for(i=[0:15:360*twist])
        [spiral_radius*sin(i),
        spiral_radius*cos(i),
        i/(360*twist)*height]];

path = spiral(turns,pitch,diameter/2);

translate([0, -pitch/2, diameter/2+wire_dia/2])
rotate([-90,0,0])
    tracePath(path, wire_dia);
    
pin_height = 2.5;
translate([0, -pitch/2, -pin_height+wire_dia/2])
    cylinder(h=pin_height, d=wire_dia);
   
translate([0, pitch/2, -pin_height+wire_dia/2])
    cylinder(h=pin_height, d=wire_dia);