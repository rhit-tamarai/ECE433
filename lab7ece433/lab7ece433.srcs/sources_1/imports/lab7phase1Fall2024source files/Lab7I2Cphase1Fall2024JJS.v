//File Name: Lab7I2Cphase1fall2024JJS.v
//Author: Jianjian Song
//Date: October 13, 2024
//ECE433 Fall 2024
//Phase 1 of Lab #7 I2C driver and TMP101 temperature sensor
//send first byte to I2C bus with slave address
//Output: 
//Go is "1" to start communication

module Lab7I2Cphase1fall2024JJS (
input Reset, clock, Start,
output SCL, ClockLocked, inout SDA);
//send this byte as address
parameter FirstByte=8'b10011011;    //7- bit address and Read=1 bit
//I2C speed frequency and system clock frequency
//parameter BaudRate=20'd25000, ClockFrequency=30'd80000000;
parameter BaudRate=20'd2, ClockFrequency=30'd20; // for testing 

wire clk80MHz;
//These are simulation parameters. 
//Comment the following two lines before making bit stream file
//parameter BaudRate=2, ClockFrequency=20;
assign clk80MHz=clock;

//disable Clock80MHz to exclude clock from simulation

//Clock80MHz SystemClock(.clk_in100MHz(clock),.clk_out80MHz(clk80MHz),.locked(ClockLocked));

wire WriteLoad, ReadorWrite, ShiftorHold, Select, BaudEnable, StartStopAck;

//module I2C_BaudRateGenerator (input Reset, clock, StartStop,
//input [19:0] I2Cfrequency,  //up to 1,000,000
//input [29:0] ClockFrequency,
//output reg  SCL);

I2C_BaudRateGenerator  BaudUnit(Reset, clk80MHz, BaudEnable, BaudRate, ClockFrequency,  SCL);

//module I2C_Host_Controller_phase1(
//input Reset, clock, Go, ClockI2C,
//output reg WriteLoad, ReadorWrite, ShiftorHold, Select, BaudEnable, StartStopAck);

I2C_Host_Controller_phase1  ControlUnit_phase1(Reset, clk80MHz, Start, SCL,
WriteLoad, ReadorWrite, ShiftorHold, Select, BaudEnable, StartStopAck);

//module I2C_DataUnit #(parameter	LENGTH = 8) (
//input Reset, clock, WriteLoad, ReadorWrite, ShiftorHold, Select, StartStopAck,
//input	[LENGTH-1:0]	SentData,
//output [LENGTH-1:0]	ReceivedData, inout SDA);

wire [7:0] ReceivedData;
I2C_DataUnit DataUnit(Reset, clk80MHz, WriteLoad, ReadorWrite, 
ShiftorHold, Select, StartStopAck, FirstByte, ReceivedData, SDA);

endmodule
