`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:24:34 06/03/2023
// Design Name:   Sign_Extender
// Module Name:   C:/Users/Lenovo/Desktop/cpu/Sign_Extender_test.v
// Project Name:  cpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Sign_Extender
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Sign_Extender_test;

	// Inputs
	reg [15:0] a;

	// Outputs
	wire [31:0] b;

	// Instantiate the Unit Under Test (UUT)
	Sign_Extender uut (
		.a(a), 
		.b(b)
	);

	initial begin
		// Initialize Inputs
		a = 0;

		// Wait 100 ns for global reset to finish
		#200;
		a = 10;
		#200;
		a = -10;
		#200;
		a = 88;
		#200;
		a = -100;		
		// Add stimulus here

	end
      
endmodule

