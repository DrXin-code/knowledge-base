`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:30:06 05/20/2023 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
	input [31:0] A,B,
	input [2:0] ALU_operation,
	output [31:0] Result,
	output        Zero
    );

assign Result = (ALU_operation==3'b000)?A+B :
                (ALU_operation==3'b100)?A-B :
                (ALU_operation==3'b001)?A&B :
                (ALU_operation==3'b101)?A|B :
                (ALU_operation==3'b010)?A^B :
                (ALU_operation==3'b110)?{B[15:0],16'h0} :
                32'hxxxxxxxx;
						
assign Zero = ~|Result;


endmodule
