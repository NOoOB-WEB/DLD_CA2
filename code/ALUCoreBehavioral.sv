`timescale 1ns/1ns

module ALUCoreBehavioral (input [3:0]g1,g2,input [1:0]op,output Zero,Overflow,output [3:0]R);
    
    //Converting from gray to binary
    wire [3:0]b1;
    wire [3:0]b2;

    assign b1[3] = g1[3];
    assign #(3) b1[2] = b1[3] ^ g1[2];
    assign #(6) b1[1] = b1[2] ^ g1[1];
    assign #(9) b1[0] = b1[1] ^ g1[0];

    assign b2[3] = g2[3];
    assign #(3) b2[2] = b2[3] ^ g2[2];
    assign #(6) b2[1] = b2[2] ^ g2[1];
    assign #(9) b2[0] = b2[1] ^ g2[0];

    // selecting carry
    wire c_and_s_or_a;
    wire [3:0]sb;

    assign #(3) c_and_s_or_a = op[0] ^ op[1];

    assign #(3) sb[0] = c_and_s_or_a ^ b2[0];
    assign #(3) sb[1] = c_and_s_or_a ^ b2[1];
    assign #(3) sb[2] = c_and_s_or_a ^ b2[2];
    assign #(3) sb[3] = c_and_s_or_a ^ b2[3];

    //adding
    wire cout;
    wire [3:1]c;
    wire [3:0]s;

    assign #(2) go[0] = b1[0] & sb[0];
    assign #(2) go[1] = b1[1] & sb[1];  
    assign #(2) go[2] = b1[2] & sb[2];  
    assign #(2) go[3] = b1[3] & sb[3];

    assign #(3) po[0] = b1[0] ^ sb[0];
    assign #(3) po[1] = b1[1] ^ sb[1];  
    assign #(3) po[2] = b1[2] ^ sb[2];  
    assign #(3) po[3] = b1[3] ^ sb[3]; 

    assign #(7) c[1] = go[0] | (po[0] & cin);
    assign #(9) c[2] = go[1] | (po[1] & go[0]) | (po[1] & po[0] & cin);   
    assign #(11) c[3] = go[2] | (po[2] & go[1]) | (po[2] & po[1] & go[0]) | (po[2] & po[1] & po[0] & cin);   
    assign #(13) cout = go[3] | (po[3] & go[2]) | (po[3] & po[2] & go[1]) | (po[3] & po[2] & po[1] & go[0]) | (po[3] & po[2] & po[1] & po[0] & cin);

    assign #(6) s[0] = b1[0] ^ sb[0] ^ cin;
    assign #(10) s[1] = b1[1] ^ sb[1] ^ c[1];    
    assign #(12) s[2] = b1[2] ^ sb[2] ^ c[2];    
    assign #(14) s[3] = b1[3] ^ sb[3] ^ c[3];    

    //overflow

    assign #(3) Overflow = cout ^ c[3];

    //zero

    assign #(5) Zero = ~(s[0] | s[1]) & ~(s[2] | s[3]);

    //abs

    wire [3:0] abs;
    assign #(3)  
endmodule