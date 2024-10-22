`timescale 1ns / 1ps
//This is a tempplate to be completed by students
//File name: I2C_SDAmodule.v
//Author: Jianjian Song (change to your names)
//Date: October 13, 2024
//ECE433 Fall 2024
//Read==1
//Write==0
module I2C_SDAmodule(
input ReadorWrite, Select, StartStopAck, ShiftOut,
output ShiftIn, inout SDA);

wire SelectMuxOut;

assign SelectMuxOut = Select ? ShiftOut : StartStopAck;
assign SDA = ReadorWrite ? 1'bZ : SelectMuxOut;

// check this 
assign ShiftIn = SDA;

	
endmodule

