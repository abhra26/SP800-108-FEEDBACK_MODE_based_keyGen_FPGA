module CSigma1 (out,in);
    input [31:0] in;
    output [31:0] out;
    wire [31:0] a,b,c;
    ROTR #(6) ror6(a,in);
    ROTR #(11) ror11(b,in);
    ROTR #(25) ror25(c,in);

    assign out = a^b^c;

endmodule
