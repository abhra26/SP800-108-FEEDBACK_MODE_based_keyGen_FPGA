module SHR(out,in);

    input [31:0] in;
    parameter N = 1;
    output[31:0] out;
    assign out = (in >> N) ;
    
endmodule