`include "ROTR.v"
`include "SHR.v"
`include "add2.v"
`include "add3.v"
`include "add4.v"
`include "add5.v"
`include "Ch.v"
`include "Maj.v"

`include "Sigma0.v"
`include "Sigma1.v"
`include "CSigma0.v"
`include "CSigma1.v"
`include "wvar.v"

`include "Counter.v"
`include "Constants.v"
`include "Expansion.v"
`include "Compression.v"

module SHA256(data, eoc, hash_out, clk, rst, soc, rd);

	input  clk, rst, soc, rd;
	inout  [31:0] data;
	output eoc;
	output [31:0] hash_out;

	// Internal control signals:
	wire rst_n, soc_n;
	wire ieoc, ird;
	
	assign rst_n = ~rst;
	assign soc_n = ~soc;
	assign ird = rd & ieoc;

	// Bidirectional bus:
	wire [31:0] idata, odata;
	assign idata = data;
	assign data  = (ird)  ? odata : 32'bz;

	// Counter sub-module:
	wire sel;
	wire [5:0] addr;
	Counter u0(addr, ieoc, clk, soc_n, ird);
	assign sel = ieoc | addr[5] | addr[4];
	assign eoc = ieoc;

	// ROM sub-module:
	wire [31:0] k;
	Constants u1(k, addr);

	// Expansion sub-module:
	wire [31:0] msg;
	Expansion u2(msg, idata, clk, sel);

	// Compression sub-module:
	wire [255:0] hash;
	Compression u3(hash, msg, k, clk, rst, soc, ieoc);

	// Output MUX:
	wire [2:0]  abc;
	reg  [31:0] mux_out;
	assign abc = {addr[2], addr[1], addr[0]};
	
	always @(abc, hash) begin
		case(abc)
			0 : mux_out = hash[255:224];
			1 : mux_out = hash[223:192];
			2 : mux_out = hash[191:160];
			3 : mux_out = hash[159:128];
			4 : mux_out = hash[127:96];
			5 : mux_out = hash[95:64];
			6 : mux_out = hash[63:32];
			7 : mux_out = hash[31:0];
		endcase
	end

	assign odata = mux_out;
	assign hash_out = mux_out;

endmodule