////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: MUX32_2_1_synthesis.v
// /___/   /\     Timestamp: Sat May 27 15:43:50 2023
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim MUX32_2_1.ngc MUX32_2_1_synthesis.v 
// Device	: xc6slx45-3-csg484
// Input file	: MUX32_2_1.ngc
// Output file	: C:\Users\Lenovo\Desktop\cpu\netgen\synthesis\MUX32_2_1_synthesis.v
// # of Modules	: 1
// Design Name	: MUX32_2_1
// Xilinx        : C:\Xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module MUX32_2_1 (
  Sel, A, B, O
);
  input Sel;
  input [31 : 0] A;
  input [31 : 0] B;
  output [31 : 0] O;
  wire A_31_IBUF_0;
  wire A_30_IBUF_1;
  wire A_29_IBUF_2;
  wire A_28_IBUF_3;
  wire A_27_IBUF_4;
  wire A_26_IBUF_5;
  wire A_25_IBUF_6;
  wire A_24_IBUF_7;
  wire A_23_IBUF_8;
  wire A_22_IBUF_9;
  wire A_21_IBUF_10;
  wire A_20_IBUF_11;
  wire A_19_IBUF_12;
  wire A_18_IBUF_13;
  wire A_17_IBUF_14;
  wire A_16_IBUF_15;
  wire A_15_IBUF_16;
  wire A_14_IBUF_17;
  wire A_13_IBUF_18;
  wire A_12_IBUF_19;
  wire A_11_IBUF_20;
  wire A_10_IBUF_21;
  wire A_9_IBUF_22;
  wire A_8_IBUF_23;
  wire A_7_IBUF_24;
  wire A_6_IBUF_25;
  wire A_5_IBUF_26;
  wire A_4_IBUF_27;
  wire A_3_IBUF_28;
  wire A_2_IBUF_29;
  wire A_1_IBUF_30;
  wire A_0_IBUF_31;
  wire B_31_IBUF_32;
  wire B_30_IBUF_33;
  wire B_29_IBUF_34;
  wire B_28_IBUF_35;
  wire B_27_IBUF_36;
  wire B_26_IBUF_37;
  wire B_25_IBUF_38;
  wire B_24_IBUF_39;
  wire B_23_IBUF_40;
  wire B_22_IBUF_41;
  wire B_21_IBUF_42;
  wire B_20_IBUF_43;
  wire B_19_IBUF_44;
  wire B_18_IBUF_45;
  wire B_17_IBUF_46;
  wire B_16_IBUF_47;
  wire B_15_IBUF_48;
  wire B_14_IBUF_49;
  wire B_13_IBUF_50;
  wire B_12_IBUF_51;
  wire B_11_IBUF_52;
  wire B_10_IBUF_53;
  wire B_9_IBUF_54;
  wire B_8_IBUF_55;
  wire B_7_IBUF_56;
  wire B_6_IBUF_57;
  wire B_5_IBUF_58;
  wire B_4_IBUF_59;
  wire B_3_IBUF_60;
  wire B_2_IBUF_61;
  wire B_1_IBUF_62;
  wire B_0_IBUF_63;
  wire Sel_IBUF_64;
  wire O_31_OBUF_65;
  wire O_30_OBUF_66;
  wire O_29_OBUF_67;
  wire O_28_OBUF_68;
  wire O_27_OBUF_69;
  wire O_26_OBUF_70;
  wire O_25_OBUF_71;
  wire O_24_OBUF_72;
  wire O_23_OBUF_73;
  wire O_22_OBUF_74;
  wire O_21_OBUF_75;
  wire O_20_OBUF_76;
  wire O_19_OBUF_77;
  wire O_18_OBUF_78;
  wire O_17_OBUF_79;
  wire O_16_OBUF_80;
  wire O_15_OBUF_81;
  wire O_14_OBUF_82;
  wire O_13_OBUF_83;
  wire O_12_OBUF_84;
  wire O_11_OBUF_85;
  wire O_10_OBUF_86;
  wire O_9_OBUF_87;
  wire O_8_OBUF_88;
  wire O_7_OBUF_89;
  wire O_6_OBUF_90;
  wire O_5_OBUF_91;
  wire O_4_OBUF_92;
  wire O_3_OBUF_93;
  wire O_2_OBUF_94;
  wire O_1_OBUF_95;
  wire O_0_OBUF_96;
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_O321 (
    .I0(Sel_IBUF_64),
    .I1(B_9_IBUF_54),
    .I2(A_9_IBUF_22),
    .O(O_9_OBUF_87)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_O311 (
    .I0(Sel_IBUF_64),
    .I1(B_8_IBUF_55),
    .I2(A_8_IBUF_23),
    .O(O_8_OBUF_88)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_O301 (
    .I0(Sel_IBUF_64),
    .I1(B_7_IBUF_56),
    .I2(A_7_IBUF_24),
    .O(O_7_OBUF_89)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_O291 (
    .I0(Sel_IBUF_64),
    .I1(B_6_IBUF_57),
    .I2(A_6_IBUF_25),
    .O(O_6_OBUF_90)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_O281 (
    .I0(Sel_IBUF_64),
    .I1(B_5_IBUF_58),
    .I2(A_5_IBUF_26),
    .O(O_5_OBUF_91)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_O271 (
    .I0(Sel_IBUF_64),
    .I1(B_4_IBUF_59),
    .I2(A_4_IBUF_27),
    .O(O_4_OBUF_92)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_O261 (
    .I0(Sel_IBUF_64),
    .I1(B_3_IBUF_60),
    .I2(A_3_IBUF_28),
    .O(O_3_OBUF_93)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_O251 (
    .I0(Sel_IBUF_64),
    .I1(B_31_IBUF_32),
    .I2(A_31_IBUF_0),
    .O(O_31_OBUF_65)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_O241 (
    .I0(Sel_IBUF_64),
    .I1(B_30_IBUF_33),
    .I2(A_30_IBUF_1),
    .O(O_30_OBUF_66)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_O231 (
    .I0(Sel_IBUF_64),
    .I1(B_2_IBUF_61),
    .I2(A_2_IBUF_29),
    .O(O_2_OBUF_94)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_O221 (
    .I0(Sel_IBUF_64),
    .I1(B_29_IBUF_34),
    .I2(A_29_IBUF_2),
    .O(O_29_OBUF_67)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_O211 (
    .I0(Sel_IBUF_64),
    .I1(B_28_IBUF_35),
    .I2(A_28_IBUF_3),
    .O(O_28_OBUF_68)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_O201 (
    .I0(Sel_IBUF_64),
    .I1(B_27_IBUF_36),
    .I2(A_27_IBUF_4),
    .O(O_27_OBUF_69)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_O191 (
    .I0(Sel_IBUF_64),
    .I1(B_26_IBUF_37),
    .I2(A_26_IBUF_5),
    .O(O_26_OBUF_70)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_O181 (
    .I0(Sel_IBUF_64),
    .I1(B_25_IBUF_38),
    .I2(A_25_IBUF_6),
    .O(O_25_OBUF_71)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_O171 (
    .I0(Sel_IBUF_64),
    .I1(B_24_IBUF_39),
    .I2(A_24_IBUF_7),
    .O(O_24_OBUF_72)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_O161 (
    .I0(Sel_IBUF_64),
    .I1(B_23_IBUF_40),
    .I2(A_23_IBUF_8),
    .O(O_23_OBUF_73)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_O151 (
    .I0(Sel_IBUF_64),
    .I1(B_22_IBUF_41),
    .I2(A_22_IBUF_9),
    .O(O_22_OBUF_74)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_O141 (
    .I0(Sel_IBUF_64),
    .I1(B_21_IBUF_42),
    .I2(A_21_IBUF_10),
    .O(O_21_OBUF_75)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_O131 (
    .I0(Sel_IBUF_64),
    .I1(B_20_IBUF_43),
    .I2(A_20_IBUF_11),
    .O(O_20_OBUF_76)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_O121 (
    .I0(Sel_IBUF_64),
    .I1(B_1_IBUF_62),
    .I2(A_1_IBUF_30),
    .O(O_1_OBUF_95)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_O111 (
    .I0(Sel_IBUF_64),
    .I1(B_19_IBUF_44),
    .I2(A_19_IBUF_12),
    .O(O_19_OBUF_77)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_O101 (
    .I0(Sel_IBUF_64),
    .I1(B_18_IBUF_45),
    .I2(A_18_IBUF_13),
    .O(O_18_OBUF_78)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_O91 (
    .I0(Sel_IBUF_64),
    .I1(B_17_IBUF_46),
    .I2(A_17_IBUF_14),
    .O(O_17_OBUF_79)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_O81 (
    .I0(Sel_IBUF_64),
    .I1(B_16_IBUF_47),
    .I2(A_16_IBUF_15),
    .O(O_16_OBUF_80)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_O71 (
    .I0(Sel_IBUF_64),
    .I1(B_15_IBUF_48),
    .I2(A_15_IBUF_16),
    .O(O_15_OBUF_81)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_O61 (
    .I0(Sel_IBUF_64),
    .I1(B_14_IBUF_49),
    .I2(A_14_IBUF_17),
    .O(O_14_OBUF_82)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_O51 (
    .I0(Sel_IBUF_64),
    .I1(B_13_IBUF_50),
    .I2(A_13_IBUF_18),
    .O(O_13_OBUF_83)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_O41 (
    .I0(Sel_IBUF_64),
    .I1(B_12_IBUF_51),
    .I2(A_12_IBUF_19),
    .O(O_12_OBUF_84)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_O31 (
    .I0(Sel_IBUF_64),
    .I1(B_11_IBUF_52),
    .I2(A_11_IBUF_20),
    .O(O_11_OBUF_85)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_O21 (
    .I0(Sel_IBUF_64),
    .I1(B_10_IBUF_53),
    .I2(A_10_IBUF_21),
    .O(O_10_OBUF_86)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  Mmux_O11 (
    .I0(Sel_IBUF_64),
    .I1(B_0_IBUF_63),
    .I2(A_0_IBUF_31),
    .O(O_0_OBUF_96)
  );
  IBUF   A_31_IBUF (
    .I(A[31]),
    .O(A_31_IBUF_0)
  );
  IBUF   A_30_IBUF (
    .I(A[30]),
    .O(A_30_IBUF_1)
  );
  IBUF   A_29_IBUF (
    .I(A[29]),
    .O(A_29_IBUF_2)
  );
  IBUF   A_28_IBUF (
    .I(A[28]),
    .O(A_28_IBUF_3)
  );
  IBUF   A_27_IBUF (
    .I(A[27]),
    .O(A_27_IBUF_4)
  );
  IBUF   A_26_IBUF (
    .I(A[26]),
    .O(A_26_IBUF_5)
  );
  IBUF   A_25_IBUF (
    .I(A[25]),
    .O(A_25_IBUF_6)
  );
  IBUF   A_24_IBUF (
    .I(A[24]),
    .O(A_24_IBUF_7)
  );
  IBUF   A_23_IBUF (
    .I(A[23]),
    .O(A_23_IBUF_8)
  );
  IBUF   A_22_IBUF (
    .I(A[22]),
    .O(A_22_IBUF_9)
  );
  IBUF   A_21_IBUF (
    .I(A[21]),
    .O(A_21_IBUF_10)
  );
  IBUF   A_20_IBUF (
    .I(A[20]),
    .O(A_20_IBUF_11)
  );
  IBUF   A_19_IBUF (
    .I(A[19]),
    .O(A_19_IBUF_12)
  );
  IBUF   A_18_IBUF (
    .I(A[18]),
    .O(A_18_IBUF_13)
  );
  IBUF   A_17_IBUF (
    .I(A[17]),
    .O(A_17_IBUF_14)
  );
  IBUF   A_16_IBUF (
    .I(A[16]),
    .O(A_16_IBUF_15)
  );
  IBUF   A_15_IBUF (
    .I(A[15]),
    .O(A_15_IBUF_16)
  );
  IBUF   A_14_IBUF (
    .I(A[14]),
    .O(A_14_IBUF_17)
  );
  IBUF   A_13_IBUF (
    .I(A[13]),
    .O(A_13_IBUF_18)
  );
  IBUF   A_12_IBUF (
    .I(A[12]),
    .O(A_12_IBUF_19)
  );
  IBUF   A_11_IBUF (
    .I(A[11]),
    .O(A_11_IBUF_20)
  );
  IBUF   A_10_IBUF (
    .I(A[10]),
    .O(A_10_IBUF_21)
  );
  IBUF   A_9_IBUF (
    .I(A[9]),
    .O(A_9_IBUF_22)
  );
  IBUF   A_8_IBUF (
    .I(A[8]),
    .O(A_8_IBUF_23)
  );
  IBUF   A_7_IBUF (
    .I(A[7]),
    .O(A_7_IBUF_24)
  );
  IBUF   A_6_IBUF (
    .I(A[6]),
    .O(A_6_IBUF_25)
  );
  IBUF   A_5_IBUF (
    .I(A[5]),
    .O(A_5_IBUF_26)
  );
  IBUF   A_4_IBUF (
    .I(A[4]),
    .O(A_4_IBUF_27)
  );
  IBUF   A_3_IBUF (
    .I(A[3]),
    .O(A_3_IBUF_28)
  );
  IBUF   A_2_IBUF (
    .I(A[2]),
    .O(A_2_IBUF_29)
  );
  IBUF   A_1_IBUF (
    .I(A[1]),
    .O(A_1_IBUF_30)
  );
  IBUF   A_0_IBUF (
    .I(A[0]),
    .O(A_0_IBUF_31)
  );
  IBUF   B_31_IBUF (
    .I(B[31]),
    .O(B_31_IBUF_32)
  );
  IBUF   B_30_IBUF (
    .I(B[30]),
    .O(B_30_IBUF_33)
  );
  IBUF   B_29_IBUF (
    .I(B[29]),
    .O(B_29_IBUF_34)
  );
  IBUF   B_28_IBUF (
    .I(B[28]),
    .O(B_28_IBUF_35)
  );
  IBUF   B_27_IBUF (
    .I(B[27]),
    .O(B_27_IBUF_36)
  );
  IBUF   B_26_IBUF (
    .I(B[26]),
    .O(B_26_IBUF_37)
  );
  IBUF   B_25_IBUF (
    .I(B[25]),
    .O(B_25_IBUF_38)
  );
  IBUF   B_24_IBUF (
    .I(B[24]),
    .O(B_24_IBUF_39)
  );
  IBUF   B_23_IBUF (
    .I(B[23]),
    .O(B_23_IBUF_40)
  );
  IBUF   B_22_IBUF (
    .I(B[22]),
    .O(B_22_IBUF_41)
  );
  IBUF   B_21_IBUF (
    .I(B[21]),
    .O(B_21_IBUF_42)
  );
  IBUF   B_20_IBUF (
    .I(B[20]),
    .O(B_20_IBUF_43)
  );
  IBUF   B_19_IBUF (
    .I(B[19]),
    .O(B_19_IBUF_44)
  );
  IBUF   B_18_IBUF (
    .I(B[18]),
    .O(B_18_IBUF_45)
  );
  IBUF   B_17_IBUF (
    .I(B[17]),
    .O(B_17_IBUF_46)
  );
  IBUF   B_16_IBUF (
    .I(B[16]),
    .O(B_16_IBUF_47)
  );
  IBUF   B_15_IBUF (
    .I(B[15]),
    .O(B_15_IBUF_48)
  );
  IBUF   B_14_IBUF (
    .I(B[14]),
    .O(B_14_IBUF_49)
  );
  IBUF   B_13_IBUF (
    .I(B[13]),
    .O(B_13_IBUF_50)
  );
  IBUF   B_12_IBUF (
    .I(B[12]),
    .O(B_12_IBUF_51)
  );
  IBUF   B_11_IBUF (
    .I(B[11]),
    .O(B_11_IBUF_52)
  );
  IBUF   B_10_IBUF (
    .I(B[10]),
    .O(B_10_IBUF_53)
  );
  IBUF   B_9_IBUF (
    .I(B[9]),
    .O(B_9_IBUF_54)
  );
  IBUF   B_8_IBUF (
    .I(B[8]),
    .O(B_8_IBUF_55)
  );
  IBUF   B_7_IBUF (
    .I(B[7]),
    .O(B_7_IBUF_56)
  );
  IBUF   B_6_IBUF (
    .I(B[6]),
    .O(B_6_IBUF_57)
  );
  IBUF   B_5_IBUF (
    .I(B[5]),
    .O(B_5_IBUF_58)
  );
  IBUF   B_4_IBUF (
    .I(B[4]),
    .O(B_4_IBUF_59)
  );
  IBUF   B_3_IBUF (
    .I(B[3]),
    .O(B_3_IBUF_60)
  );
  IBUF   B_2_IBUF (
    .I(B[2]),
    .O(B_2_IBUF_61)
  );
  IBUF   B_1_IBUF (
    .I(B[1]),
    .O(B_1_IBUF_62)
  );
  IBUF   B_0_IBUF (
    .I(B[0]),
    .O(B_0_IBUF_63)
  );
  IBUF   Sel_IBUF (
    .I(Sel),
    .O(Sel_IBUF_64)
  );
  OBUF   O_31_OBUF (
    .I(O_31_OBUF_65),
    .O(O[31])
  );
  OBUF   O_30_OBUF (
    .I(O_30_OBUF_66),
    .O(O[30])
  );
  OBUF   O_29_OBUF (
    .I(O_29_OBUF_67),
    .O(O[29])
  );
  OBUF   O_28_OBUF (
    .I(O_28_OBUF_68),
    .O(O[28])
  );
  OBUF   O_27_OBUF (
    .I(O_27_OBUF_69),
    .O(O[27])
  );
  OBUF   O_26_OBUF (
    .I(O_26_OBUF_70),
    .O(O[26])
  );
  OBUF   O_25_OBUF (
    .I(O_25_OBUF_71),
    .O(O[25])
  );
  OBUF   O_24_OBUF (
    .I(O_24_OBUF_72),
    .O(O[24])
  );
  OBUF   O_23_OBUF (
    .I(O_23_OBUF_73),
    .O(O[23])
  );
  OBUF   O_22_OBUF (
    .I(O_22_OBUF_74),
    .O(O[22])
  );
  OBUF   O_21_OBUF (
    .I(O_21_OBUF_75),
    .O(O[21])
  );
  OBUF   O_20_OBUF (
    .I(O_20_OBUF_76),
    .O(O[20])
  );
  OBUF   O_19_OBUF (
    .I(O_19_OBUF_77),
    .O(O[19])
  );
  OBUF   O_18_OBUF (
    .I(O_18_OBUF_78),
    .O(O[18])
  );
  OBUF   O_17_OBUF (
    .I(O_17_OBUF_79),
    .O(O[17])
  );
  OBUF   O_16_OBUF (
    .I(O_16_OBUF_80),
    .O(O[16])
  );
  OBUF   O_15_OBUF (
    .I(O_15_OBUF_81),
    .O(O[15])
  );
  OBUF   O_14_OBUF (
    .I(O_14_OBUF_82),
    .O(O[14])
  );
  OBUF   O_13_OBUF (
    .I(O_13_OBUF_83),
    .O(O[13])
  );
  OBUF   O_12_OBUF (
    .I(O_12_OBUF_84),
    .O(O[12])
  );
  OBUF   O_11_OBUF (
    .I(O_11_OBUF_85),
    .O(O[11])
  );
  OBUF   O_10_OBUF (
    .I(O_10_OBUF_86),
    .O(O[10])
  );
  OBUF   O_9_OBUF (
    .I(O_9_OBUF_87),
    .O(O[9])
  );
  OBUF   O_8_OBUF (
    .I(O_8_OBUF_88),
    .O(O[8])
  );
  OBUF   O_7_OBUF (
    .I(O_7_OBUF_89),
    .O(O[7])
  );
  OBUF   O_6_OBUF (
    .I(O_6_OBUF_90),
    .O(O[6])
  );
  OBUF   O_5_OBUF (
    .I(O_5_OBUF_91),
    .O(O[5])
  );
  OBUF   O_4_OBUF (
    .I(O_4_OBUF_92),
    .O(O[4])
  );
  OBUF   O_3_OBUF (
    .I(O_3_OBUF_93),
    .O(O[3])
  );
  OBUF   O_2_OBUF (
    .I(O_2_OBUF_94),
    .O(O[2])
  );
  OBUF   O_1_OBUF (
    .I(O_1_OBUF_95),
    .O(O[1])
  );
  OBUF   O_0_OBUF (
    .I(O_0_OBUF_96),
    .O(O[0])
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

