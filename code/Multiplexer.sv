`timescale 1ns/1ns

module Multiplexer (input in0,in1,input s,output out);
    wire [1:0]w;
    wire n0;

    not #(1) not0(n0,s);
    and #(2) first_and(w[0],n0,in0),
    second_and(w[1],s,in1);
    or #(2) last_or(out,w[0],w[1]);
    
endmodule