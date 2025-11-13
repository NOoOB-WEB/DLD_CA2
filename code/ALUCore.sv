`timescale 1ns/1ns

module ALUCore (input [3:0]g0,g1,input [1:0]op,output overflow,zero,output [3:0]b);

wire [3:0]temp_b0;
wire [3:0]temp_b1;
wire [3:0]number_output;

Converter first_converter(g0,temp_b0);
Converter second_converter(g1,temp_b1);

ALU alu(temp_b0,temp_b1,op,overflow,zero,number_output);

ReverseConverter reverse(number_output,b);

endmodule