`timescale 1ns/1ns

module FullAdder (input cin,x,y,output s,cout);
    
    wire [2:0]a;

    xor #(3) first_xor(a[2],x,y);
    xor #(3) second_xor(s,cin,a[2]);
    and #(2) first_and(a[1],x,y);
    and #(2) second_and(a[0],a[2],cin);
    or #(2) last_or(cout,a[1],a[0]);
endmodule