module CSigma0 (out,in);

    input [31:0] in;
    output [31:0] out;
    wire [31:0] net [2:0];

    ROTR #(2) ror2(net[0],in);
    ROTR #(13) ror13(net[1],in);
    ROTR #(22) ror22(net[2],in);

    assign out = net[0] ^ net[1] ^ net[2];

endmodule