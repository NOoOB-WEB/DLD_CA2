`timescale 1ns/1ns

module Converter (input [3:0]g,output [3:0]b); 
    wire temp_n; 
    not first_n(temp_n,g[3]);
    not second_n(b[3],temp_n);

    xor #(3) first_xor(b[2],b[3],g[2]),
    second_xor(b[1],b[2],g[1]),
    third_xor(b[0],b[1],g[0]);

    
endmodule