module CSigma1 (out,in);
    input [31:0] in;
    output [31:0] out;
    wire [31:0] net [2:0];

    ROTR #(6) ror6(net[0],in);
    ROTR #(11) ror11(net[1],in);
    ROTR #(25) ror25(net[2],in);

    assign out = net[0]^net[1]^net[2];

endmodule
