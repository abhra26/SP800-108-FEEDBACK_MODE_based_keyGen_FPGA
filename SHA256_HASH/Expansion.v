module Expansion(out,in,clk,sel);
    input [31:0] in;
    input clk,sel;
    output [31:0] out; 

    reg [31:0] mem [0:15];

    wire [31:0] mux_out,sig0,sig1;
    wire [31:0] a0,a1,a9,a14,sum;

    always @(posedge clk) begin

        mem[0] <= mem[1];
        mem[1] <= mem[2];
        mem[2] <= mem[3];
        mem[3] <= mem[4];
        mem[4] <= mem[5];
        mem[5] <= mem[6];
        mem[6] <= mem[7];
        mem[7] <= mem[8];
        mem[8] <= mem[9];
        mem[9] <= mem[10];
        mem[10] <= mem[11];
        mem[11] <= mem[12];
        mem[12] <= mem[13];
        mem[13] <= mem[14];
        mem[14] <= mem[15];
        mem[15] <= mux_out;

    end

    assign a0 = mem[0];
    assign a1 = mem[1];
    assign a9 = mem[9];
    assign a14 = mem[14];

    Sigma0 obj0(sig0,a1);
    Sigma1 obj1(sig1,a14);
    add4 sum_out(sum,sig0,sig1,a0,a9);

    assign mux_out = (sel) ? sum : in;
    assign out = mux_out;


endmodule