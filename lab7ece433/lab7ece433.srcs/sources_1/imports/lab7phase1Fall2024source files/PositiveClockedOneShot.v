// File name	: PositiveClockedOneShot.v
// Written by	: Jianjian Song
// ECE433 Fall 2024
// Genereate a shot with positive pulse output on a postive edge of input
`timescale 1ns / 1ps

module PositiveClockedOneShot(
input InputPulse, Reset, CLOCK,
output reg OneShot);
parameter InitialState=0, OneShotState=1, UnusedState=2, WaitState=3;
reg [1:0] State;

always@(State)
	if(State==OneShotState) OneShot<=1;	//positive output
	else OneShot<=0;

always @ (posedge CLOCK or posedge Reset)
	if(Reset==1)	State <= WaitState; else
	case (State)
	InitialState:	if (InputPulse==0) State<=InitialState; else State<=OneShotState;
	OneShotState:	if (InputPulse==0) State<=InitialState; else State<=WaitState;
	UnusedState:	State<=InitialState;
	WaitState:	if (InputPulse==0) State<=InitialState; else State<=WaitState;
	endcase
endmodule
