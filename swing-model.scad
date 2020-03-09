
ROOM_WITH = 3005;
ROOM_HEIGTH = 2325;
BACK_OFFSET = 100;
Z_OFFSET=100 + 16;
COUPE_DEPTH = 550;

asmpad = 0;
dpad = 0;
dangle = 90;


room();
racks();
//doors();
pedestal();


container_1();
container_2();
container_3();

boxes();

module pedestal() {
    translate([0,-BACK_OFFSET,100]) rotate([0,0,0]) sheet(ROOM_WITH, COUPE_DEPTH+BACK_OFFSET, 16, [true, true, 0, true]);
    translate([0,COUPE_DEPTH-40,0]) rotate([90,0,0]) sheet(ROOM_WITH, 100, 16, [true, true, true, true]);
}

module container_1() {
    translate([970+16,COUPE_DEPTH,0]) rotate([0,0,180]) {
        //#cube([970, COUPE_DEPTH, ROOM_HEIGTH]);
        hinges();
        translate([0,10,2050]) sheet(970, COUPE_DEPTH+BACK_OFFSET, 25, [true, true, true, 0]);
        translate([0,10,Z_OFFSET+200]) sheet(970, COUPE_DEPTH+BACK_OFFSET, 16, [true, true, true, 0]);
        translate([0,10,Z_OFFSET+200+16+200]) sheet(970, COUPE_DEPTH+BACK_OFFSET, 25, [true, true, true, 0]);
        translate([16+477,10,Z_OFFSET]) rotate([0,-90,0]) sheet(200, COUPE_DEPTH+BACK_OFFSET-10, 16, [true, true, true, 0]);
    }
}

module container_2() {
    translate([970+16+32+969,COUPE_DEPTH,0]) rotate([0,0,180]) {
        //#cube([969, COUPE_DEPTH, ROOM_HEIGTH]);
        hinges();
        translate([0,10,2050]) sheet(969, COUPE_DEPTH+BACK_OFFSET, 25, [true, true, true, 0]);
        commode();
    }
}

module commode() {

    // Верхушка
    translate([0,65-16,Z_OFFSET+800]) sheet(969, COUPE_DEPTH+BACK_OFFSET, 25, [true, true, true, 0]);
    translate([0,65-16+25,Z_OFFSET+800+25]) rotate([90,0,0]) sheet(969, 80, 25, [true, true, true, true]);

    //Боковина
    translate([32+16,65+16,Z_OFFSET]) rotate([0,-90,0]) sheet(800, COUPE_DEPTH+BACK_OFFSET-10, 16, [true, true, true, 0]);
    translate([0,65,Z_OFFSET]) rotate([0,-90,-90]) sheet(800, 32+16, 16, [true, true, true, true]);

    //Боковина
    translate([969-32,65+16,Z_OFFSET]) rotate([0,-90,0]) sheet(800, COUPE_DEPTH+BACK_OFFSET-10, 16, [true, true, true, 0]);
    translate([969-32-16,65,Z_OFFSET]) rotate([0,-90,-90]) sheet(800, 32+16, 16, [true, true, true, true]);


    // Фасады
    translate([30,65-dpad*30,Z_OFFSET+3]) rotate([90,0,0]) sheet(969-30*2, 292, 16, [true, true, true, true]);
    translate([30,65-dpad*20,Z_OFFSET+3+292+35]) rotate([90,0,0]) sheet(969-30*2, 200, 16, [true, true, true, true]);
    translate([30,65-dpad*10,Z_OFFSET+3+292+35+200+35]) rotate([90,0,0]) sheet(969-30*2, 200, 16, [true, true, true, true]);

    //Ящики
    translate([32+16+13,60-dpad*30,Z_OFFSET+10]) box(180, 500, 969-(32+16)*2-13*2, asmpad);
    translate([32+16+13,60-dpad*20,Z_OFFSET+10+292+35]) box(180, 500, 969-(32+16)*2-13*2, asmpad);
    translate([32+16+13,60-dpad*10,Z_OFFSET+10+292+35+200+35]) box(180, 500, 969-(32+16)*2-13*2, asmpad);
    
}

