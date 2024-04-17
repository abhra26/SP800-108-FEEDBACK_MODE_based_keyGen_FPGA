module Sigma1(out,in);
    input [31:0] in;
    output [31:0] out;

    wire [31:0] o1,o2,o3;

    ROTR #(17) R7(o1,in);
    ROTR #(19) R18(o2,in);
    SHR #(10) S3(o3,in);

    assign out = o1 ^ o2 ^ o3;

endmodule