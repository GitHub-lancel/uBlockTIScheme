`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:02:08 08/14/2023 
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
module shared_sbox(
	input				clk,
	
	input	[03:00]		d0c0b0a0,
	input	[03:00]		d1c1b1a1,
	input	[03:00]		guards,
	
	output	[03:00]		h0g0f0e0,
	output	[03:00]		h1g1f1e1
    );
	
	// intermediate
	wire	[03:00]		h0g0f0e0_f;
	wire	[03:00]		h1g1f1e1_f;
	
	wire	[03:00]		h0g0f0e0_g;
	wire	[03:00]		h1g1f1e1_g;
	
	reg		[01:00]		guards_r;
	
	// guards
	always @(posedge clk) guards_r <= guards[01:00];
	
	// Fun
	fshared_sbox fshared_sbox_Inst(
	.clk				(clk),
	
	.d0c0b0a0			(d0c0b0a0),
	.d1c1b1a1			(d1c1b1a1),
	
	.guards				(guards[03:02]),
	
	.h0g0f0e0			(h0g0f0e0_f),
	.h1g1f1e1			(h1g1f1e1_f)
    );
	
	// Gun
	gshared_sbox gshared_sbox_Inst(
	.clk				(clk),
	
	.d0c0b0a0			(h0g0f0e0_f),
	.d1c1b1a1			(h1g1f1e1_f),
	
	.guards				(guards_r),
	
	.h0g0f0e0			(h0g0f0e0_g),
	.h1g1f1e1			(h1g1f1e1_g)
    );
	
	assign h0g0f0e0 = h0g0f0e0_g;
	assign h1g1f1e1 = h1g1f1e1_g;
	
endmodule
