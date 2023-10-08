`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:32:15 08/21/2023 
// Design Name: 
// Module Name:    shared_enc_core 
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
module shared_enc_core(
	input				clk,
	input				rstn,
	
	input				enc_ena,
	input		[04:00]	enc_round_cnt,
	
	input		[127:0]	plain0,
	input		[127:0]	plain1,
	
	input		[127:0]	round_key0,
	input		[127:0]	round_key1,
	
	output  	[127:0]	cipher0,
	output 	 	[127:0]	cipher1
    );
	
	// intermediate
	wire		[127:0]	enc_round_result_q0;
	wire		[127:0]	enc_round_result_q1;
	
	wire		[127:0]	enc_round_result_d0;
	wire		[127:0]	enc_round_result_d1;
	
	assign enc_round_result_q0 = (enc_round_cnt == 5'd0) ? plain0 : enc_round_result_d0;
	assign enc_round_result_q1 = (enc_round_cnt == 5'd0) ? plain1 : enc_round_result_d1;
	
	assign cipher0 = enc_round_result_d0 ^ round_key0;
	assign cipher1 = enc_round_result_d1 ^ round_key1;
	
	shared_enc_round_func shared_enc_round_func_Inst(
	.clk				(clk),
	
	.round_input0		(enc_round_result_q0),
	.round_input1		(enc_round_result_q1),
	
	.round_key0			(round_key0),
	.round_key1			(round_key1),
	
	.round_output0		(enc_round_result_d0),
	.round_output1		(enc_round_result_d1)
    );
	
endmodule


