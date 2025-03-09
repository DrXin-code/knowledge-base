`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:17:45 05/27/2023 
// Design Name: 
// Module Name:    Fetch 
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
module Fetch(
	input B, Z, Reset, Clock,
	input [31:0] B_addr,
	output[31:0] addr
    );
	reg [31:0] PC;
	wire[31:0] sum0, B_addr1, sum1, next_pc;
	wire sel = B & Z;
	
	Left_2_Shifter U0(.B_addr(B_addr), .B_addr1(B_addr1));
	ADD32 U1(.a(PC), .b(4), .result(sum0));
	ADD32 U2(.a(sum0), .b(B_addr1), .result(sum1));
	MUX32_2_1 M1(.A(sum0), .B(sum1), .Sel(sel), .O(next_pc));
	
	assign addr = PC;
	always @(posedge Clock or negedge Reset) begin
		if(Reset == 0)
			PC = 0;
		else
			PC = next_pc;
	end
	
endmodule
