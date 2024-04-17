module add5(out, a, b, c, d, e);

	input  [31:0] a, b, c, d, e;
	output [31:0] out;

	assign out = a + b + c + d + e;

endmodule