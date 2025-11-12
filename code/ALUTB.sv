`timescale 1ns/1ns

module ALUTB ();

logic [3:0]A,B;
logic [1:0]op;
wire [3:0]result;
wire overflow,zero;

ALU instant(A,B,op,overflow,zero,result);

initial begin
    A = 4'sd2;
    B = 4'sd3;
    op = 2'b00;

    #200
    A = 4'sd2;
    B = 4'sd3;
    op = 2'b01;

    #200
    A = 4'sd0;
    B = 4'sd0;
    op = 2'b01;

    #200
    A = 4'sd4;
    B = 4'sd4;
    op = 2'b00;


    #200
    A = 4'sd3;
    B = 4'sd5;
    op = 2'b10;
    
    #200
    A = 4'sd5;
    B = 4'sd3;
    op = 2'b10;


end
endmodule