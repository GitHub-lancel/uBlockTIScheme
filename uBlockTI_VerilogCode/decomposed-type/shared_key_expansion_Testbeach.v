`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:21:04 08/15/2023
// Design Name:   shared_key_expansion
// Module Name:   G:/Program/uBlockMaskingSchemedecompose_Yao/scr/shared_key_expansion_Testbeach.v
// Project Name:  uBlockMaskingSchemedecompose
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: shared_key_expansion
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module shared_key_expansion_Testbeach;

	// Inputs
	reg clk;
	reg rstn;
	
	reg key_exp_ena;
	
	reg [127:0] mkey0;
	reg [127:0] mkey1;

	// Outputs
	wire [127:0] full_round_key_q0;
	wire [127:0] full_round_key_q1;
	
	wire [4:0] key_exp_round_cnt;
	wire key_exp_occupied;

	// intermediate
	wire [127:0] mkey;
	wire [127:0] full_round_key_q;
	reg			 start;
	
	// Instantiate the Unit Under Test (UUT)
	shared_key_expansion uut (
		.clk(clk), 
		.rstn(rstn), 
		.key_exp_ena(key_exp_ena), 
		.mkey0(mkey0), 
		.mkey1(mkey1), 
		.full_round_key_q0(full_round_key_q0), 
		.full_round_key_q1(full_round_key_q1), 
		.key_exp_round_cnt(key_exp_round_cnt), 
		.key_exp_occupied(key_exp_occupied)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rstn = 0;
		key_exp_ena = 0;
		mkey0 = 0;
		mkey1 = 0;
		start = 0;
		// Wait 100 ns for global reset to finish
		#100;
        rstn = 1;
		// Add stimulus here
		#30
		mkey0 = 128'h0123456789abcdeffedcba9876543210;
		mkey1 = 128'd0;
		#20
		start = 1;
		#20
		start = 0;
	end
	
	always #10 clk <= ~clk;
	
	assign mkey = mkey0 ^ mkey1;
	assign full_round_key_q = full_round_key_q0 ^ full_round_key_q1;
	
	always @(posedge clk or negedge rstn)
	if(~rstn)
		key_exp_ena <= 1'b0;
	else if(start)
		key_exp_ena <= 1'b1;
	else
		key_exp_ena <= 1'b0;
		
endmodule

