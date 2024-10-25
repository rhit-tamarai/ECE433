`timescale 1ns / 1ps
//I2C Shift Register
//ECE433 Fall 2024

//WriteLoad=1 to parallel load
//shiftorHold=1 to shift and =0 to hold

module I2C_ShiftRegister #(parameter LENGTH = 8)(
input	Reset, CLOCK, WriteLoad, ShiftorHold, ShiftIn,
input	[LENGTH-1:0]	SentData,
output ShiftOut,
output [LENGTH-1:0]	ReceivedData);
reg [LENGTH-1:0]	ShiftRegister;

assign ShiftOut = ShiftRegister[LENGTH-1];
assign ReceivedData = ShiftRegister;

always @ (posedge CLOCK)
	if(Reset==1)	ShiftRegister <= 0;
	else
	if(WriteLoad==1)	//parallel load
	ShiftRegister <= SentData;
	else
case (ShiftorHold)
	1'b1:	ShiftRegister <= {ShiftRegister[LENGTH-2:0],ShiftIn};	//shfit
	default: ShiftRegister <= ShiftRegister;	// hold
	endcase
	
endmodule
