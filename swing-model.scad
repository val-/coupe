
ROOM_WITH = 3005;
ROOM_HEIGTH = 2325;
BACK_OFFSET = 100;
Z_OFFSET=100 + 16;
COUPE_DEPTH = 550;

asmpad = 0;


room();
racks();
doors();
pedestal();


container_1();
container_2();
container_3();

module pedestal() {
    translate([0,-BACK_OFFSET,100]) rotate([0,0,0]) sheet(ROOM_WITH, COUPE_DEPTH+BACK_OFFSET, 16, [true, true, true, true]);
    translate([0,COUPE_DEPTH-40,0]) rotate([90,0,0]) sheet(ROOM_WITH, 100, 16, [true, true, true, true]);
}

module container_1() {
    translate([970+16,COUPE_DEPTH,0]) rotate([0,0,180]) {
        //#cube([970, COUPE_DEPTH, ROOM_HEIGTH]);
        translate([0,10,2050]) sheet(970, COUPE_DEPTH+BACK_OFFSET, 25, [true, true, true, 0]);
        translate([0,10,Z_OFFSET+200]) sheet(970, COUPE_DEPTH+BACK_OFFSET, 25, [true, true, true, 0]);
        translate([0,10,Z_OFFSET+200+25+200]) sheet(970, COUPE_DEPTH+BACK_OFFSET, 25, [true, true, true, 0]);
    }
}

module container_2() {
    translate([970+16+32+969,COUPE_DEPTH,0]) rotate([0,0,180]) {
        //#cube([969, COUPE_DEPTH, ROOM_HEIGTH]);
        translate([0,10,2050]) sheet(969, COUPE_DEPTH+BACK_OFFSET, 25, [true, true, true, 0]);
        translate([0,10,Z_OFFSET+750]) sheet(969, COUPE_DEPTH+BACK_OFFSET, 25, [true, true, true, 0]);

        for (i =[0:2]) translate([13,20-asmpad*12,Z_OFFSET+10 + i*250]) box(150, 500, 969-13*2, asmpad);
        for (i =[0:2]) translate([3,20-asmpad*15,Z_OFFSET+5 + i*250]) rotate([90,0,0]) sheet(969-3-3, 210, 16, [true, true, true, 0]);

    }
}

module container_3() {
    translate([970+16+32+969+32+970,COUPE_DEPTH,0]) rotate([0,0,180]) {
        //#cube([970, COUPE_DEPTH, ROOM_HEIGTH]);
        translate([0,10,2050]) sheet(970, COUPE_DEPTH+BACK_OFFSET-10, 25, [true, true, true, 0]);
        translate([0,10,2050-330]) sheet(970, COUPE_DEPTH+BACK_OFFSET-10, 25, [true, true, true, 0]);

        //#translate([0, 0, Z_OFFSET]) cube([260,260,1300]);
        #translate([276, 0, Z_OFFSET]) cube([110,500,1600]);

        translate([16+260,10,Z_OFFSET]) rotate([0,-90,0]) sheet(2050-330-Z_OFFSET, COUPE_DEPTH+BACK_OFFSET-10, 16, [true, true, true, 0]);
        translate([16+260+110+16,10,Z_OFFSET]) rotate([0,-90,0]) sheet(2050-330-Z_OFFSET, COUPE_DEPTH+BACK_OFFSET-10, 16, [true, true, true, 0]);

        for (i =[0:3]) translate([0,10+260,400 + 350*i]) sheet(260, COUPE_DEPTH+BACK_OFFSET-10-260, 16, [true, true, true, 0]);
        translate([0,10+260+16,1116]) rotate([90,0,0]) sheet(260, 200, 16, [true, true, true, 0]);

        for (i =[0:3]) translate([16+260+110+16,10,400 + 350*i]) sheet(568, COUPE_DEPTH+BACK_OFFSET-10, 16, [true, true, true, 0]);

    }
}

