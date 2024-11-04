`timescale 1ns / 1ps
///File: PongGame2024fallTemplate.v
//Date: October 23, 2024

//pong game with new controller template
//ECE433-01 Fall 2024
//Term Project VGA driver template
//the video controller uses synch timings from the pong game
//the system clock should be 100MHz
//the VGA pixel clock is 25MHz
//this is a template for students to complete
//try to match the video_timer
//based on pong from http://www.bigmessowires.com/2009/06/21/fpga-pong/. 

module PongGame2024fallTemplate(
    input rota, rotb,  
    output [3:0] red, green, blue,
    output hsync, vsync,
    input Reset, Clock
    );

wire [9:0] xpos;
wire [9:0] ypos;

parameter [9:0] NumberofPixels=10'd640, NumberofLines=10'd480;
parameter [9:0] SystemClock=10'd100, CRTClock=10'd25; //MHz 

//module CRTcontroller2024fall_template #(parameter ResolutionSize=10, SystemClockSize=10) (
//input [SystemClockSize-1:0] SystemClockFreq, CRTClockFreq, 
//input [ResolutionSize-1:0] Xresolution, Yresolution,
//output hsync, vsync, 
//output [ResolutionSize-1:0] xpos, ypos,
//input reset, clock);

CRTcontroller2024fall_template VGAdisplay(SystemClock, CRTClock, 
     NumberofPixels, NumberofLines, hsync, vsync, xpos, ypos, Reset, Clock);
	  
//module game2024fallTemplate(
//input rota, rotb,
//input [9:0] xpos, ypos,
//output [3:0] red, green, blue,
//input Reset, clk25);

game2024fallTemplate gameUnit(rota, rotb, xpos, ypos, red, green, blue, Reset,Clock);

endmodule
