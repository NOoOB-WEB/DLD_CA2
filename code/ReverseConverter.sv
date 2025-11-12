`timescale 1ns/1ns

module ReverseConverter (input [3:0]b,output [3:0]g); 
    buf temp(g[3],b[3]);
    xor #(3) first_xor(g[2],b[3],b[2]),
    second_xor(g[1],b[2],b[1]),
    third_xor(g[0],b[1],b[0]);
    
endmodule