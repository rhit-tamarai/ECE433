`timescale 1ns / 1ps
//ECE433 Fall 2024
module hsyncModule2024fall_tb;

	reg PixelClock,reset, clock;
	reg [9:0] SynchPulse, BackPorch, ActiveVideo, FrontPorch;

	wire hsync, LineEnd;
	wire [9:0] xposition;
	wire PixelClockOneShot=uut.PixelClockOneShot;
	wire [9:0] xcount=uut.xcount;

//module hsyncModule2024fall #(parameter xresolution=10)(
//input [xresolution-1:0] SynchPulse, BackPorch, ActiveVideo, FrontPorch, 
//output hsync, LineEnd, output reg [xresolution-1:0] xposition,
//input reset, clock, PixelClock);

	hsyncModule2024fall uut (SynchPulse,  BackPorch, ActiveVideo, 
	FrontPorch, hsync, LineEnd, xposition, reset, clock, PixelClock);

	initial begin
	PixelClock=0;   
	ActiveVideo = 6;   FrontPorch = 2;  SynchPulse = 3;  BackPorch = 4;   
	reset = 0; clock = 0;    end
	always #1 clock=~clock;
	always #4 PixelClock=~PixelClock;
	initial fork
	#0 reset=1; 	#12 reset=0; 
   #290 $stop;
	join 
endmodule
