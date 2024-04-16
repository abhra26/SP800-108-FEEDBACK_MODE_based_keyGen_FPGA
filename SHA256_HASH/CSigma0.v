module CSigma0 (out,in);
    input [31:0] in;
    output [31:0] out;
    wire [31:0] a,b,c;
    ROTR ror2(a,in,2);
    ROTR ror2(b,in,13);
    ROTR ror2(c,in,22);

    assign out = a^b^c;

endmodule