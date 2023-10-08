`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:49:44 08/21/2023 
// Design Name: 
// Module Name:    shared_permutation_right 
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
module shared_permutation_right(
	input [63:0] permutation_input0,
	input [63:0] permutation_input1,
	
    output [63:0] permutation_output0,
    output [63:0] permutation_output1
    );
	
	assign permutation_output0 = {permutation_input0[47:40],
                                  permutation_input0[07:00],
                                  permutation_input0[23:16],
                                  permutation_input0[63:56],
                                  permutation_input0[55:48],
                                  permutation_input0[15:08],
                                  permutation_input0[31:24],
                                  permutation_input0[39:32]
    };
	
	assign permutation_output1 = {permutation_input1[47:40],
                                  permutation_input1[07:00],
                                  permutation_input1[23:16],
                                  permutation_input1[63:56],
                                  permutation_input1[55:48],
                                  permutation_input1[15:08],
                                  permutation_input1[31:24],
                                  permutation_input1[39:32]
    };
	
endmodule