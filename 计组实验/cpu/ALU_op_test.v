`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:01:08 05/27/2023
// Design Name:   ALUop
// Module Name:   C:/Users/Lenovo/Desktop/cpu/ALU_op_test.v
// Project Name:  cpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALUop
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_op_test;

	// Inputs
	reg [5:0] func;
	reg [1:0] ALUctr;

	// Outputs
	wire [2:0] ALU_op;

	// Instantiate the Unit Under Test (UUT)
	ALUop uut (
		.func(func), 
		.ALUctr(ALUctr), 
		.ALU_op(ALU_op)
	);

	initial begin
		// Initialize Inputs
		func = 0;
		ALUctr = 0;

		// Wait 100 ns for global reset to finish
		#100; func = 6'b100000; ALUctr = 2'b10;
		#100; func = 6'b100010; ALUctr = 2'b10;
		#100; func = 6'b100100; ALUctr = 2'b10;
		#100; func = 6'b100101; ALUctr = 2'b10;
		#100; func = 6'b100110; ALUctr = 2'b10;
		#100; func = 6'b000000; ALUctr = 2'b01;
		#100; func = 6'b000000; ALUctr = 2'b11;
		
        
		// Add stimulus here

	end
      
endmodule

