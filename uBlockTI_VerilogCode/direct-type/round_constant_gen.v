`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:13:35 08/18/2023 
// Design Name: 
// Module Name:    round_constant_gen 
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
module round_constant_gen(
	input 			clk,
    input 			rst_n,
	
    input 			round_const_ena,
    output [31:0] 	round_constant
    );
	
	wire [7:0] 	round_constant_p3, round_constant_p2, round_constant_p1, round_constant_p0;
	wire [8:0] 	LFSR_d;
	reg  [7:0] 	LFSR_q;
	
	assign LFSR_d = {LFSR_q,
                 LFSR_q[7] ^ LFSR_q[6] ^ LFSR_q[2] ^ LFSR_q[1]
    };
	
	assign round_constant_p3 = {LFSR_d[7], ~LFSR_d[6], LFSR_d[5:0]};
	assign round_constant_p2 = {LFSR_d[7], ~LFSR_d[6], LFSR_d[5], ~LFSR_d[4], LFSR_d[3], ~LFSR_d[2], LFSR_d[1:0]};
	assign round_constant_p1 = {LFSR_d[7:5], ~LFSR_d[4], LFSR_d[3:1], ~LFSR_d[0]};
	assign round_constant_p0 = {LFSR_d[7:3], ~LFSR_d[2], LFSR_d[1], ~LFSR_d[0]};
	
	assign round_constant = {round_constant_p3,
							round_constant_p2,
							round_constant_p1,
							round_constant_p0
	};
	
	always@(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			LFSR_q <= 8'b0;
		end        
		else if (!round_const_ena) begin
			LFSR_q <= 8'b01101100;
		end
		else if (round_const_ena) begin
			LFSR_q <= LFSR_d[7:0];
		end
	end
	
endmodule
