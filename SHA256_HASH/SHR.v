module SHR(out,in,N);
    input [31:0] in;
    parameter N;
    output[31:0] out;
    assign out = (in >> N) ;
endmodule