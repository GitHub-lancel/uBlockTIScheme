`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:43:12 08/18/2023 
// Design Name: 
// Module Name:    shared_key_expansion 
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
module shared_key_expansion(
	input					clk,
	input					rstn,
	
	input					key_exp_ena,
	input		[04:00]		key_exp_round_cnt,
	
	input		[127:0]		mkey0,
	input		[127:0]		mkey1,
	
	output 		[127:0]		full_round_key0,
	output 		[127:0]		full_round_key1
    );
	
	// intermediate
	wire		[127:0]		full_round_key_q0;
	wire		[127:0]		full_round_key_q1;
	
	wire		[127:0]		full_round_key_d0;
	wire		[127:0]		full_round_key_d1;
	
	reg 		[127:0]		full_round_keyr_0;
	reg 		[127:0]		full_round_keyr_1;
	
	assign full_round_key0 = (key_exp_round_cnt == 5'd0) ? mkey0 : full_round_key_d0;
	assign full_round_key1 = (key_exp_round_cnt == 5'd0) ? mkey1 : full_round_key_d1;
	
	assign full_round_key_q0 = (key_exp_round_cnt == 5'd0) ? mkey0 : full_round_key_d0;
	assign full_round_key_q1 = (key_exp_round_cnt == 5'd0) ? mkey1 : full_round_key_d1;
	
	// shared key expansion round function
	shared_key_expansion_round_func shared_key_expansion_round_func_Inst(
	.clk						(clk),
	.rstn						(rstn),
	
	.round_const_ena			(key_exp_ena),
	
	.full_pre_round_key_input0	(full_round_keyr_0),
	.full_pre_round_key_input1	(full_round_keyr_1),
	
	.full_round_key_input0		(full_round_key_q0),
	.full_round_key_input1		(full_round_key_q1),
	
	.full_round_key_output0		(full_round_key_d0),
	.full_round_key_output1		(full_round_key_d1)
    );
	
	// full_round_keyr
	always @(posedge clk or negedge rstn)
	begin
		if(~rstn) begin
			full_round_keyr_0 <= 128'd0;
			full_round_keyr_1 <= 128'd0;
		end
		else if(key_exp_round_cnt == 0) begin
			full_round_keyr_0 <= mkey0;
			full_round_keyr_1 <= mkey1;
		end
		else begin
			full_round_keyr_0 <= full_round_key_d0;
			full_round_keyr_1 <= full_round_key_d1;
		end
	end
	
endmodule
