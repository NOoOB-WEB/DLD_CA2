`timescale 1ns/1ns

module ALU (input [3:0]A,B,input [1:0]op,output overflow,zero,output [3:0]result);

    //selecting carry
    wire [3:0]sb;
    wire carry;

    xor #(3) carry_select(carry,op[0],op[1]);

    xor #(3) first(sb[0],carry,B[0]);
    xor #(3) second(sb[1],carry,B[1]);
    xor #(3) third(sb[2],carry,B[2]);
    xor #(3) fourth(sb[3],carry,B[3]);

    //adding numbers
    wire c3;
    wire cout;
    wire [3:0]s;

    RCA(A,sb,carry,cout,c3,s);

    //overflow
    xor #(3) overflow_signal(overflow,c3,cout);

    //zero
    wire [3:0] zero_signals;

    and #(2) first_and(zero_signals[0],s[3],s[2]);
    not #(1) first_not(zero_signals[1],zero_signals[0]);
    
    and #(2) second_and(zero_signals[2],s[1],s[0]);
    not #(1) second_not(zero_signals[3],zero_signals[2]);

    and #(2) last_and(zero,zero_signals[1],zero_signals[3]);

    //absolute

    wire [3:0]as;
    wire [3:0]xs;
    wire [3:0]xc;

    xor #(3) c0_xor(xs[0],s[3],s[0]);
    xor #(3) c1_xor(xs[1],s[3],s[1]);
    xor #(3) c2_xor(xs[2],s[3],s[2]);
    xor #(3) c3_xor(xs[3],s[3],s[3]);

    xor #(3) as0_xor(as[0],s[3],xs[0]);
    and #(2) c0_and(xc[0],s[3],xs[0]);     

    xor #(3) as1_xor(as[1],xc[0],xs[1]);
    and #(2) c1_and(xc[0],xc[0],xs[1]);     

    xor #(3) as2_xor(as[2],s[3],xs[2]);
    and #(2) c3_and(xc[0],xc[1],xs[2]);     

    xor #(3) c1_xor(as[3],s[3],xs[3]);
    and #(2) c4_and(xc[0],xc[2],xs[3]);    


endmodule