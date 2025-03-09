`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:36:11 05/27/2023 
// Design Name: 
// Module Name:    Control_Unit 
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
module Control_Unit(
	input [5:0] op, func,
	output RegDst, RegWrite, ALUSrc,
	output MemWrite, MemRead, MemtoReg,
	output Branch,
	output [2:0] ALU_op
    );

	wire[1:0] ALUctr;
	Control U0( .op(op),
					.RegDst(RegDst),
					.RegWrite(RegWrite),
					.ALUSrc(ALUSrc),
					.MemWrite(MemWrite),
					.MemRead(MemRead),
					.MemtoReg(MemtoReg),
					.Branch(Branch),
					.ALUctr(ALUctr));
	
	ALUop U1(.func(func),.ALUctr(ALUctr),.ALU_op(ALU_op));
									
endmodule
