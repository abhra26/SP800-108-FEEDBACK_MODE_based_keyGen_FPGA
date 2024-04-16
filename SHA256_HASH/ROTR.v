module ROTR(out,in,N);
    input [31:0] in;
    parameter N;
    output [31:0] out;
    assign out = {in[N-1:0],in[31:N]};
endmodule