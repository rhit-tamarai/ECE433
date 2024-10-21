`timescale 1ns / 1ps
// File name: DelayLoop2023Fall.v
// Written by: Jianjian Song
//to generate a number of clock cycle delay 
//and set Timeout to be 1 when the delay is over.
//StatDelay is 1 to start the delay cycles
//ECE433 Fall 2024

module DelayLoop2024Fall(
input Clock, Reset, StartDelay,
output reg Timeout);
//for simulation
//parameter	DelayCount = 3;	//simulation delay time in number of clock cycles
//for board implementation
parameter	DelayCount = 10000;	//implementation delay time in number of clock cycles
parameter 	NumberOfBits = 30;

reg 	[NumberOfBits-1:0]	count;
	
always @ (count)
	if(count==DelayCount) Timeout<=1;
	else Timeout<=0;
	
always @ (posedge Clock, posedge Reset)
    if(Reset==1) count<=0;
    else 
	if(StartDelay==0)		begin count <= 0; end
	else if (count>=DelayCount)	count<=0;
		else count <= count+1'b1;
endmodule
