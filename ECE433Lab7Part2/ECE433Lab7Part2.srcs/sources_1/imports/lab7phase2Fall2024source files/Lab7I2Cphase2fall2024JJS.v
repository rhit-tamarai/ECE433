//File Name: Lab7I2Cphase2fall2024JJS.v
//Author: Jianjian Song
//Date: Oct. 2024
//ECE433 Fall 2024
//The top-level module for Lab 7 Phase 2
//ChipSelect is the lower 3-bit address of TM101 on SW3-1
//Read selected TMP101 temperature sensor
//send first address and Read byte to I2C bus with address {4'b1001,ChipSelect}
//Receive first byte temperature from the selected TMP101 on I2C bus
//Display the 8-bit temperature in Celsius on LEDs LD7-0 
//Display 2-digit temperature in Fahrenheit and 2-digit in Celsius
//on four 7-segment displays
//Mode = 0 for single read mode when Start is pressed to sample once
//Mode = 1 for continuous sampling mode

module Lab7I2Cphase2fall2024JJS (input Reset, Mode, Clock, Start, input [2:0] ChipSelect,
output SCL, ClockLocked, DONE, inout SDA,
output [7:0] ReceivedData, Transistors, Display);

parameter BaudRate=20'd25000, ClockFrequency=30'd80000000;
 wire clock80MHz; 

//Clock80MHz SystemClockUnit(.clk_in100MHz(Clock),.clk_out80MHz(clock80MHz), .locked(ClockLocked));

PositiveClockedOneShot StartOneShot(Start, Reset, clock80MHz, StartReading) ;

wire [7:0] Chip;
wire WriteLoad, ReadorWrite, ShiftorHold, Select, BaudEnable, StartStopAck;

//module ReadTMP101fall2024JJS(input Reset, clock, Start,
//input [7:0] FirstByte,
//input [19:0] BaudRate,
//input [29:0] ClockFrequency,
//output DONE, SCL,
//inout SDA,
//output [7:0] ReceivedData);
assign Chip = {4'b1001,ChipSelect,1'b1};
ReadTMP101fall2024JJS ReadUnit(Reset, clock80MHz, StartReading||Mode, 
     Chip, BaudRate, ClockFrequency, DONE, SCL, SDA, ReceivedData);
	
wire [3:0] First1, First0, Second1, Second0;
reg [7:0] Temperature;
always@(posedge clock80MHz)
	if(DONE==1) Temperature<=ReceivedData;
	else Temperature<=Temperature;
OneTemperatureConverter ConvertUnit(Temperature, First1, First0, Second1, Second0);

wire [7:0] D7,D6,D3,D2,D1,D0;
BCDto7Segment SelectedChip ({1'b0,ChipSelect},D7);
BCDto7Segment F1Unit(First1,D3);
BCDto7Segment F0Unit(First0,D2);
BCDto7Segment C1Unit(Second1, D1);
BCDto7Segment C0Unit(Second0,D0);

//module SevenSegDriverNexysA7 #(parameter N=8)(
//input [N-1:0] D7, D6,D5, D4, D3, D2, D1, D0,
//input Reset, Clock,
//output [N-1:0]	Display,
//output [N-1:0] Select);
SevenSegDriverNexysA7 SevenSegUnit(D7,8'b11111111, 8'b11111111, 8'b11111111, 
     D3, D2, D1, D0, Reset, clock80MHz, Display, Transistors);
endmodule
