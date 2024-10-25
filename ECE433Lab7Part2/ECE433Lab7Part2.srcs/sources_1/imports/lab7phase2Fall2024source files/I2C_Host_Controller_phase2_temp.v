//File Name: I2C_Host_Controller_phase2_temp.v
//Note: This is a template file for Lab 7 Phase II
//The controller state machine is not complete.
//Author: Jianjian Song
//Date: October 15, 2024
//Version 4.0
//ECE433, Fall 2024
//Lab 7 Phase 2
//I2C Master Controller:
//1. Send Address and read until acknowledgment is received
//2. Receive one byte temperature from a TMP101
//Inputs: 
//Output: 
//ReadorWrite==1 to read
//ReadorWrite==0 to write
//Select==0 to StartStopAck
//Select==1	to choose shift register
//Start is "1" to start communication

module I2C_Host_Controller_phase2_temp(input Reset, clock, Start, ClockI2C, SDA,
output reg WriteLoad, ReadorWrite, ShiftorHold, Select, BaudEnable,
output reg StartStopAck, DONE);

parameter InitialState=4'd0;
parameter StartState=4'd1; //send Start command and delay a while
parameter LoadState=4'd2; //load first frame into shift register
parameter WriteState=4'd3; //transmit first frame
parameter AcknowledgeWriteState=4'd4; //release bus to wait for receiver to acknowledge reception
parameter CheckState=4'd5; //check if there is a right receiver. Resend 1st frame if no receiver has acknowledged
parameter ReadState=4'd6; //receive 8-bit temperature
parameter WaitState=4'd7; //wait for the falling edge of 9th clock cycle
parameter AcknowledgeReadState=4'd8; //send acknowledge to the temperature sensor
parameter TransitState=4'd9; //delay a while before sending Stop command
parameter StopState=4'd10;    //send Stop command

reg [3:0] DataCounter;
//state definitions
reg [3:0] State, NextState;

wire TimeOut;
reg StartDelayLoop;
//module DelayLoop2024Fall(input Clock, Reset, StartDelay, output reg Timeout);
DelayLoop2024Fall DelayUnit(clock, Reset, StartDelayLoop,TimeOut);

wire OneShotNegative, OneShotPositive;
//module NegativeClockedOneShot(input InputPulse, Reset, CLOCK,output reg OneShot);
NegativeClockedOneShot OneShotNegativeUnit(ClockI2C, Reset, clock, OneShotNegative);

//module PositiveClockedOneShot(input InputPulse, Reset, CLOCK, output reg OneShot);
PositiveClockedOneShot OneShotPositiveUnit(ClockI2C, Reset, clock, OneShotPositive);

//ACKbit always store the current bit from SDA
reg ACKbit;
always@(posedge clock)
	if(Reset==1) begin State<=InitialState; ACKbit<=1; end
	else begin State<=NextState; 
		if(OneShotPositive==1) ACKbit<=SDA; else ACKbit<=ACKbit; end
	
//next state block



//count update, negative SCL edge to write and positive SCL edge to read



//output block




endmodule
