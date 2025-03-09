`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:51:54 05/27/2023
// Design Name:   Control
// Module Name:   C:/Users/Lenovo/Desktop/cpu/Control_test.v
// Project Name:  cpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Control_test;

	// Inputs
	reg [5:0] op;

	// Outputs
	wire RegDst;
	wire RegWrite;
	wire ALUSrc;
	wire MemWrite;
	wire MemRead;
	wire MemtoReg;
	wire Branch;
	wire [1:0] ALUctr;

	// Instantiate the Unit Under Test (UUT)
	Control uut (
		.op(op), 
		.RegDst(RegDst), 
		.RegWrite(RegWrite), 
		.ALUSrc(ALUSrc), 
		.MemWrite(MemWrite), 
		.MemRead(MemRead), 
		.MemtoReg(MemtoReg), 
		.Branch(Branch), 
		.ALUctr(ALUctr)
	);

	initial begin
		// Initialize Inputs
		op = 0;

		// Wait 100 ns for global reset to finish
		#100; op = 6'b100011;
		#100; op = 6'b101011;
		#100; op = 6'b000100;
		#100; op = 6'b001111;
        
		// Add stimulus here

	end
      
endmodule

