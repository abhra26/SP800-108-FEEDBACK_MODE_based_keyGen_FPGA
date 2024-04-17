module Sigma0(out,in);
    input [31:0] in;
    output [31:0] out;

    wire o1,o2,o3;

    ROTR #(7) R7(o1,in);
    ROTR #(18) R18(o2,in);
    SHR #(3) S3(o3,in);

    assign out = o1 ^ o2 ^ o3;

endmodule