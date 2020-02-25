
ROOM_WITH = 3000;
ROOM_HEIGTH = 2330;
BACK_OFFSET = 50;
COUPE_DEPTH = 550;
RACK_HEIGHT = 2000;

//cube([150, 50, 16]);

room();

translate([0,-BACK_OFFSET,RACK_HEIGHT]) sheet(ROOM_WITH, COUPE_DEPTH+BACK_OFFSET, 25, [true, true, 0, true]);
racks();

module racks() {
    translate([ROOM_WITH*0.5 + 12.5,-BACK_OFFSET,0]) rotate([0,-90,0]) sheet(RACK_HEIGHT, COUPE_DEPTH+BACK_OFFSET, 25, [true, true, 0, true]);
    translate([ROOM_WITH*0.25 + 12.5,-BACK_OFFSET,0]) rotate([0,-90,0]) sheet(RACK_HEIGHT, COUPE_DEPTH+BACK_OFFSET, 25, [true, true, 0, true]);
    translate([ROOM_WITH*0.75 + 12.5,-BACK_OFFSET,0]) rotate([0,-90,0]) sheet(RACK_HEIGHT, COUPE_DEPTH+BACK_OFFSET, 25, [true, true, 0, true]);
}


module room() {

    translate([0,-BACK_OFFSET,-10]) color("Gray") cube([ROOM_WITH,2000,10]);
    translate([0,-50,ROOM_HEIGTH]) color("White") cube([ROOM_WITH,2000,10]);
    translate([0,-50,ROOM_HEIGTH-230]) color("White") cube([ROOM_WITH,110,230]);
    translate([-10,-BACK_OFFSET,0]) color("Teal") cube([10,2000,ROOM_HEIGTH]);
    translate([ROOM_WITH,-BACK_OFFSET,0]) color("WhiteSmoke") cube([10,2000,ROOM_HEIGTH]);

}

module sheet(length, width, thickness, edging) {
    
    translate([0.5,0.5,0]) {
        color("White") cube([length-1, width-1, 0.1]);
        translate([0,0,0.1]) color("Green") cube([length-1, width-1, thickness-0.2]);
        translate([0,0,thickness]) color("White") cube([length-1, width-1, 0.1]);
    }
    if (edging[0]) color("White") cube([0.5, width, thickness]);
    if (edging[1]) translate([length-0.5,0,0]) color("White") cube([0.5, width, thickness]);
    if (edging[2]) color("White") cube([length, 0.5, thickness]);
    if (edging[3]) translate([0,width-0.5,0]) color("White") cube([length, 0.5, thickness]);
        
    translate([10,10,thickness]) rotate([0,0,0]) #text(str(length, " x ", width, " x ", thickness), size=30);
    
}

