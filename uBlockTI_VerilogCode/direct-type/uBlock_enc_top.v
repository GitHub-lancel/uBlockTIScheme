`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:42:16 08/18/2023 
// Design Name: 
// Module Name:    uBlock_enc_top 
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
module uBlock_enc_top(
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
	
	reg		[04:00]	round_cnt;
	
	assign done = (round_cnt == 16) ? 1'b1 : 1'b0;
	
	// key expansion
	shared_key_expansion shared_key_expansion_Inst(
	.clk				(clk),
	.rstn				(rstn),
	
	.key_exp_ena		(occupied),
	.key_exp_round_cnt	(round_cnt),
	
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
	.enc_round_cnt		(round_cnt),
	
	.plain0				(plain0),
	.plain1				(plain1),
	
	.round_key0			(enc_full_round_key0),
	.round_key1			(enc_full_round_key1),
	
	.cipher0			(cipher0),
	.cipher1			(cipher1)
    );
    
	// control
	always @(posedge clk or negedge rstn)
	begin
		if(~rstn) begin
			occupied <= 1'b0;
		end
		else if(start & ~occupied) begin
			occupied <= 1'b1;
		end
		else if(done) begin
			occupied <= 1'b0;
		end
		else begin
			occupied <= occupied;
		end
	end
	
	// round_cnt
	always @(posedge clk or negedge rstn)
	begin
		if(~rstn) begin
			round_cnt <= 0;
		end
		else if(round_cnt == 5'd16) begin
			round_cnt <= 5'd0;
		end
		else if(occupied) begin
			round_cnt <= round_cnt + 1'b1;
		end
		else begin
			round_cnt <= 5'd0;
		end
	end
	
endmodule
