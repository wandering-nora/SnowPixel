grid_size_x = 8; // number of pixels on x
grid_size_y = 8; // number of pixels on y

cell_size = 2.5; // pitch between pixels
inner_wall_thickness = 0.5; // I think you get this one
outer_wall_thickness = 1.5; //this one too
inner_wall_height = 2; // minimum TBD by experimentation
outer_wall_height = inner_wall_height + 1;
pcb_tolerance = 0.2; //wiggle room for pcb

hole_size = 0.85; // size for solder joint holes

module grid() { // make readable code they said... 
  
    translate([0, 0, 0])
            cube([grid_size_y * cell_size - inner_wall_thickness + 2 * outer_wall_thickness, outer_wall_thickness, inner_wall_height]);
    translate([0, 0, inner_wall_height])
            cube([grid_size_y * cell_size - inner_wall_thickness + 2 * outer_wall_thickness, outer_wall_thickness - pcb_tolerance, outer_wall_height - inner_wall_height]);
    
    for (y = [1 : 1 : grid_size_x -1]) {
        translate([outer_wall_thickness, y * cell_size + outer_wall_thickness - inner_wall_thickness, 0])
            cube([grid_size_y * cell_size - inner_wall_thickness, inner_wall_thickness, inner_wall_height]);
    }
    
    translate([0, grid_size_x * cell_size + outer_wall_thickness - inner_wall_thickness, 0])
            cube([grid_size_y * cell_size - inner_wall_thickness + 2 * outer_wall_thickness, outer_wall_thickness, inner_wall_height]);
    translate([0, grid_size_x * cell_size + outer_wall_thickness - inner_wall_thickness + pcb_tolerance, inner_wall_height])
           cube([grid_size_y * cell_size - inner_wall_thickness + 2 * outer_wall_thickness, outer_wall_thickness - pcb_tolerance, outer_wall_height - inner_wall_height]);
    
    
    translate([0, 0, 0])
            cube([outer_wall_thickness, grid_size_x * cell_size - inner_wall_thickness + 2 * outer_wall_thickness, inner_wall_height]); 
    translate([0, 0, inner_wall_height])
            cube([outer_wall_thickness - pcb_tolerance, grid_size_x * cell_size - inner_wall_thickness + 2 * outer_wall_thickness, outer_wall_height - inner_wall_height]);
    
    for (x = [1 : 1 : grid_size_y - 1]) {
        translate([x * cell_size + outer_wall_thickness -inner_wall_thickness, outer_wall_thickness, 0])
            cube([inner_wall_thickness, grid_size_x * cell_size - inner_wall_thickness, inner_wall_height]);
    }
    
    translate([grid_size_y * cell_size + outer_wall_thickness - inner_wall_thickness, 0, 0])
            cube([outer_wall_thickness, grid_size_x * cell_size - inner_wall_thickness + 2 * outer_wall_thickness, inner_wall_height]);
    translate([grid_size_y * cell_size + outer_wall_thickness - inner_wall_thickness + pcb_tolerance, 0, inner_wall_height])
            cube([outer_wall_thickness - pcb_tolerance, grid_size_x * cell_size - inner_wall_thickness + 2 * outer_wall_thickness, outer_wall_height - inner_wall_height]);
}

 
 color([0.9,0.8,1]) difference() { //holes for soldering the module on a different pcb
     grid();
     for (y = [1 : 1 : grid_size_x -1]) {
        translate([-0.1, y * cell_size + outer_wall_thickness - inner_wall_thickness/2, outer_wall_height])
        rotate([0,90,0])
        cylinder(r=hole_size, h=cell_size * (grid_size_y + 2), $fn=16);
    }
    for (y = [1 : 1 : grid_size_y -1]) {
        translate([y * cell_size + outer_wall_thickness - inner_wall_thickness/2, -0.1, outer_wall_height])
        rotate([0,90,90])
        cylinder(r=hole_size, h=cell_size * (grid_size_y + 2), $fn=16);
    }
     
}