module racks() {
    translate([16,-BACK_OFFSET,Z_OFFSET]) rotate([0,-90,0]) sheet(ROOM_HEIGTH-Z_OFFSET, COUPE_DEPTH+BACK_OFFSET, 16, [true, true, 0, true]);
    translate([ROOM_WITH,-BACK_OFFSET,Z_OFFSET]) rotate([0,-90,0]) sheet(ROOM_HEIGTH-Z_OFFSET, COUPE_DEPTH+BACK_OFFSET, 16, [true, true, 0, true]);
    translate([ROOM_WITH-16-970,-BACK_OFFSET,Z_OFFSET]) rotate([0,-90,0]) sheet(ROOM_HEIGTH-Z_OFFSET, COUPE_DEPTH+BACK_OFFSET, 32, [true, true, 0, true]);
    translate([16+32+970,-BACK_OFFSET,Z_OFFSET]) rotate([0,-90,0]) sheet(ROOM_HEIGTH-Z_OFFSET, COUPE_DEPTH+BACK_OFFSET, 32, [true, true, 0, true]);
}

module doors() {
    for (i =[0:5]) translate([5 + 500*i,COUPE_DEPTH*2+20,ROOM_HEIGTH]) rotate([180,0,0]) door(2315-100, i%2);
}

module door(h=2294, even) {
    if(even) {
        translate([495,COUPE_DEPTH+3,10]) scale([1,-1,1]) rotate([180,-90,-90-$t*80]) {
            door_sheet(h);
        }
    } else {
        translate([0,COUPE_DEPTH+3,10]) rotate([0,-90,-90-$t*80]) {
            door_sheet(h);
        }
    }
}

module door_sheet(h=2294) {
    difference() {
        sheet(h, 495, 19, [true, true, true, true]);
        color("WhiteSmoke") {
            translate([80,80,-15]) cube([h/2-160, 495-160, 19]);
            translate([h/2 + 80,80,-15]) cube([h/2-160, 495-160, 19]);
        }
    }
}

module room() {
    //translate([ROOM_WITH,-BACK_OFFSET,0]) color("WhiteSmoke") cube([10,2000,ROOM_HEIGTH]);
    //translate([0,-50,ROOM_HEIGTH]) color("White") cube([ROOM_WITH,2000,10]);
    translate([0,-BACK_OFFSET,-10]) color("Gray") cube([ROOM_WITH,2000,10]);
    translate([-20,440-475,2085]) color("Red") cube([ROOM_WITH+50,110,240]);
    translate([-10,-BACK_OFFSET,0]) color("Teal") cube([10,2000,ROOM_HEIGTH]);
}

module sheet(length, width, thickness, edging) {
    
    translate([0.5,0.5,0]) {
        color("White") cube([length-1, width-1, 0.1]);
        translate([0,0,0.1]) color("Gray") cube([length-1, width-1, thickness-0.2]);
        translate([0,0,thickness]) color("White") cube([length-1, width-1, 0.1]);
    }
    if (edging[0]) color("White") cube([0.5, width, thickness]);
    if (edging[1]) translate([length-0.5,0,0]) color("White") cube([0.5, width, thickness]);
    if (edging[2]) color("White") cube([length, 0.5, thickness]);
    if (edging[3]) translate([0,width-0.5,0]) color("White") cube([length, 0.5, thickness]);
        
    translate([10,10,thickness]) rotate([0,0,0]) #text(str(length, " x ", width, " x ", thickness), size=30);
    
}


module box(h, w, t, asmpad) {
    // Дно
    translate([16,16,0]) sheet(t-32,w-32,16);
    // Боковины
    translate([0-asmpad,0,0]) rotate([90,0,90]) sheet(w,h,16);
    translate([t-32+16+asmpad,0,0]) rotate([90,0,90]) sheet(w,h,16);
    // Лбы
    translate([16,16-asmpad,0]) rotate([90,0,0]) sheet(t-32,h,16);
    translate([16,w+asmpad,0]) rotate([90,0,0]) sheet(t-32,h,16);
}