module container_3() {
    translate([970+16+32+969+32+970,COUPE_DEPTH,0]) rotate([0,0,180]) {
        //#cube([970, COUPE_DEPTH, ROOM_HEIGTH]);
        hinges();
        translate([0,10,2050]) sheet(970, COUPE_DEPTH+BACK_OFFSET-10, 25, [true, true, true, 0]);
        translate([0,10,2050-330]) sheet(970, COUPE_DEPTH+BACK_OFFSET-10, 25, [true, true, true, 0]);

        //#translate([0, 0, Z_OFFSET]) cube([260,260,1300]);
        //#translate([276, 0, Z_OFFSET]) cube([110,500,1600]);

        translate([16+260,10,Z_OFFSET]) rotate([0,-90,0]) sheet(2050-330-Z_OFFSET, COUPE_DEPTH+BACK_OFFSET-10, 16, [true, true, true, 0]);
        translate([16+260+110+16,10,Z_OFFSET]) rotate([0,-90,0]) sheet(2050-330-Z_OFFSET, COUPE_DEPTH+BACK_OFFSET-10, 16, [true, true, true, 0]);

        for (i =[0:3]) translate([0,10+260,400 + 350*i]) sheet(260, COUPE_DEPTH+BACK_OFFSET-10-260, 16, [true, true, true, 0]);
        translate([0,10+260+16,1116]) rotate([90,0,0]) sheet(260, 200, 16, [true, true, true, 0]);

        // Полки правые
        translate([16+260+110+16,10,Z_OFFSET + 180 + 20]) sheet(568, COUPE_DEPTH+BACK_OFFSET-10, 16, [true, true, true, 0]);
        translate([16+260+110+16,10,Z_OFFSET + 180*2 + 20*2 +16]) sheet(568, COUPE_DEPTH+BACK_OFFSET-10, 16, [true, true, true, 0]);
        translate([16+260+110+16,10,Z_OFFSET + 180*2 + 20*2 +16*2+300]) sheet(568, COUPE_DEPTH+BACK_OFFSET-10, 16, [true, true, true, 0]);
        translate([16+260+110+16,10,Z_OFFSET + 180*2 + 20*2 +16*3+300*2]) sheet(568, COUPE_DEPTH+BACK_OFFSET-10, 16, [true, true, true, 0]);
        translate([16+260+110+16,10,Z_OFFSET + 180*2 + 20*2 +16*4+300*2+262]) sheet(568, COUPE_DEPTH+BACK_OFFSET-10, 16, [true, true, true, 0]);

        translate([16+260+110+16+270,10,Z_OFFSET + 180*2 + 20*2 +16*4+300*2]) rotate([0,-90,0]) sheet(262, COUPE_DEPTH+BACK_OFFSET-10, 16, [true, true, true, 0]);
        translate([16+260+110+16+270,10,Z_OFFSET + 180*2 + 20*2 +16*4+300*2+16+262]) rotate([0,-90,0]) sheet(262, COUPE_DEPTH+BACK_OFFSET-10, 16, [true, true, true, 0]);

    }
}

module hinges() {
    translate([0,0,200]) {
        hinge();
        translate([970-25,0,0]) hinge();
    }
    translate([0,0,600]) {
        hinge();
        translate([970-25,0,0]) hinge();
    }
    translate([0,0,1200]) {
        hinge();
        translate([970-25,0,0]) hinge();
    }
    translate([0,0,1800]) {
        hinge();
        translate([970-25,0,0]) hinge();
    }
    translate([0,0,2100]) {
        hinge();
        translate([970-25,0,0]) hinge();
    }
}

module hinge() {
    color("Grey") cube([25,65,20]);
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
        translate([495,COUPE_DEPTH+3,10]) scale([1,-1,1]) rotate([180,-90,-90-dangle]) {
            door_sheet(h);
        }
    } else {
        translate([0,COUPE_DEPTH+3,10]) rotate([0,-90,-90-dangle]) {
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

module boxes() {

    color("Pink") {

        translate([40 + 240*0, 150,2080]) cube([220, 340, 160]);

        translate([2030, 0,Z_OFFSET]) stuk_1();
        translate([2030, 0,Z_OFFSET+180+20+16]) stuk_1();
        translate([2030+200+10, 0,Z_OFFSET+180+20+16+180+20+16]) stuk_2();
        translate([2030, 0,Z_OFFSET+180+20+16+180+20+16]) stuk_3();
        translate([2030+200+10, 0,Z_OFFSET+180+20+16+180+20+16+16+300]) stuk_2();
        translate([2030, 0,Z_OFFSET+180+20+16+180+20+16+16+300]) stuk_3();

        translate([45, -20,Z_OFFSET+200+16]) skub_1();
        translate([45, -20,Z_OFFSET]) skub_2();
        translate([515, -20,Z_OFFSET]) skub_2();

    }

}

module stuk_1() {
    // id 103.642.74
    cube([550,510,180]);
}

module stuk_2() {
    // id 903.644.87
    cube([340,510,180]);
}

module stuk_3() {
    // id 203.642.35
    cube([200,510,180]);
}

module skub_1() {
    // id 603.751.14
    cube([930,550,190]);
}

module skub_2() {
    // id 403.750.92
    cube([440,550,190]);
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

