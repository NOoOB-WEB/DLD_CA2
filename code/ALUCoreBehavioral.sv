`timescale 1ns/1ns

module ALUCoreBehavioral (input [3:0]g1,g2,input [1:0]op,output Zero,Overflow,output [3:0]R);
    
    //Converting from gray to binary
    wire [3:0]b1;
    wire [3:0]b2;

    assign b1[3] = g1[3];
    assign b1[2] = b1[3] ^ g1[2];
    assign b1[1] = b1[2] ^ g1[1];
    assign b1[0] = b1[1] ^ g1[0];

    assign b2[3] = g2[3];
    assign b2[2] = b2[3] ^ g2[2];
    assign b2[1] = b2[2] ^ g2[1];
    assign b2[0] = b2[1] ^ g2[0];

    // selecting carry
    wire c_and_s_or_a;
    assign c_and_s_or_a = op[0] ^ op[1];

    //adding
    wire [3:0]c;
    //overflow


    //zero

endmodule