`timescale 1ns / 1ps

module INST_MEM( addr , inst);
    input  [31:0] addr ; 
    output [31:0] inst ;
    
	 wire [31:0] rom [0:31];
	 
	 assign rom[5'h00] = 32'b000010_00000_00000_0000_0000_0000_0101; //j 5H
	 assign rom[5'h01] = 32'hAAA0 ; // Not use
	 assign rom[5'h02] = 32'hAAA1 ; // Not use
	 
	 assign inst = rom[addr[6:2]];
endmodule
