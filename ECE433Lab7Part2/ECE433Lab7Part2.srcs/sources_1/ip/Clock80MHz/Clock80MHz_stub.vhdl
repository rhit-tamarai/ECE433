-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Tue Oct 29 16:11:06 2024
-- Host        : RHIT-R912N07F running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Xilinx/ECE433/Lab7/ECE433/ECE433Lab7Part2/ECE433Lab7Part2.srcs/sources_1/ip/Clock80MHz/Clock80MHz_stub.vhdl
-- Design      : Clock80MHz
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Clock80MHz is
  Port ( 
    clk_out80MHz : out STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in100MHz : in STD_LOGIC
  );

end Clock80MHz;

architecture stub of Clock80MHz is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out80MHz,locked,clk_in100MHz";
begin
end;
