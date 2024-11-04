`timescale 1ns / 1ps
//ECE 433 Fall 2024
module vsyncModule2024fall_tb;

	reg LineEnd, reset, clock;
	reg [9:0] SynchPulse, FrontPorch, ActiveVideo, BackPorch;

	wire vsync;
	wire [9:0] yposition;

//module vsyncModule2024fall #(parameter yresolution=10)(
//input [yresolution-1:0] SynchPulse, BackPorch, ActiveVideo, FrontPorch,  
//output vsync, output [yresolution-1:0] yposition,
//input reset, clock, LineEnd);

	vsyncModule2024fall uut (SynchPulse,  BackPorch, ActiveVideo, 
	FrontPorch, vsync, yposition, reset, clock, LineEnd);
	
	initial begin
		ActiveVideo = 6;
		FrontPorch = 2; SynchPulse = 3;  BackPorch = 2;     
		reset = 0; clock = 0;    LineEnd=0; end
	always #1 clock=~clock;
	always #6 LineEnd=~LineEnd;
	initial fork
	#0 reset=1; 	#12 reset=0; 
   #300 $stop;
	join
endmodule

