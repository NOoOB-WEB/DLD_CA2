`timescale 1ns/1ns

module ALUCore (input [3:0]g0,g1,input [0,1]op,output overflow,zero,output [3:1]b);
wire [3:0]temp_b0;
wire [3:0]temp_b1;
wire [3:0]result;
wire [3:0]number_output;

Converter first_converter(g0,temp_b0);
Converter first_converter(g1,temp_b1);

ALU alu(temp_b0,temp_b1,op,overflow,zero,result);

ReverseConverter reverse(result,number_output);

endmodule