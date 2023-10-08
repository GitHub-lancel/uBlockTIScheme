`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:18:39 08/16/2023 
// Design Name: 
// Module Name:    shared_s_box_array 
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
module shared_s_box_array(
	input			clk,
	input	[63:0]	sbox_array_input0,
	input	[63:0]	sbox_array_input1,
	
	output	[63:0]	sbox_array_output0,
	output	[63:0]	sbox_array_output1
    );
	
	shared_sbox shared_sbox_Inst0(
	.clk			(clk),
	
	.d0c0b0a0		(sbox_array_input0[63:60]),
	.d1c1b1a1		(sbox_array_input1[63:60]),
	
	.guards			(sbox_array_input0[59:56]),
	
	.h0g0f0e0		(sbox_array_output0[63:60]),
	.h1g1f1e1		(sbox_array_output1[63:60])
    );
	
	shared_sbox shared_sbox_Inst1(
	.clk			(clk),
	
	.d0c0b0a0		(sbox_array_input0[59:56]),
	.d1c1b1a1		(sbox_array_input1[59:56]),
	
	.guards			(sbox_array_input0[55:52]),
	
	.h0g0f0e0		(sbox_array_output0[59:56]),
	.h1g1f1e1		(sbox_array_output1[59:56])
    );
	
	shared_sbox shared_sbox_Inst2(
	.clk			(clk),
	
	.d0c0b0a0		(sbox_array_input0[55:52]),
	.d1c1b1a1		(sbox_array_input1[55:52]),
	
	.guards			(sbox_array_input0[51:48]),
	
	.h0g0f0e0		(sbox_array_output0[55:52]),
	.h1g1f1e1		(sbox_array_output1[55:52])
    );
	
	
	shared_sbox shared_sbox_Inst3(
	.clk			(clk),
	
	.d0c0b0a0		(sbox_array_input0[51:48]),
	.d1c1b1a1		(sbox_array_input1[51:48]),
	
	.guards			(sbox_array_input0[47:44]),
	
	.h0g0f0e0		(sbox_array_output0[51:48]),
	.h1g1f1e1		(sbox_array_output1[51:48])
    );
	
	shared_sbox shared_sbox_Inst4(
	.clk			(clk),
	
	.d0c0b0a0		(sbox_array_input0[47:44]),
	.d1c1b1a1		(sbox_array_input1[47:44]),
	
	.guards			(sbox_array_input0[43:40]),
	
	.h0g0f0e0		(sbox_array_output0[47:44]),
	.h1g1f1e1		(sbox_array_output1[47:44])
    );
	
	shared_sbox shared_sbox_Inst5(
	.clk			(clk),
	
	.d0c0b0a0		(sbox_array_input0[43:40]),
	.d1c1b1a1		(sbox_array_input1[43:40]),
	
	.guards			(sbox_array_input0[39:36]),
	
	.h0g0f0e0		(sbox_array_output0[43:40]),
	.h1g1f1e1		(sbox_array_output1[43:40])
    );
	
	shared_sbox shared_sbox_Inst6(
	.clk			(clk),
	
	.d0c0b0a0		(sbox_array_input0[39:36]),
	.d1c1b1a1		(sbox_array_input1[39:36]),
	
	.guards			(sbox_array_input0[35:32]),
	
	.h0g0f0e0		(sbox_array_output0[39:36]),
	.h1g1f1e1		(sbox_array_output1[39:36])
    );
	
	shared_sbox shared_sbox_Inst7(
	.clk			(clk),
	
	.d0c0b0a0		(sbox_array_input0[35:32]),
	.d1c1b1a1		(sbox_array_input1[35:32]),
	
	.guards			(sbox_array_input0[31:28]),
	
	.h0g0f0e0		(sbox_array_output0[35:32]),
	.h1g1f1e1		(sbox_array_output1[35:32])
    );
	
	shared_sbox shared_sbox_Inst8(
	.clk			(clk),
	
	.d0c0b0a0		(sbox_array_input0[31:28]),
	.d1c1b1a1		(sbox_array_input1[31:28]),
	
	.guards			(sbox_array_input0[27:24]),
	
	.h0g0f0e0		(sbox_array_output0[31:28]),
	.h1g1f1e1		(sbox_array_output1[31:28])
    );
	
	shared_sbox shared_sbox_Inst9(
	.clk			(clk),
	
	.d0c0b0a0		(sbox_array_input0[27:24]),
	.d1c1b1a1		(sbox_array_input1[27:24]),
	
	.guards			(sbox_array_input0[23:20]),
	
	.h0g0f0e0		(sbox_array_output0[27:24]),
	.h1g1f1e1		(sbox_array_output1[27:24])
    );
	
	shared_sbox shared_sbox_Insta(
	.clk			(clk),
	
	.d0c0b0a0		(sbox_array_input0[23:20]),
	.d1c1b1a1		(sbox_array_input1[23:20]),
	
	.guards			(sbox_array_input0[19:16]),
	
	.h0g0f0e0		(sbox_array_output0[23:20]),
	.h1g1f1e1		(sbox_array_output1[23:20])
    );
	
	shared_sbox shared_sbox_Instb(
	.clk			(clk),
	
	.d0c0b0a0		(sbox_array_input0[19:16]),
	.d1c1b1a1		(sbox_array_input1[19:16]),
	
	.guards			(sbox_array_input0[15:12]),
	
	.h0g0f0e0		(sbox_array_output0[19:16]),
	.h1g1f1e1		(sbox_array_output1[19:16])
    );
	
	shared_sbox shared_sbox_Instc(
	.clk			(clk),
	
	.d0c0b0a0		(sbox_array_input0[15:12]),
	.d1c1b1a1		(sbox_array_input1[15:12]),
	
	.guards			(sbox_array_input0[11:08]),
	
	.h0g0f0e0		(sbox_array_output0[15:12]),
	.h1g1f1e1		(sbox_array_output1[15:12])
    );
	
	shared_sbox shared_sbox_Instd(
	.clk			(clk),
	
	.d0c0b0a0		(sbox_array_input0[11:08]),
	.d1c1b1a1		(sbox_array_input1[11:08]),
	
	.guards			(sbox_array_input0[07:04]),
	
	.h0g0f0e0		(sbox_array_output0[11:08]),
	.h1g1f1e1		(sbox_array_output1[11:08])
    );
	
	shared_sbox shared_sbox_Inste(
	.clk			(clk),
	
	.d0c0b0a0		(sbox_array_input0[07:04]),
	.d1c1b1a1		(sbox_array_input1[07:04]),
	
	.guards			(sbox_array_input0[03:00]),
	
	.h0g0f0e0		(sbox_array_output0[07:04]),
	.h1g1f1e1		(sbox_array_output1[07:04])
    );
	
	shared_sbox shared_sbox_Instf(
	.clk			(clk),
	
	.d0c0b0a0		(sbox_array_input0[03:00]),
	.d1c1b1a1		(sbox_array_input1[03:00]),
	
	.guards			(sbox_array_input0[63:60]),
	
	.h0g0f0e0		(sbox_array_output0[03:00]),
	.h1g1f1e1		(sbox_array_output1[03:00])
    );
	

endmodule
