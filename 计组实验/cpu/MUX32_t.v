`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:24:40 05/20/2023
// Design Name:   MUX32_2_1
// Module Name:   D:/22/cpu/MUX32_t.v
// Project Name:  cpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MUX32_2_1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MUX32_t;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg Sel;

	// Outputs
	wire [31:0] O;

	// Instantiate the Unit Under Test (UUT)
	MUX32_2_1 uut (
		.A(A), 
		.B(B), 
		.Sel(Sel), 
		.O(O)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		Sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
		A = 32'b00000000111111110000000011111111;
		B = 32'b11111111000000001111111100000000;
		#100;
		Sel = 1;
		#100;
		Sel = 0;
        
		// Add stimulus here

	end
      
endmodule

