`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2019 02:51:46
// Design Name: 
// Module Name: BCD
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


module BCD(
    input up,
    input down,
    input set9,
    input set0,
    input clock,
    output D,
    output C,
    output B,
    output A,
    output cout,
    output bout
    );
    reg D,C,B,A,cout,bout;
    reg [3:0] display;
    //reset
    always @(posedge clock)
        begin
            if(set0==1)
                begin
                    display = 2'b0000;
                end
            else if(set9==1)
                begin
                  display=2'b1001;
                end
            cout=0;
            bout=0;
        end
//    //+
    always @(posedge clock && set9==0 && set0==0)
        begin
              if(display[3]==1 && display[2]==0 && display[1]==1 && display[0]==0 && up==1)
                begin
                    display=2'b0000;
                    cout=1;
                end
              else if(up==1)
                begin
                    display=display+1;
                end
        end
     
     //-
     always @(posedge clock && set9==0 && set0==0)
        begin 
            if(display[3]==0 && display[2]==0  && display[1]==0 && display[0]==0 && down==1)
                begin 
                    display=2'b1001;
                    cout=0;
                    bout=1;
                end
            else if(down==1) 
                begin
                    display=display-1;
                end
        end
     always @(*)
        begin 
            {D,C,B,A}=display;  
        end
endmodule
