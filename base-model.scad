
ROOM_WITH = 3005;
ROOM_HEIGTH = 2325;
BACK_OFFSET = 100;
COUPE_DEPTH = 550;
RACK_HEIGHT = 2085-25-5;

//cube([150, 50, 16]);

room();
boxes();
boxes2();

translate([0,-BACK_OFFSET,RACK_HEIGHT]) sheet(ROOM_WITH, COUPE_DEPTH+BACK_OFFSET, 25, [true, true, 0, true]);
racks();

translate([ROOM_WITH-439,0,0]) shelfs(300, 540);
translate([ROOM_WITH,0,0])  translate([-739,-BACK_OFFSET,RACK_HEIGHT*5/6]) sheet(739, 550+BACK_OFFSET, 16, [true, true, 0, true]);

translate([739,0,0]) shelfs2(739, 540);



module racks() {
    translate([ROOM_WITH*0.5 + 12.5,-BACK_OFFSET,0]) rotate([0,-90,0]) sheet(RACK_HEIGHT, COUPE_DEPTH+BACK_OFFSET, 25, [true, true, 0, true]);
    translate([ROOM_WITH*0.25 + 12.5,-BACK_OFFSET,0]) rotate([0,-90,0]) sheet(RACK_HEIGHT, COUPE_DEPTH+BACK_OFFSET, 25, [true, true, 0, true]);
    translate([ROOM_WITH*0.75 + 12.5,-BACK_OFFSET,0]) rotate([0,-90,0]) sheet(RACK_HEIGHT, COUPE_DEPTH+BACK_OFFSET, 25, [true, true, 0, true]);
    translate([ROOM_WITH-439+16+150+16,-BACK_OFFSET,0]) rotate([0,-90,0]) sheet(1713, COUPE_DEPTH+BACK_OFFSET, 16, [true, true, 0, true]);
    translate([ROOM_WITH-439+16,-BACK_OFFSET,0]) rotate([0,-90,0]) sheet(1713, COUPE_DEPTH+BACK_OFFSET, 16, [true, true, 0, true]);
}

module shelfs(width, depth) {
    translate([-width,-BACK_OFFSET,RACK_HEIGHT*1/6]) sheet(width, depth+BACK_OFFSET, 16, [true, true, 0, true]);
    translate([-width,-BACK_OFFSET,RACK_HEIGHT*2/6]) sheet(width, depth+BACK_OFFSET, 16, [true, true, 0, true]);
    translate([-width,-BACK_OFFSET,RACK_HEIGHT*3/6]) sheet(width, depth+BACK_OFFSET, 16, [true, true, 0, true]);
    translate([-width,-BACK_OFFSET,RACK_HEIGHT*4/6]) sheet(width, depth+BACK_OFFSET, 16, [true, true, 0, true]);
}

module shelfs2(width, depth) {
    translate([-width,-BACK_OFFSET,210]) sheet(width, depth+BACK_OFFSET, 16, [true, true, 0, true]);
    translate([-width,-BACK_OFFSET,210+16+190+20]) sheet(width, depth+BACK_OFFSET, 16, [true, true, 0, true]);

    translate([1500-width,-BACK_OFFSET,210]) sheet(width, depth+BACK_OFFSET, 16, [true, true, 0, true]);
    translate([1500-width,-BACK_OFFSET,1200]) sheet(width, depth+BACK_OFFSET, 16, [true, true, 0, true]);

    translate([1500-width,-BACK_OFFSET,1500]) sheet(width, depth+BACK_OFFSET, 16, [true, true, 0, true]);
    translate([1500-width,-BACK_OFFSET,1800]) sheet(width, depth+BACK_OFFSET, 16, [true, true, 0, true]);
}



module boxes2(width) {

    color("Blue") {
        translate([1530, -20, 250]) cube([690,600,300]);
        translate([1530, -20, 250+10+300]) cube([690,600,200]);
        translate([1530, -20, 250+10+300+10+200]) cube([690,600,200]);
        translate([1530, -20, 250+10+300+10+200+10+200]) cube([690,600,200]);
        
    }

}

module boxes() {

    color("Pink") {
        translate([40 + 240*0, 150,RACK_HEIGHT+30]) cube([220, 340, 160]);
        translate([40 + 240*1, 150,RACK_HEIGHT+30]) cube([220, 340, 160]);
        translate([40 + 240*2, 150,RACK_HEIGHT+30]) cube([220, 340, 160]);
        translate([40 + 240*3, 150,RACK_HEIGHT+30]) cube([220, 340, 160]);
        translate([40 + 240*4, 150,RACK_HEIGHT+30]) cube([220, 340, 160]);
        translate([40 + 240*5, 150,RACK_HEIGHT+30]) cube([220, 340, 160]);
        translate([40 + 240*6, 150,RACK_HEIGHT+30]) cube([220, 340, 160]);
        //translate([0, 50,RACK_HEIGHT+40]) cube([930, 550, 190]);
        translate([30, -20, 0]) cube([690,550,190]);
        translate([30, -20, 210+16]) cube([690,550,190]);

        translate([1530, -20, 0]) cube([690,550,190]);

        translate([2750, -20, 20]) cube([260,260,1300]);
        translate([2585, -20, 20]) cube([150,500,1700]);
    }

}

module room() {
    //translate([ROOM_WITH,-BACK_OFFSET,0]) color("WhiteSmoke") cube([10,2000,ROOM_HEIGTH]);
    //translate([0,-50,ROOM_HEIGTH]) color("White") cube([ROOM_WITH,2000,10]);
    translate([0,-BACK_OFFSET,-10]) color("Gray") cube([ROOM_WITH,2000,10]);
    translate([0,440-475,2085]) color("White") cube([ROOM_WITH,110,240]);
    translate([-10,-BACK_OFFSET,0]) color("Teal") cube([10,2000,ROOM_HEIGTH]);
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

