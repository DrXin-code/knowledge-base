`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:14:43 05/27/2023 
// Design Name: 
// Module Name:    Left_2_Shifter 
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
module Left_2_Shifter(B_addr, B_addr1);
	input		[31:0] B_addr;
	output 	[31:0] B_addr1;
	
assign	B_addr1[31:0] = { B_addr[29:0], 2'b00 };

endmodule

