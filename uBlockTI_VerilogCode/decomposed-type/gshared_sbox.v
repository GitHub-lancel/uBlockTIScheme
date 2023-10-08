`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:31:22 08/15/2023 
// Design Name: 
// Module Name:    GSharedSbox 
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
module gshared_sbox(
	input				clk,
	
	input	[03:00]		d0c0b0a0,
	input	[03:00]		d1c1b1a1,
	
	input	[01:00]		guards,
	
	output	[03:00]		h0g0f0e0,
	output	[03:00]		h1g1f1e1
    );
	
	// intermediate
	wire 				d0, d1;
	wire 				c0, c1;
	wire 				b0, b1;
	wire 				a0, a1;
	
	wire				ra;
	wire				rb;
	
	wire				e0, e1;
	wire				f0, f1;
	wire				f2, f3;
	wire				g0, g1;
	wire				g2, g3;
	wire				h0, h1;
	
	reg					e0_r, e1_r;
	reg					f0_r, f1_r;
	reg					f2_r, f3_r;
	reg					g0_r, g1_r;
	reg					g2_r, g3_r;
	reg					h0_r, h1_r;
	
	wire				f0f1, f2f3;
	wire				g0g1, g2g3;
	
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
	
	// Masking scheme
	assign e0 = a0;
	assign e1 = a1;
	
	assign f0 = (a0 & d0)                ^ ra;
	assign f1 = (a0 & d1) ^ a0 ^ b0      ^ ra;
	assign f2 = (a1 & d0) ^ d0           ^ ra;
	assign f3 = (a1 & d1) ^ a1 ^ b1 ^ d1 ^ ra;
	
	assign g0 = (a0 & b0) ^ 1'b1	^ rb;
	assign g1 = (a0 & b1) ^ d1 		^ rb;
	assign g2 = (a1 & b0) ^ c0 		^ rb;
	assign g3 = (a1 & b1) ^ c1 ^ d1 ^ rb;
	
	assign h0 = c1 ^ d1;
	assign h1 = c1 ^ d0;
	
	// store;
	always @(posedge clk) e0_r <= e0;
	always @(posedge clk) e1_r <= e1;
	
	always @(posedge clk) f0_r <= f0;
	always @(posedge clk) f1_r <= f1;
	always @(posedge clk) f2_r <= f2;
	always @(posedge clk) f3_r <= f3;
	
	always @(posedge clk) g0_r <= g0;
	always @(posedge clk) g1_r <= g1;
	always @(posedge clk) g2_r <= g2;
	always @(posedge clk) g3_r <= g3;
	
	always @(posedge clk) h0_r <= h0;
	always @(posedge clk) h1_r <= h1;
	
	assign f0f1 = f0_r ^ f1_r;
	assign f2f3 = f2_r ^ f3_r;
	
	assign g0g1 = g0_r ^ g1_r;
	assign g2g3 = g2_r ^ g3_r;
	
	assign h0g0f0e0 = {h0_r, g0g1, f0f1, e0_r};
	assign h1g1f1e1 = {h1_r, g2g3, f2f3, e1_r};
	
endmodule
