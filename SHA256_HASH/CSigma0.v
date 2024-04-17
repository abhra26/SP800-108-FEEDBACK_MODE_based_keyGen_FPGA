module CSigma0 (out,in);

    input [31:0] in;
    output [31:0] out;
    wire [31:0] a,b,c;

    ROTR #(2) ror2(a,in);
    ROTR #(13) ror13(b,in);
    ROTR #(22) ror22(c,in);

    assign out = a ^ b ^ c;

endmodule