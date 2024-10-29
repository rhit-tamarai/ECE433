// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Tue Oct 29 16:11:06 2024
// Host        : RHIT-R912N07F running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Xilinx/ECE433/Lab7/ECE433/ECE433Lab7Part2/ECE433Lab7Part2.srcs/sources_1/ip/Clock80MHz/Clock80MHz_stub.v
// Design      : Clock80MHz
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module Clock80MHz(clk_out80MHz, locked, clk_in100MHz)
/* synthesis syn_black_box black_box_pad_pin="clk_out80MHz,locked,clk_in100MHz" */;
  output clk_out80MHz;
  output locked;
  input clk_in100MHz;
endmodule
