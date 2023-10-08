`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:53:03 08/15/2023 
// Design Name: 
// Module Name:    shared_key_expansion_round_func 
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
module shared_key_expansion_round_func(
	input			clk,
	input			rstn,
	
	input			round_const_ena,
	input			round_cnt,
	
	input	[127:0]	full_pre_round_key_input0,
	input	[127:0]	full_pre_round_key_input1,
	
	input	[127:0]	full_round_key_input0,
	input	[127:0]	full_round_key_input1,
	
	output	[127:0]	full_round_key_output0,
	output	[127:0]	full_round_key_output1
    );
	
	// intermediate
	wire	[31:0]	round_constant;
	
	wire	[31:0]	inter_round_key_p3_00;
	wire	[31:0]	inter_round_key_p3_01;
	
	wire	[31:0]	inter_pre_round_key_p3_00;
	wire	[31:0]	inter_pre_round_key_p3_01;
	
	wire	[31:0]	inter_round_key_p3_10;
	wire	[31:0]	inter_round_key_p3_11;
	
	wire	[31:0]	inter_round_key_p3_20;
	wire	[31:0]	inter_round_key_p3_21;
	
	wire	[31:0]	inter_round_key_p2_00;
	wire	[31:0]	inter_round_key_p2_01;
	
	wire	[31:0]	inter_pre_round_key_p2_00;
	wire	[31:0]	inter_pre_round_key_p2_01;
	
	wire	[31:0]	inter_pre_round_key_p2_10;
	wire	[31:0]	inter_pre_round_key_p2_11;
	
	wire	[31:0]	inter_round_key_p1_00;
	wire	[31:0]	inter_round_key_p1_01;
	
	wire	[31:0]	inter_round_key_p0_00;
	wire	[31:0]	inter_round_key_p0_01;
	
	assign inter_round_key_p3_10 = inter_round_key_p3_00 ^ round_constant;
	assign inter_round_key_p3_11 = inter_round_key_p3_01;
	
	assign inter_round_key_p1_00 = inter_round_key_p3_20 ^ full_pre_round_key_input0[63:32];
	assign inter_round_key_p1_01 = inter_round_key_p3_21 ^ full_pre_round_key_input1[63:32];
	
	assign inter_round_key_p0_00 = inter_pre_round_key_p2_10 ^ full_pre_round_key_input0[31:00];
	assign inter_round_key_p0_01 = inter_pre_round_key_p2_11 ^ full_pre_round_key_input1[31:00];
	
	assign full_round_key_output0[127:096] = inter_round_key_p1_00;
	assign full_round_key_output0[095:064] = inter_round_key_p0_00;
	assign full_round_key_output0[063:032] = inter_pre_round_key_p2_00;
	assign full_round_key_output0[031:000] = inter_pre_round_key_p3_00;
	
	assign full_round_key_output1[127:096] = inter_round_key_p1_01;
	assign full_round_key_output1[095:064] = inter_round_key_p0_01;
	assign full_round_key_output1[063:032] = inter_pre_round_key_p2_01;
	assign full_round_key_output1[031:000] = inter_pre_round_key_p3_01;
	
	// shared pk function
	shared_permutation_key shared_permutation_key_Inst0(
	.permutation_input0				(full_round_key_input0[127:64]),
	.permutation_input1				(full_round_key_input1[127:64]),
	
	.permutation_output0			({inter_round_key_p3_00, inter_round_key_p2_00}),
	.permutation_output1			({inter_round_key_p3_01, inter_round_key_p2_01})
    );
	
	shared_permutation_key shared_permutation_key_Inst1(
	.permutation_input0				(full_pre_round_key_input0[127:64]),
	.permutation_input1				(full_pre_round_key_input1[127:64]),
	
	.permutation_output0			({inter_pre_round_key_p3_00, inter_pre_round_key_p2_00}),
	.permutation_output1			({inter_pre_round_key_p3_01, inter_pre_round_key_p2_01})
    );
	
	// round constant
	round_constant_gen round_constant_gen_Inst(
	.clk							(clk),
	.rstn							(rstn),
	
	.round_const_ena				(round_const_ena),
	.round_cnt						(round_cnt),
	.round_constant					(round_constant)
    );
	
	// shared sbox
	shared_sbox_array_for_key shared_sbox_array_for_key_Inst(
	.clk							(clk),
	
	.sbox_array_input0				(inter_round_key_p3_10),
	.sbox_array_input1				(inter_round_key_p3_11),
	
	.sbox_array_output0				(inter_round_key_p3_20),
	.sbox_array_output1				(inter_round_key_p3_21)
    );
	
	// shared transformation
	shared_transformation_array shared_transformation_array_Inst(
	.transformation_array_input0	(inter_pre_round_key_p2_00),
	.transformation_array_input1	(inter_pre_round_key_p2_01),
	
	.transformation_array_output0	(inter_pre_round_key_p2_10),
	.transformation_array_output1	(inter_pre_round_key_p2_11)
    );
	
endmodule
