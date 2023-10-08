`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:43:01 08/15/2023
// Design Name:   SharedSbox
// Module Name:   G:/Program/uBlockMaskingSchemedecompose/scr/SharedSbox_Testbeach.v
// Project Name:  uBlockMaskingSchemedecompose
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SharedSbox
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SharedSbox_Testbeach;

	// Inputs
	reg clk;
	reg [3:0] d0c0b0a0;
	reg [3:0] d1c1b1a1;
	reg [3:0] guards;
	
	// Outputs
	wire [3:0] h0g0f0e0;
	wire [3:0] h1g1f1e1;
	
	// intermediate
	reg	 	   rstn;
	
	wire [3:0] dcba;
	wire [3:0] hgfe;
	
	// Instantiate the Unit Under Test (UUT)
	shared_sbox uut (
		.clk(clk),
		
		.d0c0b0a0(d0c0b0a0), 
		.d1c1b1a1(d1c1b1a1), 
		
		.guards(guards), 
		
		.h0g0f0e0(h0g0f0e0), 
		.h1g1f1e1(h1g1f1e1)
	);
	
	initial begin
		// Initialize Inputs
		clk = 0;
		d0c0b0a0 = 0;
		d1c1b1a1 = 0;
		guards = 0;
		rstn = 0;
		// Wait 100 ns for global reset to finish
		#110;
        rstn = 1;
		// Add stimulus here
	end
	
	always #10 clk <= ~clk;
	
	always @(posedge clk or negedge rstn)
	begin
		if(~rstn) begin
			d0c0b0a0 <= 0;
			d1c1b1a1 <= 0;
		end else begin
			// d0c0b0a0 <= {$random} % 16;
			// d1c1b1a1 <= {$random} % 16;
			d0c0b0a0 <= d0c0b0a0 + 1'b1;
			d1c1b1a1 <= 0;
		end
	end
	
	always @(posedge clk) guards <= {$random} % 16;
	// always @(posedge clk) guards <= 0;
	
	assign dcba = d0c0b0a0 ^ d1c1b1a1;
	assign hgfe = h0g0f0e0 ^ h1g1f1e1;
	
endmodule

