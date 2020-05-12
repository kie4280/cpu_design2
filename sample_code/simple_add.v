`timescale 1ns/1ps
//張宸愷 0710018

module add(A, B, CIN, COUT, SUM);

	input A, B, CIN;
	output COUT, SUM;

	assign {COUT, SUM} = A + B + CIN;
	
endmodule