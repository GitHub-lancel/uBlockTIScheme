`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:59:50 08/17/2023
// Design Name:   uBlock_enc_decompose_top
// Module Name:   G:/Program/uBlockMaskingSchemedecompose_Yao/scr/uBlock_enc_decompose_top_Testbeach.v
// Project Name:  uBlockMaskingSchemedecompose
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: uBlock_enc_decompose_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module uBlock_enc_decompose_top_Testbeach;

	// Inputs
	reg clk;
	reg rstn;
	reg [127:0] plain0;
	reg [127:0] plain1;
	reg [127:0] key0;
	reg [127:0] key1;
	reg start;

	// Outputs
	wire [127:0] cipher0;
	wire [127:0] cipher1;
	wire done;
	wire occupied;
	
	
	// Instantiate the Unit Under Test (UUT)
	uBlock_enc_decompose_top uut (
		.clk(clk), 
		.rstn(rstn), 
		
		.plain0(plain0), 
		.plain1(plain1), 
		
		.key0(key0), 
		.key1(key1), 
		
		.start(start), 
		
		.cipher0(cipher0), 
		.cipher1(cipher1), 
		
		.done(done), 
		.occupied(occupied)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rstn = 0;
		plain0 = 0;
		plain1 = 0;
		key0 = 0;
		key1 = 0;
		// Wait 100 ns for global reset to finish
		#100;
        rstn = 1;
		// Add stimulus here
	end
     
	
	always #10 clk <= ~clk;
	
	always @(posedge clk or negedge rstn)
	begin
		if(~rstn) begin
			plain0 <= 128'd0;
			plain1 <= 128'd0;
			key0 <= 128'd0;
			key1 <= 128'd0;
			start <= 1'b0;
		end
		else if(start) begin
			start <= 1'b0;
		end
		else if(~occupied) begin
			plain0 <= 128'h0123456789abcdeffedcba9876543210;
			plain1 <= 128'd0;
			key0 <= 128'h0123456789abcdeffedcba9876543210;
			key1 <= 128'd0;
			start <= 1'b1;
		end
	end
	
endmodule

