module wvar(H_out,X_out,in,H0,clk,rst,soc,eoc);

    input clk,rst,soc,eoc;
    input [31:0] in,H0;
    output [31:0] H_out, X_out;

    reg [31:0] A,A0;

    wire [31:0] dA,dA0,add_out;

    always @(posedge clk) begin
        A = dA;
        A0 = dA0;
    end 

    add2 u0(add_out,A,A0);

    assign dA0 = (rst) ? H0 : (soc) ? add_out : A0;
	assign dA  = (rst) ? 32'd 0 : (soc) ? add_out : (eoc) ? A : in;

    assign X_out = A;
    assign H_out = add_out;
    
endmodule