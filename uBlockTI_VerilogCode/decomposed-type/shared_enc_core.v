`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:09:46 08/16/2023 
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
	
	input		[127:0]	plain0,
	input		[127:0]	plain1,
	
	input		[127:0]	round_key0,
	input		[127:0]	round_key1,
	
	output  	[127:0]	cipher0,
	output 	 	[127:0]	cipher1,
	output 				done
    );
	
	// intermediate
	wire		[127:0]	enc_round_result_q0;
	wire		[127:0]	enc_round_result_q1;
	
	wire		[127:0]	enc_round_result_d0;
	wire		[127:0]	enc_round_result_d1;
	
	reg			[3:0]	enc_round_cnt;
	reg					enc_each_round_cnt;
	
	assign enc_round_result_q0 = (enc_ena == 0) ? plain0 : enc_round_result_d0;
	assign enc_round_result_q1 = (enc_ena == 0) ? plain1 : enc_round_result_d1;
	
	assign cipher0 = enc_round_result_d0 ^ round_key0;
	assign cipher1 = enc_round_result_d1 ^ round_key1;
	assign done = ((enc_round_cnt == 15) && (enc_each_round_cnt == 1'b1)) ? 1'b1 : 1'b0;
	
	shared_enc_round_func shared_enc_round_func_Inst(
	.clk				(clk),
	
	.round_input0		(enc_round_result_q0),
	.round_input1		(enc_round_result_q1),
	
	.round_key0			(round_key0),
	.round_key1			(round_key1),
	
	.round_output0		(enc_round_result_d0),
	.round_output1		(enc_round_result_d1)
    );
	
	// enc_round_cnt
	always @(posedge clk or negedge rstn)
	begin
		if(~rstn) begin
			enc_round_cnt <= 4'd0;
		end
		else if(enc_ena) begin
			if(enc_each_round_cnt) begin
				if(enc_round_cnt < 4'd15)
					enc_round_cnt <= enc_round_cnt + 1'b1;
				else
					enc_round_cnt <= 4'd0;
			end
			else
				enc_round_cnt <= enc_round_cnt;
		end
		else begin
			enc_round_cnt <= 4'd0;
		end
	end
	
	// enc_each_round_cnt
	always @(posedge clk or negedge rstn)
	begin
		if(~rstn) begin
			enc_each_round_cnt <= 1'b0;
		end
		else if(enc_ena) begin
			enc_each_round_cnt <= ~enc_each_round_cnt;
		end
		else begin
			enc_each_round_cnt <= 1'b0;
		end
	end
	
	
endmodule
