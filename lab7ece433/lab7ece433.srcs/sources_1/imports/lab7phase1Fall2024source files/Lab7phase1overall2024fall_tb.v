`timescale 1ns / 1ps
//File Name: Lab7I2Cphase1fall2024JJS_tb.v
//ECE433 Fall 2024
//These are simulation parameters. 
//in Lab7I2Cphase1Fall2024JJS.v
//parameter BaudRate=2, ClockFrequency=20;
//assign clk85MHz=clock;
//SystemClock85MHz SystemClock(clock,clk85MHz,ClockLocked);
//Change the delay loop to 3 counts in DelayUnit of Control Unit 
module Lab7I2Cphase1fall2024JJS_tb;
	reg Start, Reset, clock;
	wire SCL, ClockLocked;
	// Bidirs
	wire SDA;
	wire [2:0] State=DUT.ControlUnit_phase1.State;
	wire OneShotI2Cnegative=DUT.ControlUnit_phase1.OneShotI2Cnegative;
	wire OneShotI2Cpositive=DUT.ControlUnit_phase1.OneShotI2Cpositive;	
	wire [3:0] count=DUT.ControlUnit_phase1.DataCounter;

//module Lab7I2Cphase1fall2022JJS (
//input Reset, clock, Start,
//output SCL, ClockLocked, inout SDA);



Lab7I2Cphase1fall2024JJS DUT(Reset, clock, Start, SCL, ClockLocked, SDA);

	initial begin Start = 0;  Reset = 0;  clock = 0; end
    always #2 clock=~clock;
	initial fork
	#0 Reset=1;  #12 Reset=0;
	#0 Start=0;  #21 Start=1;     #61 Start=0;   
	#470 Start=1;  #479 Start=0;
	#600 $stop;
	join
      
endmodule

