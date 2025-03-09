`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:11:43 05/27/2023 
// Design Name: 
// Module Name:    Control 
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
module Control(
	input [5:0] op,
	output RegDst, RegWrite, ALUSrc,
	output MemWrite, MemRead, MemtoReg,
	output Branch,
	output [1:0]ALUctr
    );
	
	wire i_Rt  = ~| op;
	wire i_lw  = op[5] & ~op[3];
	wire i_sw  = op[5] & op[3];
	wire i_beq = op[2] & ~op[1];
	wire i_lui = op[2] & op[1];
	
	assign RegDst    = i_Rt;
	assign RegWrite  = i_Rt | i_lw | i_lui;
	assign ALUSrc    = i_lw | i_sw | i_lui;
	assign MemWrite  = i_sw;
	assign MemRead   = i_lw;
	assign MemtoReg  = i_lw;
	assign Branch    = i_beq;
	
	assign ALUctr[1] = i_Rt | i_lui;
	assign ALUctr[0] = i_beq | i_lui;

endmodule
