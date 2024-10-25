`timescale 1ns / 1ps
//File Name: I2C_Host_Controller_phase2_tb
//Author: Jianjian Song
//Date: October 15, 2024
//ECE433 Fall 2024
//set Divider = 3 for simulation in module DelayTime()
//parameter	Divider = 3;
module I2C_Host_Controller_phase2_tb;
	reg Go, SDA, Reset, ClockI2C, clock;

	wire WriteLoad, ReadorWrite, ShiftorHold, Select, BaudEnable, StartStopAck,DONE;
	wire [3:0] State=uut.State;
	wire [3:0] DataCounter=uut.DataCounter;
	wire TimeOut=uut.TimeOut, ACKbit=uut.ACKbit;
	wire OneShotPositive=uut.OneShotPositive, OneShotNegative=uut.OneShotNegative;

//module I2C_Host_Controller_phase2 (input Reset, clock, Start, ClockI2C, SDA,
//output reg WriteLoad, ReadorWrite, ShiftorHold, Select, BaudEnable,
//output reg StartStopAck, DONE);
//
I2C_Host_Controller_phase2 uut (Reset, clock, Go, ClockI2C, SDA, WriteLoad, ReadorWrite, 
ShiftorHold, Select, BaudEnable, StartStopAck, DONE);
	
	initial begin  Go = 0;  Reset = 0;  ClockI2C = 0;  clock = 0; end
	always #4 clock=~clock;
	always #12 ClockI2C=~ClockI2C;
	initial fork
	#0 Go = 0;  #12 Go = 1;  
	#0 Reset = 1;  #6 Reset = 0; 
	#0 SDA=0;  #13 SDA=1; #25 SDA=0; #56 SDA=1; #134 SDA=0; #189 SDA=1; 
	#300 SDA=0;
	#900 $stop;
	join
      
endmodule
