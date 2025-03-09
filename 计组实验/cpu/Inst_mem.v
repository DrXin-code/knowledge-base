`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:35:59 06/03/2023 
// Design Name: 
// Module Name:    Inst_mem 
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
module Inst_mem(
	input  [31:0] address, 
   output [31:0] inst
		);
	
	wire[31:0] ram[0:31];
	assign ram[5'h00] = 32'h00002820; //add $a1, $0, $0
	assign ram[5'h01] = 32'h8CB10000; //lw  $s1, 0($a1)
	assign ram[5'h02] = 32'h8CB20004; //lw  $s2, 4($a1)
	assign ram[5'h03] = 32'h02329822; //sub $s3, $s1, $s2
	assign ram[5'h04] = 32'h02328830; //add $s1, $s1, $s2
	assign ram[5'h05] = 32'h8CB20008; //lw  $s2, 8($a1)
	assign ram[5'h06] = 32'h12320002; //beq $s1, $s2, 2 
	assign ram[5'h07] = 32'hACB3000C; //sw  $s3, 12($a1)
	assign ram[5'h08] = 32'hACB1000C; //sw  $s1, 12($a1)
	assign inst = ram[address[6:2]];

endmodule

