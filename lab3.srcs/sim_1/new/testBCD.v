`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2019 03:21:55
// Design Name: 
// Module Name: testBCD
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module testBCD();
    reg up,down,set9,set0,clock;
    wire D,C,B,A,cout,bout;
    BCD bcd1(up,down,set9,set0,clock,D,C,B,A,cout,bout);
    initial
        begin
        $monitor("%d %d %d %d %d %d",D,C,B,A,cout,bout);
            #0  
                up=0;
                down=0;
                clock=0;
                set9=0;
                set0=1;
//             #25 
//                set0=0;
//                up=1;
             #50
                set0=0;
                set9=1;
                up=0;
                down=0;
//             #75
//                set9=0;
//                down=1;
             #100 $finish;
        end
    always
        #10
            clock=~clock;
endmodule
