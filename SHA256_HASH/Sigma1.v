`include "ROTR.v"
`include "SHR.v"

module Sigma1(out,in);
    input [31:0] in;
    output [31:0] out;

    wire o1 o2 o3;

    ROTR R7(o1,in,17);
    ROTR R18(o2,in,19);
    SHR S3(o3,in,10);

    assign out = o1^o2^o3;

endmodule