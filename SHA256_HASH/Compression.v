module Compression(hash, Wt, Kt, clk, rst, soc,eoc);

    input clk,rst,soc,eoc;
    input [31:0] Wt, Kt;
    output [255:0] hash;

    wire [31:0] A, B, C, D, E, F, G, H;

    wire [31:0] Ha, Hb, Hc, Hd, He, Hf, Hg, Hh;
	
	wire [31:0] addE, addA;
	wire [31:0] T1,T2, maj, ch,se,sa;

    wvar 	 uA(Ha, A, addA, 32'h6a09e667, clk, rst, soc, eoc);
	wvar 	 uB(Hb, B,    A, 32'hbb67ae85, clk, rst, soc, eoc);
	wvar 	 uC(Hc, C,    B, 32'h3c6ef372, clk, rst, soc, eoc);
	wvar 	 uD(Hd, D,    C, 32'ha54ff53a, clk, rst, soc, eoc);
	wvar 	 uE(He, E, addE, 32'h510e527f, clk, rst, soc, eoc);
	wvar 	 uF(Hf, F,    E, 32'h9b05688c, clk, rst, soc, eoc);
	wvar 	 uG(Hg, G,    F, 32'h1f83d9ab, clk, rst, soc, eoc);
	wvar 	 uH(Hh, H,    G, 32'h5be0cd19, clk, rst, soc, eoc);

    CSigma1 ue(se,E);
    CSigma0 ua(sa,A);

    Maj umaj(maj,A,B,C);
    Ch uch(ch,E,F,G);

    add5 ut1(T1, H,se,ch,Kt,Wt);
    add2 ut2(T2,sa,maj);

    add2 uaddA(addA,T1,T2);
    add2 uaddE(addE,D,T1);

    assign hash = {Ha, Hb, Hc, Hd, He, Hf, Hg, Hh};

endmodule