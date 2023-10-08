`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:48:13 08/21/2023 
// Design Name: 
// Module Name:    shared_block_left_circular_shift_8bit 
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
module shared_block_left_circular_shift_8bit(
	input [63:0] block_left_circular_shift_input0,
	input [63:0] block_left_circular_shift_input1,
	
    output [63:0] block_left_circular_shift_output0,
    output [63:0] block_left_circular_shift_output1
    );
	
	genvar i;
	generate
	for (i=0 ;i<2;i=i+1) begin: for_shift_block
		assign block_left_circular_shift_output0[(i+1)*32-1:i*32] = {block_left_circular_shift_input0[(i+1)*32-9:i*32], 
																	 block_left_circular_shift_input0[(i+1)*32-1:(i+1)*32-8]
																	};
		assign block_left_circular_shift_output1[(i+1)*32-1:i*32] = {block_left_circular_shift_input1[(i+1)*32-9:i*32], 
																	 block_left_circular_shift_input1[(i+1)*32-1:(i+1)*32-8]
																	};															
	end
	endgenerate
	
endmodule
