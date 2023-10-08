`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:25:10 08/15/2023 
// Design Name: 
// Module Name:    shared_sbox_array_for_key 
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
module shared_sbox_array_for_key(
	input				clk,
	
	input	[31:0]	sbox_array_input0,
	input	[31:0]	sbox_array_input1,
	
	output	[31:0]	sbox_array_output0,
	output	[31:0]	sbox_array_output1
    );
	
	shared_sbox shared_sbox_Inst0(
	.clk			(clk),
	
	.d0c0b0a0		(sbox_array_input0[31:28]),
	.d1c1b1a1		(sbox_array_input1[31:28]),
	.guards			(sbox_array_input0[27:24]),
	
	.h0g0f0e0		(sbox_array_output0[31:28]),
	.h1g1f1e1		(sbox_array_output1[31:28])
    );
	
	shared_sbox shared_sbox_Inst1(
	.clk			(clk),
	
	.d0c0b0a0		(sbox_array_input0[27:24]),
	.d1c1b1a1		(sbox_array_input1[27:24]),
	.guards			(sbox_array_input0[23:20]),
	
	.h0g0f0e0		(sbox_array_output0[27:24]),
	.h1g1f1e1		(sbox_array_output1[27:24])
    );
	
	shared_sbox shared_sbox_Inst2(
	.clk			(clk),
	
	.d0c0b0a0		(sbox_array_input0[23:20]),
	.d1c1b1a1		(sbox_array_input1[23:20]),
	.guards			(sbox_array_input0[19:16]),
	
	.h0g0f0e0		(sbox_array_output0[23:20]),
	.h1g1f1e1		(sbox_array_output1[23:20])
    );
	
	shared_sbox shared_sbox_Inst3(
	.clk			(clk),
	
	.d0c0b0a0		(sbox_array_input0[19:16]),
	.d1c1b1a1		(sbox_array_input1[19:16]),
	.guards			(sbox_array_input0[15:12]),
	
	.h0g0f0e0		(sbox_array_output0[19:16]),
	.h1g1f1e1		(sbox_array_output1[19:16])
    );
	
	shared_sbox shared_sbox_Inst4(
	.clk			(clk),
	
	.d0c0b0a0		(sbox_array_input0[15:12]),
	.d1c1b1a1		(sbox_array_input1[15:12]),
	.guards			(sbox_array_input0[11:08]),
	
	.h0g0f0e0		(sbox_array_output0[15:12]),
	.h1g1f1e1		(sbox_array_output1[15:12])
    );
	
	shared_sbox shared_sbox_Inst5(
	.clk			(clk),
	
	.d0c0b0a0		(sbox_array_input0[11:08]),
	.d1c1b1a1		(sbox_array_input1[11:08]),
	.guards			(sbox_array_input0[07:04]),
	
	.h0g0f0e0		(sbox_array_output0[11:08]),
	.h1g1f1e1		(sbox_array_output1[11:08])
    );
	
	shared_sbox shared_sbox_Inst6(
	.clk			(clk),
	
	.d0c0b0a0		(sbox_array_input0[07:04]),
	.d1c1b1a1		(sbox_array_input1[07:04]),
	.guards			(sbox_array_input0[03:00]),
	
	.h0g0f0e0		(sbox_array_output0[07:04]),
	.h1g1f1e1		(sbox_array_output1[07:04])
    );
	
	shared_sbox shared_sbox_Inst7(
	.clk			(clk),
	
	.d0c0b0a0		(sbox_array_input0[03:00]),
	.d1c1b1a1		(sbox_array_input1[03:00]),
	.guards			(sbox_array_input0[31:28]),
	
	.h0g0f0e0		(sbox_array_output0[03:00]),
	.h1g1f1e1		(sbox_array_output1[03:00])
    );

endmodule
