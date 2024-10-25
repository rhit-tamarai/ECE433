`timescale 1ns / 1ps
//File Name: TwoTemperatureConverter.v
//Jianjian Song
//ECE433 Fall 2024
//October 13, 2024
//Convert Two 8-bit temperatures in Celsius 
// to Two 2-digits in Fahrenheit
//Define a LongTemp wire to do 16-bit multiplication

module OneTemperatureConverter(Temp, First1, First0, Second1, Second0);
input [7:0] Temp;
output [3:0] First1, First0, Second1, Second0;
wire [15:0] LongTemp=Temp;

assign First1 = (LongTemp*8'd18/'d10+8'd32)/8'd10;
assign First0 = (LongTemp*8'd18/8'd10+8'd32)%8'd10;

assign Second1 = Temp/8'd10;
assign Second0 = Temp%8'd10;

endmodule
