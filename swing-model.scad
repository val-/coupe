
ROOM_WITH = 3003;
ROOM_HEIGTH = 2325;
BACK_OFFSET = 100;
Z_OFFSET=100 + 16;
COUPE_DEPTH = 550;

asmpad = 0;
dpad = 0;
dangle = 90;


translate([1500,1500,0]) toolbox();
translate([1500,2500,0]) toolbox2();


difference() {
    all();
    translate([-200,-4000-80,-200]) rotate([-0.5,0,0.8])  cube([3400,4000,4000]);
}

/*
color("Red") scale([1,-1,1]) {
    translate([-1,0,0]) cube([20,80,20]);
    translate([-1,0,2086-20]) cube([20,60,20]);
    translate([ROOM_WITH-1,0,0]) cube([20,35,20]);
    translate([ROOM_WITH-1,0,2086-20]) cube([20,20,20]);
}
*/

module all() {
    //room();

    racks();
    //doors();
    pedestal();

    container_1();
    container_2();
    container_3();

    boxes();

}

module pedestal() {
    translate([1,-BACK_OFFSET,100]) rotate([0,0,0]) sheet(1000, COUPE_DEPTH+BACK_OFFSET, 16, [true, true, 0, true]);
    translate([1001,-BACK_OFFSET,100]) rotate([0,0,0]) sheet(1001, COUPE_DEPTH+BACK_OFFSET, 16, [true, true, 0, true]);
    translate([2002,-BACK_OFFSET,100]) rotate([0,0,0]) sheet(1000, COUPE_DEPTH+BACK_OFFSET, 16, [true, true, 0, true]);
    translate([1,COUPE_DEPTH-40,0]) rotate([90,0,0]) sheet(1500, 98, 16, [true, true, true, true]);
    translate([1502,COUPE_DEPTH-40,0]) rotate([90,0,0]) sheet(1500, 98, 16, [true, true, true, true]);
    translate([1,-15,0]) pedestal_box();
    translate([1000,-15,0]) pedestal_box();
    translate([2000,-15,0]) pedestal_box();
}

module container_1() {
    translate([969+16,COUPE_DEPTH,0]) rotate([0,0,180]) {
        //#cube([969, COUPE_DEPTH, ROOM_HEIGTH]);
        hinges();
        translate([0,0,ROOM_HEIGTH-25]) sheet(969, 60, 25, [true, true, true, true]);
        translate([0,10,2050]) sheet(969, COUPE_DEPTH+BACK_OFFSET, 25, [true, true, true, 0]);
        translate([0,10,Z_OFFSET+350]) sheet(969, COUPE_DEPTH+BACK_OFFSET, 25, [true, true, true, 0]);
        commode1();
    }
}

module commode1() {

    // Верхушка
    translate([0,10,Z_OFFSET+801]) sheet(493, COUPE_DEPTH+BACK_OFFSET-10, 16, [true, true, true, 0]);

    //Боковина
    translate([16,10,Z_OFFSET+350+25]) rotate([0,-90,0]) sheet(801-350-25, COUPE_DEPTH-10, 16, [1, 1, 1, 1]);

    //Центральная стойка
    translate([(970+16)/2,10,Z_OFFSET+350+25]) rotate([0,-90,0]) sheet(801-350-25, COUPE_DEPTH+BACK_OFFSET-10, 16, [1, 1, 1, 0]);

    // Фасады
    face_width = 493-16-16-2-2;
    comode_z_base = Z_OFFSET + 350 + 25;
    translate([16+2,10+16-dpad*30, comode_z_base+2]) rotate([90,0,0]) sheet(face_width, 180, 16, [true, true, true, true], "V");
    translate([16+2,10+16-dpad*20, comode_z_base+2+180+32]) rotate([90,0,0]) sheet(face_width, 180, 16, [true, true, true, true], "V");

    //Ящики
    box_width = (970 - 16*2 - 4*4 - 16)/2;
    translate([16+4,16+10-dpad*30, comode_z_base+20]) box(180-20-30, 550, box_width, asmpad);
    translate([16+4,16+10-dpad*20, comode_z_base+20+180+32]) box(180-20-30, 550, box_width, asmpad);

}

module container_2() {
    translate([969+16+32+969,COUPE_DEPTH,0]) rotate([0,0,180]) {
        //#cube([969, COUPE_DEPTH, ROOM_HEIGTH]);
        hinges();
        translate([0,0,ROOM_HEIGTH-25]) sheet(969, 60, 25, [true, true, true, true]);
        translate([0,10,2050]) sheet(969, COUPE_DEPTH+BACK_OFFSET, 25, [true, true, true, 0]);
        commode2();
    }
}

