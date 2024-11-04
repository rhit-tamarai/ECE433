`timescale 1ns / 1ps
//File Name: CRTcontroller2024fall_template.v
//Author: Jianjian Song
//Date: October 24, 2024
//ECE433 Fall 2024
//Test: On Nexys A7 board successfully
//Purpose: generate VGA timing signals hsync and vsync
// and synchronized(x,y) coordinates.
//inputs: resolution (x,y) and system clock in MHz
////active videos are Xresolution and Yresolution
//x ranges from 600 to 800 pixels. y ranges from 400 to 600 pixels
//synch pulse, back porch and front porch are defined within this module
//xpos, ypos are x and y position coordinates
// hsync <= ~(xposos > 664 && xposos <= 760);  // active for 95 clocks
// vsync <= ~(yposos == 490 || yposos == 491);   // active for lines 490 and 491

module CRTcontroller2024fall_template #(parameter ResolutionSize=10, SystemClockSize=10) (
input [SystemClockSize-1:0] SystemClockFreq, CRTClockFreq, 
input [ResolutionSize-1:0] Xresolution, Yresolution,
output hsync, vsync, 
output [ResolutionSize-1:0] xpos, ypos,
input reset, clock);

//vsync is generated after active video and front porch from =>490 to >=491 
//These are implementation numbers
parameter vSynchPulse=10'd2, vFrontPorch=10'd10, vBackPorch=10'd29; //vsynch=520

//following are simulation parameters for vsynch
//parameter vSynchPulse=10'd1, vFrontPorch=10'd2, vBackPorch=10'd3; //vsynch=10 yresolution=4

//hsync is generated after active video and front porch from >664 to >=760 
//These are implementation numbers
parameter hSynchPulse=10'd95, hFrontPorch=10'd25, hBackPorch=10'd40; //hsynch=800

//following are simulation parameters for hsynch
//parameter hSynchPulse=10'd2, hFrontPorch=10'd1, hBackPorch=10'd2; //hsynch=13, xresolution=8

wire LineEnd, PixelClock;

//module hsyncModule2024fall #(parameter xresolution=10)(
//input [xresolution-1:0] SynchPulse, BackPorch, ActiveVideo, FrontPorch, 
//output hsync, LineEnd, output reg [xresolution-1:0] xposition,
//input reset, clock, PixelClock);

hsyncModule2024fall hsyncModule(hSynchPulse, hBackPorch,  Xresolution, hFrontPorch, 
 hsync, LineEnd, xpos, reset, clock, PixelClock);

//module vsyncModule2024fall #(parameter yresolution=10)(
//input [yresolution-1:0] SynchPulse, BackPorch, ActiveVideo, FrontPorch,  
//output vsync, output [yresolution-1:0] yposition,
//input reset, clock, LineEnd);

vsyncModule2024fallTemplate vsyncModule(vSynchPulse, vBackPorch, Yresolution, 
vFrontPorch, vsync, ypos, reset, clock, LineEnd);

//module CRTClock2024fall #(parameter SystemClockSize=10)(
//input [SystemClockSize-1:0] SystemClockFreq, CRTClockFreq,
//output reg PixelClock,
//input Reset, Clock);


CRTClock2024fallTemplate CRTclockUnit(SystemClockFreq, CRTClockFreq, PixelClock, reset, clock);
endmodule
