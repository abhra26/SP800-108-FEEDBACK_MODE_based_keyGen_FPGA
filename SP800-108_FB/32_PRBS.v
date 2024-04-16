module 32_PRBS (out,data,clk,sel,rst);

    input [255:0] data;
    input clk,sel,rst;

    wire PRBS_OUT, MUX_OUT;
    wire w32,w22,w2,w1;
    reg[31:0] PRBS;

    output out;

    always @(posedge clk) begin

        PRBS[0] <= PRBS[1];
        PRBS[1] <= PRBS[2];
        PRBS[2] <= PRBS[3];
        PRBS[3] <= PRBS[4];
        PRBS[4] <= PRBS[5];
        PRBS[5] <= PRBS[6];
        PRBS[6] <= PRBS[7];
        PRBS[7] <= PRBS[8];
        PRBS[8] <= PRBS[9];
        PRBS[9] <= PRBS[10];
        PRBS[10] <= PRBS[11];
        PRBS[11] <= PRBS[12];
        PRBS[12] <= PRBS[13];
        PRBS[13] <= PRBS[14];
        PRBS[14] <= PRBS[15];
        PRBS[15] <= PRBS[16];
        PRBS[16] <= PRBS[17];
        PRBS[17] <= PRBS[18];
        PRBS[18] <= PRBS[19];
        PRBS[19] <= PRBS[20];
        PRBS[20] <= PRBS[21];
        PRBS[21] <= PRBS[22];
        PRBS[22] <= PRBS[23];
        PRBS[23] <= PRBS[24];
        PRBS[24] <= PRBS[25];
        PRBS[25] <= PRBS[26];
        PRBS[26] <= PRBS[27];
        PRBS[27] <= PRBS[28];
        PRBS[28] <= PRBS[29];
        PRBS[29] <= PRBS[30];
        PRBS[30] <= PRBS[31];
        PRBS[31] <= MUX_OUT;

    end

    assign w32 = PRBS[31];
    assign w22 = PRBS[21];
    assign w2 = PRBS[1];
    assign w1 = PRBS[0];
    assign PRBS_OUT = w32 ^ w22 ^ w2 ^ w1;

    assign MUX_OUT = (sel) ? PRBS_OUT : data;

    assign out = PRBS[0]; 

endmodule