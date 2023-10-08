`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:10:34 08/15/2023 
// Design Name: 
// Module Name:    uBlock_enc_decompose_top 
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
module uBlock_enc_decompose_top(
	input			clk,
	input			rstn,
	
	input	[127:0]	plain0,
	input	[127:0]	plain1,
	
	input	[127:0]	key0,
	input	[127:0]	key1,
	
	input			start,
	
	output	[127:0]	cipher0,
	output	[127:0]	cipher1,
	output			done,
	
	output	reg		occupied
    );
	
	// intermediate
	wire	[127:0]	enc_full_round_key0;
	wire	[127:0]	enc_full_round_key1;
	wire 			enc_done;
	
	assign done = enc_done;
	
	// key expansion
	shared_key_expansion shared_key_expansion_Inst(
	.clk				(clk),
	.rstn				(rstn),
	
	.key_exp_ena		(occupied),
	
	.mkey0				(key0),
	.mkey1				(key1),
	
	.full_round_key0	(enc_full_round_key0),
	.full_round_key1	(enc_full_round_key1)
    );
	
	// encryption
	shared_enc_core shared_enc_core_Inst(
	.clk				(clk),
	.rstn				(rstn),
	
	.enc_ena			(occupied),
	
	.plain0				(plain0),
	.plain1				(plain1),
	
	.round_key0			(enc_full_round_key0),
	.round_key1			(enc_full_round_key1),
	
	.cipher0			(cipher0),
	.cipher1			(cipher1),
	.done				(enc_done)
    );
	
	// control
	always @(posedge clk or negedge rstn)
	begin
		if(~rstn)
			occupied <= 1'b0;
		else if(start & ~occupied)
			occupied <= 1'b1;
		else if(enc_done)
			occupied <= 1'b0;
		else
			occupied <= occupied;
	end
	
endmodule
