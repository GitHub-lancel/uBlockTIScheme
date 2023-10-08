`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:31:43 08/15/2023 
// Design Name: 
// Module Name:    SharedSbox 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module SharedSbox(
	input				clk,
	
	input	[03:00]		d0c0b0a0,
	input	[03:00]		d1c1b1a1,
	
	input	[09:00]		guards,
	
	output	[03:00]		h0g0f0e0,
	output	[03:00]		h1g1f1e1
    );
	
	// intermediate
	wire 				d0, d1;
	wire 				c0, c1;
	wire 				b0, b1;
	wire 				a0, a1;
	
	wire				e0, e1, e2, e3;
	
	wire				f0, f1, f2, f3;
	wire				f4, f5, f6, f7;
	
	wire				g0, g1, g2, g3;
	wire				g4, g5, g6, g7;
	
	wire				h0, h1, h2, h3;
	
	reg					e0_r, e1_r, e2_r, e3_r;
	
	reg					f0_r, f1_r, f2_r, f3_r;
	reg					f4_r, f5_r, f6_r, f7_r;
	
	reg					g0_r, g1_r, g2_r, g3_r;
	reg					g4_r, g5_r, g6_r, g7_r;
	
	reg					h0_r, h1_r, h2_r, h3_r;
	
	wire				e0e1, e2e3;
	wire				f0f1f2f3, f4f5f6f7;
	wire				g0g1g2g3, g4g5g6g7;
	wire				h0h1, h2h3;
	
	wire 				rj;
	wire 				ri;
					
	wire 				rh;
	wire 				rg;
	wire 				rf;
	wire 				re;
					
	wire 				rd;
	wire 				rc;
	wire 				rb;
	wire 				ra;
	
	assign rj = guards[9];
	assign ri = guards[8];
	
	assign rh = guards[7];
	assign rg = guards[6];
	assign rf = guards[5];
	assign re = guards[4];
	
	assign rd = guards[3];
	assign rc = guards[2];
	assign rb = guards[1];
	assign ra = guards[0];
	
	assign d0 = d0c0b0a0[3];
	assign c0 = d0c0b0a0[2];
	assign b0 = d0c0b0a0[1];
	assign a0 = d0c0b0a0[0];
	
	assign d1 = d1c1b1a1[3];
	assign c1 = d1c1b1a1[2];
	assign b1 = d1c1b1a1[1];
	assign a1 = d1c1b1a1[0];
	
	assign e0 = (c0 & d0) ^ 1'b1 ^ rj;
	assign e1 = (c1 & d1) ^ a0   ^ rj;
	assign e2 = (c0 & d1)        ^ rj;
	assign e3 = (c1 & d0) ^ a1   ^ rj;
	
	assign f0 = (a0 & b0 & c0) ^ (a0 & b0) ^ (a0 & d0)                         ^ a0 ^ 1'b1    ^ rh ^ rg;
	assign f1 = (a0 & b0 & c1)                         ^ (b0 & c1)             ^ a0 ^ c1      ^ rg ^ rf;
	assign f2 = (a0 & b1 & c0)             ^ (a0 & c0)                         ^ a0 ^ d1      ^ rf ^ re;
	assign f3 = (a0 & b1 & c1) ^ (a0 & b1) ^ (a0 & c1) ^ (b1 & c1) ^ (a0 & d1) ^ b1 ^ c1 ^ d1 ^ re ^ rh;
	
	assign f4 = (a1 & b0 & c0) ^ (a1 & d0) ^ (c0 & d0) 						   ^ a1 ^ c0 ^ d0 ^ rh ^ rg;
	assign f5 = (a1 & b0 & c1) ^ (a1 & b0) ^ (b0 & c1) ^ (c1 & d0) 			   ^ b0 ^ d0      ^ rg ^ rf;
	assign f6 = (a1 & b1 & c0) ^ (a1 & b1) ^ (a1 & c0) ^ (a1 & d1) ^ (c0 & d1) ^ c0           ^ rf ^ re;
	assign f7 = (a1 & b1 & c1) ^ (a1 & c1) ^ (b1 & c1) ^ (c1 & d1)                            ^ re ^ rh;
	
	assign g0 = (b0 & c0 & d1) ^ (c0 & d1) 											^ 1'b1    ^ rd ^ rc;
	assign g1 = (b1 & c0 & d0) ^ a0 ^ b1 ^ d0 												  ^ rc ^ rb;
	assign g2 = (b0 & c1 & d0) ^ (b0 & c1) 													  ^ rb ^ ra;
	assign g3 = (b1 & c1 & d1) ^ (b1 & c1) ^ (c1 & d1) ^ a1 ^ c1 ^ d1 						  ^ ra ^ rd;
	
	assign g4 = (b0 & c0 & d0) ^ (a0 & b0) ^ a0 ^ b0 										  ^ rd ^ rc;
	assign g5 = (b1 & c0 & d1) ^ (a0 & b1) ^ (c0 & d1) ^ b1 ^ c0 ^ d1 						  ^ rc ^ rb;
	assign g6 = (b0 & c1 & d1) ^ (a1 & b0) ^ (b0 & c1) ^ (c1 & d1) 							  ^ rb ^ ra;
	assign g7 = (b1 & c1 & d0) ^ (a1 & b1) ^ (b1 & c1) ^ a1 ^ b1 ^ d0 						  ^ ra ^ rd;
	
	assign h0 = (b0 & c0)           ^ ri;
	assign h1 = (b0 & c1) ^ b0 ^ d1 ^ ri;
	assign h2 = (b1 & c0) ^ c0 ^ d0 ^ ri;
	assign h3 = (b1 & c1) ^ b1 ^ c1 ^ ri;
	
	// store
	always @(posedge clk) e0_r <= e0;
	always @(posedge clk) e1_r <= e1;
	always @(posedge clk) e2_r <= e2;
	always @(posedge clk) e3_r <= e3;
	
	always @(posedge clk) f0_r <= f0;
	always @(posedge clk) f1_r <= f1;
	always @(posedge clk) f2_r <= f2;
	always @(posedge clk) f3_r <= f3;
	always @(posedge clk) f4_r <= f4;
	always @(posedge clk) f5_r <= f5;
	always @(posedge clk) f6_r <= f6;
	always @(posedge clk) f7_r <= f7;
	
	always @(posedge clk) g0_r <= g0;
	always @(posedge clk) g1_r <= g1;
	always @(posedge clk) g2_r <= g2;
	always @(posedge clk) g3_r <= g3;
	always @(posedge clk) g4_r <= g4;
	always @(posedge clk) g5_r <= g5;
	always @(posedge clk) g6_r <= g6;
	always @(posedge clk) g7_r <= g7;
	
	always @(posedge clk) h0_r <= h0;
	always @(posedge clk) h1_r <= h1;
	always @(posedge clk) h2_r <= h2;
	always @(posedge clk) h3_r <= h3;
	
	assign e0e1 = e0_r ^ e1_r;
	assign e2e3 = e2_r ^ e3_r;
	
	assign f0f1f2f3 = f0_r ^ f1_r ^ f2_r ^ f3_r;
	assign f4f5f6f7 = f4_r ^ f5_r ^ f6_r ^ f7_r;
	
	assign g0g1g2g3 = g0_r ^ g1_r ^ g2_r ^ g3_r;
	assign g4g5g6g7 = g4_r ^ g5_r ^ g6_r ^ g7_r;
	
	assign h0h1 = h0_r ^ h1_r;
	assign h2h3 = h2_r ^ h3_r;
	
	assign h0g0f0e0 = {h0h1, g0g1g2g3, f0f1f2f3, e0e1};
	assign h1g1f1e1 = {h2h3, g4g5g6g7, f4f5f6f7, e2e3};
	
endmodule
