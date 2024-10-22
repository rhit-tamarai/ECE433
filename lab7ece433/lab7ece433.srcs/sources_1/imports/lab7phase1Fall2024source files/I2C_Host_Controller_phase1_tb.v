`timescale 1ns / 1ps
//File Name: I2C_Host_Controller_phase1_tb.v
//ECE433 Fall 2024
//Lab 7 Phase 1 Controller Simulation
//Change the delay loop parameter to 3 for simulation 
//module DelayLoop2023Fall(input Clock, Reset, StartDelay, output reg Timeout);
//parameter	Divider = 3;
module I2C_Host_Controller_phase1_tb;

	reg Start,Reset,ClockI2C,clock;


	wire WriteLoad, ReadorWrite, ShiftorHold, Select, BaudEnable, StartStopAck;
	wire [2:0] State=uut.State;
	wire [3:0] DataCounter=uut.DataCounter;
	wire TimeOut=uut.TimeOut;
	wire OneShotI2Cnegative=uut.OneShotI2Cnegative;
	wire OneShotI2Cpostive=uut.OneShotI2Cpositive;
//module I2C_Host_Controller_phase1(
//input Reset, clock, Start, ClockI2C,
//output reg WriteLoad, ReadorWrite, ShiftorHold, Select, BaudEnable, StartStopAck);
	I2C_Host_Controller_phase1 uut (Reset, clock, Start, ClockI2C, WriteLoad, 
	ReadorWrite, ShiftorHold, Select, BaudEnable, StartStopAck);
	
	initial begin  Start = 0;  Reset = 0;  ClockI2C = 0;  clock = 0; end
	always #4 clock=~clock;
	always #12 ClockI2C=~ClockI2C;
	initial fork
	#0 Start = 0;  #12 Start = 1;  
	#0 Reset = 1;  #6 Reset = 0; 
	#350 $stop;
	join
      
endmodule