module commode2() {

    translate([0,10,Z_OFFSET+200]) sheet(969, COUPE_DEPTH-10, 16, [1, 1, 1, 1]);
    translate([(969+25)/2,10,Z_OFFSET]) rotate([0,-90,0]) sheet(200, COUPE_DEPTH-10, 25, [1, 1, 1, 1]);

    // Верхушка
    translate([0,10,Z_OFFSET+800]) sheet(969, COUPE_DEPTH+BACK_OFFSET-10, 16, [true, true, true, 0]);
    //translate([0,65-16+25,Z_OFFSET+800+25]) rotate([90,0,0]) sheet(969, 80, 25, [true, true, true, true]);

    //Боковина
    translate([16,10,Z_OFFSET+200+16]) rotate([0,-90,0]) sheet(800-200-16, COUPE_DEPTH-10, 16, [1, 1, 1, 1]);
    translate([969,10,Z_OFFSET+200+16]) rotate([0,-90,0]) sheet(800-200-16, COUPE_DEPTH-10, 16, [1, 1, 1, 1]);

    //Центральная стойка
    translate([(969+25)/2,10,Z_OFFSET+200+16]) rotate([0,-90,0]) sheet(800-200-16, COUPE_DEPTH-10, 25, [1, 1, 1, 1]);


    // Фасады
    face_width = (969 - 16*2 - 2*4 - 25)/2;
    comode_z_base = Z_OFFSET + 200 + 16;
    translate([16+2,10+16-dpad*30, comode_z_base+2]) rotate([90,0,0]) sheet(face_width, 300, 16, [true, true, true, true], "V");
    translate([16+2,10+16-dpad*20, comode_z_base+2+300+32]) rotate([90,0,0]) sheet(face_width, 218, 16, [true, true, true, true], "V");
    translate([16+2+face_width+2+25+2,10+16-dpad*30, comode_z_base+2]) rotate([90,0,0]) sheet(face_width, 300, 16, [true, true, true, true], "V");
    translate([16+2+face_width+2+25+2,10+16-dpad*20, comode_z_base+2+300+32]) rotate([90,0,0]) sheet(face_width, 218, 16, [true, true, true, true], "V");

    //Ящики
    box_width = (969 - 16*2 - 4*4 - 25)/2;
    translate([16+4,16+10-dpad*30, comode_z_base+20]) box(300-20-30, 550, box_width, asmpad);
    translate([16+4,16+10-dpad*20, comode_z_base+20+300+32]) box(218-20-30, 550, box_width, asmpad);
    translate([16+4+box_width+4+25+4,16+10-dpad*30, comode_z_base+20]) box(300-20-30, 550, box_width, asmpad);
    translate([16+4+box_width+4+25+4,16+10-dpad*20, comode_z_base+20+300+32]) box(218-20-30, 550, box_width, asmpad);

}

