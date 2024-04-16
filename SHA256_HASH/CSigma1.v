module CSigma1 (out,in);
    input [31:0] in;
    output [31:0] out;
    wire [31:0] a,b,c;
    ROTR ror2(a,in,6);
    ROTR ror2(b,in,11);
    ROTR ror2(c,in,25);

    assign out = a^b^c;

endmodule
