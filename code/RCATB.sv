`timescale 1ns/1ns

module RCATB ();

logic [3:0]A,B;
wire [3:0]s;
logic cin;
wire cout;

RCA instant(.cin(cin),.cout(cout),.A(A),.B(B),.s(s));

initial begin
    A = 4'sd2;
    B = 4'sd3;
    cin = 1'b0;

    #50;
    A = 4'sd1;
    B = 4'sd3;
    cin = 1'b0;

    #50; 
    A = -4'sd3;
    B = 4'sd5;
    cin = 1'b0;
    
    #50; 
    A = 4'sd2;
    B = -4'sd5;
    cin = 1'b0;

end
    
endmodule