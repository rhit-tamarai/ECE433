`timescale 1ns / 1ps

//This is a template from the instructor
//File Name: I2C_Host_Controller_phase1_temp.v
//This is a template to be completed by students
//Author: Jianjian Song (change to your names)
//Date: October 13, 2024
//ECE433 Fall 2024
//ControllerI2C for I2C Master Circuit
//Inputs: 
//Output: 
//ReadorWrite==1 to read
//ReadorWrite==0 to write
//Start is Logic "1" to start I2C communication
//StartDelay=1 to start DelayLoop2024Fall()


module I2C_Host_Controller_phase1_temp(
input Reset, clock, Start, ClockI2C,
output reg WriteLoad, ReadorWrite, ShiftorHold, Select, BaudEnable, StartStopAck);

parameter InitialState=3'd0, StartState=3'd1, LoadState=3'd2, WriteState=3'd3;
parameter AcknowledgeState=3'd4, TransitState=3'd5, StopState=3'd6;

reg [3:0] DataCounter; 
reg [2:0] State, NextState;

wire TimeOut;
reg StartDelay;
//module DelayLoop2024Fall(input Clock, Reset, StartDelay, output reg Timeout);
DelayLoop2024Fall DelayUnit(clock, Reset, StartDelay,TimeOut);

//module NegativeClockedOneShot(input InputPulse, Reset, CLOCK, output reg OneShot);
//module PositiveClockedOneShot(input InputPulse, Reset, CLOCK, output reg OneShot);
wire OneShotI2Cnegative, OneShotI2Cpositive;
NegativeClockedOneShot OneShotUnitNeg(ClockI2C, Reset, clock, OneShotI2Cnegative) ;
PositiveClockedOneShot OneShotUnitPos(ClockI2C, Reset, clock, OneShotI2Cpositive) ;
	
//next state block


//counting the number of shifts


//output block


endmodule
