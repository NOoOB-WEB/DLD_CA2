`timescale 1ns/1ns


module ALUCoreTB();

logic [3:0] A,B;
logic [1:0]op;
wire overflow,zero;
wire [3:0]s;

ALUCore instant(A,B,op,overflow,zero,s);

initial begin
    
    A = 4'b0011;
    B = 4'b0010;
    op = 2'b01;

    #100
    A = 4'b0010;
    B = 4'b0011;
    op = 2'b10;

    #100
    A = 4'b0110;
    B = 4'b0111;
    op = 2'b00;

    #100
    A = 4'b0011;
    B = 4'b0011;
    op = 2'b01;
end
    
endmodule