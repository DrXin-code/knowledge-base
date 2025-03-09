`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:05:22 05/27/2023
// Design Name:   Control_Unit
// Module Name:   C:/Users/Lenovo/Desktop/cpu/Control_Unit_test.v
// Project Name:  cpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Control_Unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Control_Unit_test;

	// Inputs
	reg [5:0] op;
	reg [5:0] func;

	// Outputs
	wire RegDst;
	wire RegWrite;
	wire ALUSrc;
	wire MemWrite;
	wire MemRead;
	wire MemtoReg;
	wire Branch;
	wire [2:0] ALU_op;

	// Instantiate the Unit Under Test (UUT)
	Control_Unit uut (
		.op(op), 
		.func(func), 
		.RegDst(RegDst), 
		.RegWrite(RegWrite), 
		.ALUSrc(ALUSrc), 
		.MemWrite(MemWrite), 
		.MemRead(MemRead), 
		.MemtoReg(MemtoReg), 
		.Branch(Branch), 
		.ALU_op(ALU_op)
	);

	initial begin
		// Initialize Inputs
		op = 0;
		func = 6'b100000;

		// Wait 100 ns for global reset to finish
		#100; op = 0; func = 6'b100010;
		#100; op = 0; func = 6'b100100;
		#100; op = 0; func = 6'b100101;
		#100; op = 0; func = 6'b100110;
		#100; op = 6'b100011; func = 6'b100010;
		#100; op = 6'b101011; func = 6'b100100;
		#100; op = 6'b000100; func = 6'b100110;
		#100; op = 6'b001111; func = 6'b100101;
        
		// Add stimulus here

	end
      
endmodule

