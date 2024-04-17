module add3(out, a, b, c);

	input  [31:0] a, b, c;
	output [31:0] out;

	assign out = a + b + c;

endmodule