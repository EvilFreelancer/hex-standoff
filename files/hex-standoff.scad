standoff_base_height=24;
standoff_base_diameter=6;

standoff_pin_height=5;
standoff_pin_diameter=3;

pin_split_width=0.8;

show_pin=true;

bottom_hole_height=4;
bottom_hole_diameter=3;

union() {
    if (show_pin) {
        translate([0, 0, standoff_base_height+standoff_pin_height/2]) post();
    }

    difference() {
        translate([0, 0, standoff_base_height/2]) hex(standoff_base_diameter, standoff_base_height);
        
        if (show_pin) {
            hex(bottom_hole_diameter, bottom_hole_height*2);
        } else {
            hex(bottom_hole_diameter, standoff_base_height*2);
        }
    }
}

module post() {
    difference() {
        hex(standoff_pin_diameter, standoff_pin_height);
        cube([standoff_pin_diameter+1, pin_split_width, standoff_pin_height], true);
    }
}

// From https://www.youtube.com/watch?v=KAKEk1falNg
module hex(width,height){
    hull() {
        cube([width/1.7,width,height],center = true);
        rotate([0,0,120])cube([width/1.7,width,height],center = true);
        rotate([0,0,240])cube([width/1.7,width,height],center = true);
    }
}
