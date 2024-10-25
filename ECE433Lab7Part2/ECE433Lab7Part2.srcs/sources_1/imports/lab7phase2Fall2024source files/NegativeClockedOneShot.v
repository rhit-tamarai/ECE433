// File name	: NegativeClockedOneShot.v
// Written by	: Jianjian Song
//ECE433 Fall 2024
//Genereate a shot with positive pulse output on the negative edge of input
`timescale 1ns / 1ps

module NegativeClockedOneShot(
input	InputPulse, Reset, CLOCK,
output reg OneShot);
parameter InitialState=0, OneShotState=1, UnusedState=2, WaitState=3;
reg [1:0] State;

always@(State)
	if(State==OneShotState) OneShot<=1;
	else OneShot<=0;

always @ (posedge CLOCK)
	if(Reset==1)	State <= InitialState; else
	case (State)
	InitialState:	if (InputPulse==1) State<=InitialState; else State<=OneShotState;
	OneShotState:	if (InputPulse==1) State<=InitialState; else State<=WaitState;
	UnusedState:	State<=InitialState;
	WaitState:	if (InputPulse==1) State<=InitialState; else State<=WaitState;
	endcase
endmodule
