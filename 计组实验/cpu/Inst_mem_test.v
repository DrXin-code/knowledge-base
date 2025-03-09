`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:50:19 06/03/2023
// Design Name:   Inst_mem
// Module Name:   C:/Users/Lenovo/Desktop/cpu/Inst_mem_test.v
// Project Name:  cpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Inst_mem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Inst_mem_test;

	// Inputs
	reg [31:0] address;

	// Outputs
	wire [31:0] inst;

	// Instantiate the Unit Under Test (UUT)
	Inst_mem uut (
		.address(address), 
		.inst(inst)
	);

	initial begin
		// Initialize Inputs
		address = 0;

		// Wait 100 ns for global reset to finish
		#200; address = 32'h00000004;
		#200; address = 32'h00000008;
		#200; address = 32'h0000000C;
      #200; address = 32'h00000010;  
		// Add stimulus here

	end
      
endmodule

