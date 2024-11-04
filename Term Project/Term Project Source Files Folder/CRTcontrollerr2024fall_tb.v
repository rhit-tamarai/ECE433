`timescale 1ns / 1ps
//ECE433 Fall 2024

module CRTcontroller2024fall_tb;

	reg [9:0] Xresolution, Yresolution;
	reg [9:0] SystemClock, CRTClock;
	reg reset, clock;

	wire hsync, vsync;
	wire [9:0] xposition, yposition;
	wire PixelClock=uut.PixelClock;
//vsync debugging outputs	
//	wire NextLineOneShot=uut.vsyncModule.NextLineOneShot;
//    wire [9:0] EndCount=uut.vsyncModule.EndCount;
//	wire [9:0] ycount=uut.vsyncModule.ycount;
	

//module CRTcontroller2024fall #(parameter ResolutionSize=10, SystemClockSize=10) (
//input [SystemClockSize-1:0] SystemClockFreq, CRTClockFreq, 
//input [ResolutionSize-1:0] Xresolution, Yresolution,
//output hsync, vsync, 
//output [ResolutionSize-1:0] xpos, ypos,
//input reset, clock);

	CRTcontroller2024fall uut (
	SystemClock, CRTClock, Xresolution, Yresolution, hsync, 
	vsync, xposition, yposition, reset, clock);

	initial begin
		// Initialize Inputs
		Xresolution = 10;
		Yresolution = 4;
		SystemClock = 10;
		CRTClock=2;
		reset = 1;
		clock=0;
	end
	always #1 clock=~clock;
	initial fork
	#0 reset=1; 	#5 reset=0; 
   #1200 $stop;
	join
      
endmodule

