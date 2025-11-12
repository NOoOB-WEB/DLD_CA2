`timescale 1ns/1ns

module RCA(input [3:0]A,B,input cin,output cout,c3,output [3:0]s);

    wire [2:1]c;

    FullAdder stage0(cin,A[0],B[0],s[0],c[1]);
    FullAdder stage1(c[1],A[1],B[1],s[1],c[2]);
    FullAdder stage2(c[2],A[2],B[2],s[2],c3);
    FullAdder stage3(c3,A[3],B[3],s[3],cout);
    
endmodule