module container_3() {
    translate([969+16+32+969+32+969,COUPE_DEPTH,0]) rotate([0,0,180]) {
        //#cube([969, COUPE_DEPTH, ROOM_HEIGTH]);
        hinges();
        translate([0,0,ROOM_HEIGTH-25]) sheet(969, 60, 25, [true, true, true, true]);
        translate([0,10,2050]) sheet(969, COUPE_DEPTH+BACK_OFFSET-10, 25, [true, true, true, 0]);
        translate([0,10,2050-330]) sheet(969, COUPE_DEPTH+BACK_OFFSET-10, 25, [true, true, true, 0]);

        //#translate([0, 0, Z_OFFSET]) cube([265,260,1300]);
        //#translate([265+16, 0, Z_OFFSET]) cube([105,500,1600]);

        translate([16+264,10,Z_OFFSET]) rotate([0,-90,0]) sheet(2050-330-Z_OFFSET, COUPE_DEPTH+BACK_OFFSET-10, 16, [true, true, true, 0]);
        translate([16+264+105+16,10,Z_OFFSET]) rotate([0,-90,0]) sheet(2050-330-Z_OFFSET, COUPE_DEPTH+BACK_OFFSET-10, 16, [true, true, true, 0]);

        translate([265+16+105,400,Z_OFFSET]) rotate([90,-90,0]) sheet(400, 105, 16, [true, true, true, true]);

        translate([0,10+260,400 + 350*0]) sheet(263, 306, 16, [true, true, true, true]);
        translate([0,10+260,400 + 350*1]) sheet(263, 306, 16, [true, true, true, true]);
        translate([0,10+260,400 + 350*2]) sheet(263, 303, 16, [true, true, true, true]);
        translate([0,10+260,400 + 350*3]) sheet(263, 301, 16, [true, true, true, true]);
        translate([0,10+260+16,1116]) rotate([90,0,0]) sheet(263, 200, 16, [true, true, true, true]);

        // Полки правые
        translate([16+264+105+16,10,Z_OFFSET + 180 + 20]) sheet(568, COUPE_DEPTH+BACK_OFFSET-10, 16, [true, true, true, 0]);
        translate([16+264+105+16,10,Z_OFFSET + 180*2 + 20*2 +16]) sheet(568, COUPE_DEPTH+BACK_OFFSET-10, 16, [true, true, true, 0]);
        translate([16+264+105+16,10,Z_OFFSET + 180*2 + 20*2 +16*2+300]) sheet(568, COUPE_DEPTH+BACK_OFFSET-10, 16, [true, true, true, 0]);
        translate([16+264+105+16,10,Z_OFFSET + 180*2 + 20*2 +16*3+300*2]) sheet(568, COUPE_DEPTH+BACK_OFFSET-10, 16, [true, true, true, 0]);
        translate([16+264+105+16,10,Z_OFFSET + 180*2 + 20*2 +16*4+300*2+262]) sheet(568, COUPE_DEPTH+BACK_OFFSET-10, 16, [true, true, true, 0]);

        translate([16+264+105+16+270,10,Z_OFFSET + 180*2 + 20*2 +16*4+300*2]) rotate([0,-90,0]) sheet(262, COUPE_DEPTH+BACK_OFFSET-10, 16, [true, true, true, 0]);
        translate([16+264+105+16+270,10,Z_OFFSET + 180*2 + 20*2 +16*4+300*2+16+262]) rotate([0,-90,0]) sheet(262, COUPE_DEPTH+BACK_OFFSET-10, 16, [true, true, true, 0]);

    }
}

module hinges() {
    translate([0,0,Z_OFFSET+100]) {
        hinge();
        translate([969-25,0,0]) hinge();
    }
    translate([0,0,Z_OFFSET+870]) {
        hinge();
        translate([969-25,0,0]) hinge();
    }
    translate([0,0,Z_OFFSET+1500]) {
        hinge();
        translate([969-25,0,0]) hinge();
    }
    translate([0,0,Z_OFFSET+2100]) {
        hinge();
        translate([969-25,0,0]) hinge();
    }
}

module hinge() {
    color("Grey") translate([0,0,-10]) cube([25,65,20]);
}

module racks() {
    translate([16,-BACK_OFFSET,Z_OFFSET]) rotate([0,-90,0]) sheet(ROOM_HEIGTH-Z_OFFSET, COUPE_DEPTH+BACK_OFFSET, 16, [true, true, 0, true]);
    translate([ROOM_WITH,-BACK_OFFSET,Z_OFFSET]) rotate([0,-90,0]) sheet(ROOM_HEIGTH-Z_OFFSET, COUPE_DEPTH+BACK_OFFSET, 16, [true, true, 0, true]);
    translate([ROOM_WITH-16-969,-BACK_OFFSET,Z_OFFSET]) rotate([0,-90,0]) sheet(ROOM_HEIGTH-Z_OFFSET, COUPE_DEPTH+BACK_OFFSET, 16, [true, true, 0, true]);
    translate([ROOM_WITH-16-16-969,-BACK_OFFSET,Z_OFFSET]) rotate([0,-90,0]) sheet(ROOM_HEIGTH-Z_OFFSET, COUPE_DEPTH+BACK_OFFSET, 16, [true, true, 0, true]);
    translate([16+16+969,-BACK_OFFSET,Z_OFFSET]) rotate([0,-90,0]) sheet(ROOM_HEIGTH-Z_OFFSET, COUPE_DEPTH+BACK_OFFSET, 16, [true, true, 0, true]);
    translate([16+32+969,-BACK_OFFSET,Z_OFFSET]) rotate([0,-90,0]) sheet(ROOM_HEIGTH-Z_OFFSET, COUPE_DEPTH+BACK_OFFSET, 16, [true, true, 0, true]);
}

