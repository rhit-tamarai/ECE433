`timescale 1ns / 1ps
//ECE433 Fall 2024
module CRTClock2024fall_tb;

	reg [9:0] SystemClock, CRTclock;
	reg Reset, Clock;

	wire pixelclock;

//module CRTClock2024fall #(parameter SystemClockSize=10)(
//input [SystemClockSize-1:0] SystemClockFreq, CRTClockFreq,
//output reg PixelClock,
//input Reset, Clock);

	CRTClock2024fall uut (SystemClock, CRTclock, pixelclock, Reset, Clock);

	initial begin SystemClock = 100; CRTclock=25; Reset = 0; Clock = 0; end
 
	initial fork
	#0 Reset=1; #20 Reset=0;
	#800 $stop;
	join
	always #4 Clock=~Clock;   
endmodule

