`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:12:07 08/15/2023
// Design Name:   FSharedSbox
// Module Name:   G:/Program/uBlockMaskingSchemedecompose/scr/FSharedSbox_Testbeach.v
// Project Name:  uBlockMaskingSchemedecompose
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FSharedSbox
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FSharedSbox_Testbeach;

	// Inputs
	reg clk;
	reg [3:0] d0c0b0a0;
	reg [3:0] d1c1b1a1;
	reg [1:0] guards;

	// Outputs
	wire [3:0] h0g0f0e0;
	wire [3:0] h1g1f1e1;
	
	// intermediate
	reg	 	   rstn;
	wire [3:0] hgfe;
	
	// Instantiate the Unit Under Test (UUT)
	fshared_sbox uut (
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
		#100;
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
			d0c0b0a0 <= d0c0b0a0 + 1'b1;
			d1c1b1a1 <= 0;
		end
	end
	
	always @(posedge clk) guards <= 0;
	assign hgfe = h0g0f0e0 ^ h1g1f1e1;
	
endmodule