module doors() {
    for (i =[0:5]) translate([5 + 500*i,COUPE_DEPTH*2+20,ROOM_HEIGTH]) rotate([180,0,0]) door(2215, i%2);
}

module door(h=2294, even) {
    echo("Door", h, 496);
    if(even) {
        translate([496,COUPE_DEPTH+3,10]) scale([1,-1,1]) rotate([180,-90,-90-dangle]) {
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
        sheet(h, 496, 19, [true, true, true, true]);
        translate([h-10-16-100,10,0]) #cube(20); 
        translate([h-10-16-870,10,0]) #cube(20); 
        translate([h-10-16-1500,10,0]) #cube(20);
        translate([h-10-16-2100,10,0]) #cube(20); 
        color("WhiteSmoke") {
            translate([80,80,-15]) cube([h/2-160, 496-160, 19]);
            translate([h/2 + 80,80,-15]) cube([h/2-160, 496-160, 19]);
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

        translate([1045, -20,Z_OFFSET]) skub_2();
        translate([1520, -20,Z_OFFSET]) skub_2();

        translate([30, -20,Z_OFFSET]) skub_3();
        translate([345, -20,Z_OFFSET]) skub_3();
        translate([660, -20,Z_OFFSET]) skub_3();

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


module skub_3() {
    // id 603.751.09
    cube([310,550,330]);
}

module sheet(length, width, thickness, edging, edging_letter="L") {
    
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


    saw_pad_width = (edging_letter == "L") ? ((!edging[2] && !edging[3]) ? 0 : 1) : 4;
    saw_pad_length = (edging_letter == "L") ? ((!edging[0] && !edging[1]) ? 0 : 1) : 4;

    saw_width = width-saw_pad_width;
    saw_length = length-saw_pad_length;

    edging_string_width = str(
        edging[0] ? edging_letter : "",
        edging[1] ? edging_letter : ""
    );

    edging_string_length = str(
        edging[2] ? edging_letter : "",
        edging[3] ? edging_letter : ""
    );

    echo(str(saw_length, "_", saw_width, "_", thickness, "_", edging_string_length, "_", edging_string_width));
    
}


module box(h, w, t, asmpad) {
    // Дно
    translate([16,16,12]) sheet(t-32,w-32,16);
    // Боковины
    translate([0-asmpad,0,0]) rotate([90,0,90]) sheet(w,h,16,[1,1,1,1]);
    translate([t-32+16+asmpad,0,0]) rotate([90,0,90]) sheet(w,h,16,[1,1,1,1]);
    // Лбы
    translate([16,16-asmpad,12]) rotate([90,0,0]) sheet(t-32,h-12,16,[0,0,1,1]);
    translate([16,w+asmpad,12]) rotate([90,0,0]) sheet(t-32,h-12,16,[0,0,1,1]);
}

module pedestal_box(h=98, w=508, t=999, asmpad=0) {
    // Боковины
    translate([0-asmpad,0,0]) rotate([90,0,90]) sheet(w,h,16,[1,1,1,1]);
    translate([t-32+16+asmpad,0,0]) rotate([90,0,90]) sheet(w,h,16,[1,1,1,1]);
    // Лбы
    translate([16,16-asmpad,0]) rotate([90,0,0]) sheet(t-32,h,16,[1,1,1,1]);
    translate([16,w+asmpad,0]) rotate([90,0,0]) sheet(t-32,h,16,[1,1,1,1]); 
}

module toolbox(h=216, w=350, t=316+32, asmpad=10) {
    // Дно
    translate([16,16,0]) sheet(t-32,w-32,16);
    // Боковины
    translate([0-asmpad,0,0]) rotate([90,0,90]) sheet(w,h,16,[1,1,1,1]);
    translate([t-32+16+asmpad,0,0]) rotate([90,0,90]) sheet(w,h,16,[1,1,1,1]);
    // Лбы
    translate([16,16-asmpad,0]) rotate([90,0,0]) sheet(t-32,h,16,[0,0,1,1]);
    translate([16,w+asmpad,0]) rotate([90,0,0]) sheet(t-32,h,16,[0,0,1,1]);
}

module toolbox2() {
    translate([16,16,0]) sheet(300,300,16,[1,1,1,1]);
    translate([0,0,0]) rotate([90,0,90]) sheet(250,100,16,[1,1,1,1]);
    translate([16,0,0]) rotate([90,0,0]) sheet(250,100,16,[1,1,1,1]);
}