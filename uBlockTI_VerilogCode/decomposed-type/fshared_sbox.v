`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:10:54 08/14/2023 
// Design Name: 
// Module Name:    FSharedSbox 
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
module fshared_sbox(
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
	wire				e2, e3;
	wire				f0, f1;
	wire				g0, g1;
	wire				h0, h1;
	wire				h2, h3;
	
	reg					e0_r, e1_r;
	reg					e2_r, e3_r;
	reg					f0_r, f1_r;
	reg					g0_r, g1_r;
	reg					h0_r, h1_r;
	reg					h2_r, h3_r;
	
	wire				e0e1, e2e3;
	wire				h0h1, h2h3;
	
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
	assign e0 = (c0 & d0)      ^ 1'b1 ^ ra;
	assign e1 = (c1 & d1) ^ a0     	  ^ ra;
	assign e2 = (c0 & d1)             ^ ra;
	assign e3 = (c1 & d0) ^ a1 	      ^ ra;
	
	assign f0 = b0;
	assign f1 = b1;
	
	assign g0 = c1;
	assign g1 = c0;
	
	assign h0 = (b0 & c0) 			^ rb;
	assign h1 = (b0 & c1) ^ b0 ^ d1 ^ rb;
	assign h2 = (b1 & c0) ^ c0 ^ d0 ^ rb;
	assign h3 = (b1 & c1) ^ b1 ^ c1 ^ rb;
	
	// store;
	always @(posedge clk) e0_r <= e0;
	always @(posedge clk) e1_r <= e1;
	always @(posedge clk) e2_r <= e2;
	always @(posedge clk) e3_r <= e3;
	
	always @(posedge clk) f0_r <= f0;
	always @(posedge clk) f1_r <= f1;
	
	always @(posedge clk) g0_r <= g0;
	always @(posedge clk) g1_r <= g1;
	
	always @(posedge clk) h0_r <= h0;
	always @(posedge clk) h1_r <= h1;
	always @(posedge clk) h2_r <= h2;
	always @(posedge clk) h3_r <= h3;
	
	assign e0e1 = e0_r ^ e1_r;
	assign e2e3 = e2_r ^ e3_r;
	
	assign h0h1 = h0_r ^ h1_r;
	assign h2h3 = h2_r ^ h3_r;
	
	assign h0g0f0e0 = {h0h1, g0_r, f0_r, e0e1};
	assign h1g1f1e1 = {h2h3, g1_r, f1_r, e2e3};

endmodule
