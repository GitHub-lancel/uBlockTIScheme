`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:58:53 08/15/2023 
// Design Name: 
// Module Name:    shared_permutation_key 
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
module shared_permutation_key(
	input	[63:0]	permutation_input0,
	input	[63:0]	permutation_input1,
	
	output	[63:0]	permutation_output0,
	output	[63:0]	permutation_output1
    );
	
	// share0
	assign permutation_output0[63:60] = permutation_input0[39:36];
	assign permutation_output0[59:56] = permutation_input0[63:60];
	assign permutation_output0[55:52] = permutation_input0[31:28];
	assign permutation_output0[51:48] = permutation_input0[11:08];
	assign permutation_output0[47:44] = permutation_input0[59:56];
	assign permutation_output0[43:40] = permutation_input0[03:00];
	assign permutation_output0[39:36] = permutation_input0[43:40];
	assign permutation_output0[35:32] = permutation_input0[23:20];
	assign permutation_output0[31:28] = permutation_input0[47:44];
	assign permutation_output0[27:24] = permutation_input0[27:24];
	assign permutation_output0[23:20] = permutation_input0[15:12];
	assign permutation_output0[19:16] = permutation_input0[55:52];
	assign permutation_output0[15:12] = permutation_input0[19:16];
	assign permutation_output0[11:08] = permutation_input0[51:48];
	assign permutation_output0[07:04] = permutation_input0[35:32];
	assign permutation_output0[03:00] = permutation_input0[07:04];
	
	// share1
	assign permutation_output1[63:60] = permutation_input1[39:36];
	assign permutation_output1[59:56] = permutation_input1[63:60];
	assign permutation_output1[55:52] = permutation_input1[31:28];
	assign permutation_output1[51:48] = permutation_input1[11:08];
	assign permutation_output1[47:44] = permutation_input1[59:56];
	assign permutation_output1[43:40] = permutation_input1[03:00];
	assign permutation_output1[39:36] = permutation_input1[43:40];
	assign permutation_output1[35:32] = permutation_input1[23:20];
	assign permutation_output1[31:28] = permutation_input1[47:44];
	assign permutation_output1[27:24] = permutation_input1[27:24];
	assign permutation_output1[23:20] = permutation_input1[15:12];
	assign permutation_output1[19:16] = permutation_input1[55:52];
	assign permutation_output1[15:12] = permutation_input1[19:16];
	assign permutation_output1[11:08] = permutation_input1[51:48];
	assign permutation_output1[07:04] = permutation_input1[35:32];
	assign permutation_output1[03:00] = permutation_input1[07:04];
	
endmodule
