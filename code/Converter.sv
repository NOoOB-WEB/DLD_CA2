`timescale 1ns/1ns

module Converter (input [3:0]x,output [3:0]b); 
    wire temp_n; 
    not first_n(temp_n,g[3]);
    not first_n(b[3],temp_n);

    xor #(3) first_xor(b[2],b[3],x[2]),
    second_xor(b[1],b[2],x[1]),
    third_xor(b[0],b[1],x[0]);

    
endmodule