`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:31:05 06/10/2023 
// Design Name: 
// Module Name:    Single_Cycle_Computer 
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
module Single_Cycle_Computer(
	input Reset, Clock,
	output [31:0] Inst, MemInD, MenOutD
    );
	wire MemWrite, MemRead, MemtoReg;
	
	wire [31:0] data, b_data, addr, Result;
	
	Data_Flow U0(.Inst(Inst), .Data(data), .Reset(Reset), .Clock(Clock), .Result(Result), 
	.b_data(b_data), .addr(addr), .MemWrite(MemWrite), .MemRead(MemRead), .MemtoReg(MemtoReg));
	
	Inst_mem U1(.address(addr), .inst(Inst));
	
	DATA_RAM U2(.Clock(Clock), .dataout(MenOutD), .datain(b_data), .addr(data), .write(MemWrite), .read(MemRead));
	
	MUX32_2_1 U3(.A(Result), .B(MemOutD), .Sel(MemtoReg), .O(data));
	
	assign MemInD = b_data;
	
endmodule
