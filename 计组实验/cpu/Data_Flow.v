`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:43:22 06/10/2023 
// Design Name: 
// Module Name:    Data_Flow 
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
module Data_Flow(
	input Reset, Clock,
	input [31:0] Inst, Data,
	output [31:0] Result, addr,
	output [31:0] b_data,
	output MemWrite, MemRead, MemtoReg
    );
	wire RegDst, RegWrite, ALUSrc, Branch, Zero;
	wire [2:0] ALU_op;
	wire [4:0] Wn;
	wire [31:0] A, B, Ext_Imm, ALU_B;
	reg [31:0] addr1;
	
	Fetch U0(.B(Branch), .Z(Zero), .Reset(Reset), .Clock(Clock), .B_addr(Ext_Imm), .addr(addr));
	
	Control_Unit U1(.op(Inst[31:26]), .func(Inst[5:0]), .RegDst(RegDst), .RegWrite(RegWrite),
	.ALUSrc(ALUSrc), .MemWrite(MemWrite), .MemRead(MemRead), .MemtoReg(MemtoReg), 
	.Branch(Branch), .ALU_op(ALU_op));
	
	MUX5_2_1 U2(.A(Inst[20:16]), .B(Inst[15:11]), .Sel(RegDst), .O(Wn));
	
	RegFile U3(.Rn1(Inst[25:21]), .Rn2(Inst[20:16]), .Wn(Wn), .Write(RegWrite), .Wd(Data), .A(A), .B(B), .Clock(Clock));
	
	Sign_Extender U4(Inst[15:0], Ext_Imm);
	
	MUX32_2_1 U5(.A(B), .B(Ext_Imm), .Sel(ALUSrc), .O(ALU_B));
	
	ALU U6(.A(A), .B(ALU_B), .ALU_operation(ALU_op), .Result(Result), .Zero(Zero));
	
	assign b_data = B;
endmodule
