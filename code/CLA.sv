`timescale 1ns/1ns

module CLA(input [3:0]A,B,input cin,output cout,c3,output [3:0]s);
    
    wire [2:1]c;
    wire [3:0]t;

    wire[3:0]go;
    wire[3:0]po;

    wire c1;

    wire [3:0]c2;

    wire [7:0]c3;

    wire [15:0]c4;

    // g outs
    and #(2) g0(go[0],A[0],B[0]);
    and #(2) g1(go[1],A[1],B[1]);
    and #(2) g2(go[2],A[2],B[2]);
    and #(2) g3(go[3],A[3],B[3]);

    //p outs
    or #(2) p0(po[0],A[0],B[0]);
    or #(2) p0(po[1],A[1],B[1]);
    or #(2) p0(po[2],A[2],B[2]);
    or #(2) p0(po[3],A[3],B[3]);

    //c1
    and #(2) c1_first(c1,go[0],cin);
    or #(2) c1_second(c[1],c1,po[0]);

    //c2
    and #(2) c2_first(c2[0],po[0],cin);
    and #(2) c2_second(c2[1],c2[0],po[1]);
    and #(2) c2_third(c2[2],go[0],po[1]);
    or #(2) c2_fourth(c2[3],c2[2],c2[1]);
    or #(2) c2_fifth(c[2],c2[3],go[1]);

    //c3
    and #(2) c3_first(c3[0],po[0],cin);
    and #(2) c3_second(c3[1],po[2],po[1]);
    and #(2) c3_third(c3[2],c3[0],c3[1]);

    and #(2) c3_forth(c3[3],po[0],po[1]);
    and #(2) c3_fifth(c3[4],po[2],c3[3]);

    and #(2) c3_sixth(c3[5],po[2],go[1]);

    or #(2) c3_seventh(c3[6],go[2],c3[5]);
    or #(2) c3_eighth(c3[7],c3[4],c3[2]);
    or #(2) c3_ninth(c[3],c3[7],c3[6]);

    //c4
    and #(2) c4_first();
    and #(2) c4_first();
    and #(2) c4_first();
    and #(2) c4_first();
    and #(2) c4_first();

    and #(2) c4_first();
    and #(2) c4_first();
    and #(2) c4_first();

    and #(2) c4_first();
    and #(2) c4_first();
    and #(2) c4_first();

    and #(2) c4_first();
    and #(2) c4_first();


    //sums
    xor #(3) first_xor_s0(t[0],A[0],B[0]);
    xor #(3) second_xor_s0(s[0],t[0],cin);
   
    xor #(3) first_xor_s1(t[1],A[1],B[1]);
    xor #(3) second_xor_s1(s[1],c[1],t[1]);
   
    xor #(3) first_xor_s2(t[2],A[2],B[2]);
    xor #(3) second_xor_s2(s[2],c[2],t[2]);

    xor #(3) first_xor_s3(t[3],A[3],B[3]);
    xor #(3) second_xor_s3(s[3],c[3],t[3]);


endmodule