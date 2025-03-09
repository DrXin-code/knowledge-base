`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:16:38 06/03/2023
// Design Name:   DATA_RAM
// Module Name:   C:/Users/Lenovo/Desktop/cpu/dataram_test.v
// Project Name:  cpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DATA_RAM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module dataram_test;

	// Inputs
	reg Clock;
	reg [31:0] datain;
	reg [31:0] addr;
	reg write;
	reg read;

	// Outputs
	wire [31:0] dataout;

	// Instantiate the Unit Under Test (UUT)
	DATA_RAM uut (
		.Clock(Clock), 
		.dataout(dataout), 
		.datain(datain), 
		.addr(addr), 
		.write(write), 
		.read(read)
	);

	initial begin
		// Initialize Inputs
		Clock = 0;
		datain = 0;
		addr = 0;
		write = 0;
		read = 0;

		// Wait 100 ns for global reset to finish
		#100; Clock = ~Clock; read = 1; addr = 32'h00000004;
		#100; Clock = ~Clock; write = 1; datain = 32'h0000ffff;
		#100; Clock = ~Clock; addr = 32'h00000008;
		#100; Clock = ~Clock; read = 0;
      #100; Clock = ~Clock; datain = 32'hffff0000;
		#100; Clock = ~Clock; read = 1;
		#100; Clock = ~Clock; addr = 32'h0000000C;
		// Add stimulus here

	end
      
endmodule

