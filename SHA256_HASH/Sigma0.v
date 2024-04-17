module Sigma0(out,in);
    input [31:0] in;
    output [31:0] out;

    wire [31:0] net [2:0] ;

    ROTR #(7) R7(net[0],in);
    ROTR #(18) R18(net[1],in);
    SHR #(3) S3(net[2],in);

    assign out = net[0] ^ net[1] ^ net[2];

endmodule