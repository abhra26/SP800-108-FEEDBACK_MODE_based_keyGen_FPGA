module add4 (out,a,b,c,d);
    input [31:0] a,b,c,d ;
    output [31:0] out;
    assign out = a+b+c+d;
endmodule