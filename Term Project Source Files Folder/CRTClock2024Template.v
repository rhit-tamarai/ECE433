`timescale 1ns / 1ps
//File: CRTClock2024fallTemplate.v
//Generate 25MHz VGA clock from a SystemClock
//SystemClockFreq and CRTClockFreq are input parameters in MHz
//ECE433-01 Fall 2024
//Term Project on Pong game on VGA
//this is a template to be completed by students

module CRTClock2024fallTemplate #(parameter SystemClockSize=10)(
input [SystemClockSize-1:0] SystemClockFreq, CRTClockFreq,
output reg PixelClock,
input Reset, Clock);

//a counter is needed to generate PixelClock

endmodule

