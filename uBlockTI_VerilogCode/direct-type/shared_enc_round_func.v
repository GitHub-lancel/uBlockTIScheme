`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:08:48 08/21/2023 
// Design Name: 
// Module Name:    shared_enc_round_func 
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
module shared_enc_round_func(
	input				clk,
	
	input		[127:0]	round_input0,
	input		[127:0]	round_input1,
		
	input		[127:0]	round_key0,
	input		[127:0]	round_key1,
		
	output		[127:0]	round_output0,
	output		[127:0]	round_output1
    );
	
	// intermediate
	wire	[63:0]	text_msb_00;
	wire	[63:0]	text_msb_01;
	
	wire	[63:0]	text_lsb_00;
	wire	[63:0]	text_lsb_01;
	
	wire	[63:0]	text_msb_10;
	wire	[63:0]	text_msb_11;
	
	wire	[63:0]	text_lsb_10;
	wire	[63:0]	text_lsb_11;
	
	wire	[63:0]	text_msb_20;
	wire	[63:0]	text_msb_21;
	
	wire	[63:0]	text_lsb_20;
	wire	[63:0]	text_lsb_21;
	
	wire	[63:0]	text_msb_30;
	wire	[63:0]	text_msb_31;
	
	wire	[63:0]	text_lsb_30;
	wire	[63:0]	text_lsb_31;
	
	wire	[63:0]	text_msb_40;
	wire	[63:0]	text_msb_41;
	
	wire	[63:0]	text_lsb_40;
	wire	[63:0]	text_lsb_41;
	
	wire	[63:0]	text_msb_50;
	wire	[63:0]	text_msb_51;
	
	wire	[63:0]	text_lsb_50;
	wire	[63:0]	text_lsb_51;
	
	wire	[63:0]	text_msb_60;
	wire	[63:0]	text_msb_61;
							 
	wire	[63:0]	text_lsb_60;
	wire	[63:0]	text_lsb_61;
	
	wire	[63:0]	text_msb_70;
	wire	[63:0]	text_msb_71;
							 
	wire	[63:0]	text_lsb_70;
	wire	[63:0]	text_lsb_71;
	
	assign text_msb_00 = round_input0[127:64] ^ round_key0[127:64];
	assign text_msb_01 = round_input1[127:64] ^ round_key1[127:64];
	
	assign text_lsb_00 = round_input0[63:00] ^ round_key0[63:00];
	assign text_lsb_01 = round_input1[63:00] ^ round_key1[63:00];
	
	assign text_lsb_20 = text_msb_10 ^ text_lsb_10;
	assign text_lsb_21 = text_msb_11 ^ text_lsb_11;
	
	assign text_msb_20 = text_msb_10 ^ text_lsb_30;
	assign text_msb_21 = text_msb_11 ^ text_lsb_31;
	
	assign text_lsb_40 = text_msb_30 ^ text_lsb_20;
	assign text_lsb_41 = text_msb_31 ^ text_lsb_21;
	
	assign text_msb_40 = text_msb_20 ^ text_lsb_50;
	assign text_msb_41 = text_msb_21 ^ text_lsb_51;
	
	assign text_lsb_60 = text_msb_50 ^ text_lsb_40;
	assign text_lsb_61 = text_msb_51 ^ text_lsb_41;
	
	assign text_msb_60 = text_msb_40 ^ text_lsb_60;
	assign text_msb_61 = text_msb_41 ^ text_lsb_61;
	
	assign round_output0[127:64] = text_msb_70;
	assign round_output1[127:64] = text_msb_71;
	
	assign round_output0[63:00] = text_lsb_70;
	assign round_output1[63:00] = text_lsb_71;
	
	shared_s_box_array shared_s_box_array_msb(
	.clk				(clk),
	
	.sbox_array_input0	(text_msb_00),
	.sbox_array_input1	(text_msb_01),
	
	.sbox_array_output0	(text_msb_10),
	.sbox_array_output1	(text_msb_11)
    );
	
	shared_s_box_array shared_s_box_array_lsb(
	.clk				(clk),
	
	.sbox_array_input0	(text_lsb_00),
	.sbox_array_input1	(text_lsb_01),
							  
	.sbox_array_output0	(text_lsb_10),
	.sbox_array_output1	(text_lsb_11)
    );
	
	// <<< 4
	shared_block_left_circular_shift_4bit shared_block_left_circular_shift_4bit_Inst(
	.block_left_circular_shift_input0		(text_lsb_20),
	.block_left_circular_shift_input1		(text_lsb_21),
	
    .block_left_circular_shift_output0		(text_lsb_30),
    .block_left_circular_shift_output1		(text_lsb_31)
    );
	
	// <<< 8
	shared_block_left_circular_shift_8bit shared_block_left_circular_shift_8bit_Inst0(
	.block_left_circular_shift_input0		(text_msb_20),
	.block_left_circular_shift_input1		(text_msb_21),
	
    .block_left_circular_shift_output0		(text_msb_30),
    .block_left_circular_shift_output1		(text_msb_31)
    );
	
	// <<< 8
	shared_block_left_circular_shift_8bit shared_block_left_circular_shift_8bit_Inst1(
	.block_left_circular_shift_input0		(text_lsb_40),
	.block_left_circular_shift_input1		(text_lsb_41),
	
    .block_left_circular_shift_output0		(text_lsb_50),
    .block_left_circular_shift_output1		(text_lsb_51)
    );
	
	// <<< 20
	shared_block_left_circular_shift_20bit shared_block_left_circular_shift_20bit_Inst(
	.block_left_circular_shift_input0		(text_msb_40),
	.block_left_circular_shift_input1		(text_msb_41),
	
    .block_left_circular_shift_output0		(text_msb_50),
    .block_left_circular_shift_output1		(text_msb_51)
    );
	
	shared_permutation_left shared_permutation_left_Inst(
	.permutation_input0						(text_msb_60),
	.permutation_input1						(text_msb_61),
	
    .permutation_output0					(text_msb_70),
    .permutation_output1					(text_msb_71)
    );
	
	shared_permutation_right shared_permutation_right_Inst(
	.permutation_input0						(text_lsb_60),
	.permutation_input1						(text_lsb_61),
	
    .permutation_output0					(text_lsb_70),
    .permutation_output1					(text_lsb_71)
    );


endmodule
