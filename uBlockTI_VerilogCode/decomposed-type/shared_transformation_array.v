`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:26:19 08/15/2023 
// Design Name: 
// Module Name:    shared_transformation_array 
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
module shared_transformation_array(
	input	[31:00]	transformation_array_input0,
	input	[31:00]	transformation_array_input1,
	
	output	[31:00]	transformation_array_output0,
	output	[31:00]	transformation_array_output1
    );
	
	shared_transformation shared_transformation_Inst0(
	.transformation_input0		(transformation_array_input0[31:28]),
	.transformation_input1		(transformation_array_input1[31:28]),
	
	.transformation_output0		(transformation_array_output0[31:28]),
	.transformation_output1		(transformation_array_output1[31:28])
	);
	
	shared_transformation shared_transformation_Inst1(
	.transformation_input0		(transformation_array_input0[27:24]),
	.transformation_input1		(transformation_array_input1[27:24]),
	
	.transformation_output0		(transformation_array_output0[27:24]),
	.transformation_output1		(transformation_array_output1[27:24])
	);
	
	shared_transformation shared_transformation_Inst2(
	.transformation_input0		(transformation_array_input0[23:20]),
	.transformation_input1		(transformation_array_input1[23:20]),
	
	.transformation_output0		(transformation_array_output0[23:20]),
	.transformation_output1		(transformation_array_output1[23:20])
	);
	
	shared_transformation shared_transformation_Inst3(
	.transformation_input0		(transformation_array_input0[19:16]),
	.transformation_input1		(transformation_array_input1[19:16]),
	
	.transformation_output0		(transformation_array_output0[19:16]),
	.transformation_output1		(transformation_array_output1[19:16])
	);
	
	shared_transformation shared_transformation_Inst4(
	.transformation_input0		(transformation_array_input0[15:12]),
	.transformation_input1		(transformation_array_input1[15:12]),
	
	.transformation_output0		(transformation_array_output0[15:12]),
	.transformation_output1		(transformation_array_output1[15:12])
	);
	
	shared_transformation shared_transformation_Inst5(
	.transformation_input0		(transformation_array_input0[11:08]),
	.transformation_input1		(transformation_array_input1[11:08]),
	
	.transformation_output0		(transformation_array_output0[11:08]),
	.transformation_output1		(transformation_array_output1[11:08])
	);
	
	shared_transformation shared_transformation_Inst6(
	.transformation_input0		(transformation_array_input0[07:04]),
	.transformation_input1		(transformation_array_input1[07:04]),
	
	.transformation_output0		(transformation_array_output0[07:04]),
	.transformation_output1		(transformation_array_output1[07:04])
	);
	
	shared_transformation shared_transformation_Inst7(
	.transformation_input0		(transformation_array_input0[03:00]),
	.transformation_input1		(transformation_array_input1[03:00]),
	
	.transformation_output0		(transformation_array_output0[03:00]),
	.transformation_output1		(transformation_array_output1[03:00])
	);
	
endmodule

module shared_transformation(
	input	[03:00]	transformation_input0,
	input	[03:00]	transformation_input1,
	
	output reg	[03:00]	transformation_output0,
	output reg	[03:00]	transformation_output1
	);
	
	always @(transformation_input0) 
	begin
		if(transformation_input0[3] == 1'b1)
			transformation_output0 = {transformation_input0[2:0], 1'b0} ^ 4'b0011;
		else 
			transformation_output0 = {transformation_input0[2:0], 1'b0};
	end
	
	always @(transformation_input1) 
	begin
		if(transformation_input1[3] == 1'b1)
			transformation_output1 = {transformation_input1[2:0], 1'b0} ^ 4'b0011;
		else
			transformation_output1 = {transformation_input1[2:0], 1'b0};
	end
	
	
endmodule