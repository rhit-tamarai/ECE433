`timescale 1ns / 1ps

//This is a template from the instructor
//File Name: I2C_Host_Controller_phase1_temp.v
//This is a template to be completed by students
//Author: Ishaan Tamarapalli, Andrew Zamora 
//Date: October 13, 2024
//ECE433 Fall 2024
//ControllerI2C for I2C Master Circuit
//Inputs: 
//Output: 
//ReadorWrite==1 to read
//ReadorWrite==0 to write
//Start is Logic "1" to start I2C communication
//StartDelay=1 to start DelayLoop2024Fall()


module I2C_Host_Controller_phase1(
input Reset, clock, Start, ClockI2C,
output reg WriteLoad, ReadorWrite, ShiftorHold, Select, BaudEnable, StartStopAck);

parameter InitialState=3'd0, StartState=3'd1, LoadState=3'd2, WriteState=3'd3;
parameter AcknowledgeState=3'd4, TransitState=3'd5, StopState=3'd6;

reg [3:0] DataCounter; 
reg [2:0] State, NextState;

wire TimeOut;
reg StartDelay;

//module DelayLoop2024Fall(input Clock, Reset, StartDelay, output reg Timeout);
DelayLoop2024Fall DelayUnit(clock, Reset, StartDelay,TimeOut);

//module NegativeClockedOneShot(input InputPulse, Reset, CLOCK, output reg OneShot);
//module PositiveClockedOneShot(input InputPulse, Reset, CLOCK, output reg OneShot);
wire OneShotI2Cnegative, OneShotI2Cpositive;
NegativeClockedOneShot OneShotUnitNeg(ClockI2C, Reset, clock, OneShotI2Cnegative) ;
PositiveClockedOneShot OneShotUnitPos(ClockI2C, Reset, clock, OneShotI2Cpositive) ;
	
//next state block
always @(posedge clock)
    if (Reset == 1) begin State <= InitialState; end 
    else begin State <= NextState; end 

always @(*) begin  // state logic 
    case(State) 
    InitialState: 
        if (Start == 1 && ClockI2C == 1) NextState <= StartState;
        else NextState <= InitialState;
    StartState: 
        if (TimeOut == 1) NextState <= LoadState; 
        else NextState <= StartState;
    LoadState: 
        if (DataCounter == 9) NextState <= WriteState;// check this  
        else NextState <= LoadState; 
    WriteState: 
        if (DataCounter == 1) NextState <= AcknowledgeState; 
        else NextState <= WriteState; 
    AcknowledgeState: 
        if (OneShotI2Cpositive == 1) NextState <= TransitState;
        else NextState <= AcknowledgeState;
    TransitState: 
        if (TimeOut == 1) NextState <= StopState; 
        else NextState <= TransitState;
    StopState: 
        if (TimeOut == 1) NextState <= InitialState; 
        else NextState <= StopState;
        
    default: NextState <= InitialState; 
    endcase
end    

//counting the number of shifts
always@(posedge clock)
    if(Reset==1) begin DataCounter<=4'd10; end // check if this needs to reset to 10
    else
    case (State)
        LoadState: if(OneShotI2Cnegative==1) DataCounter<=DataCounter-1'b1; else DataCounter<=DataCounter;
        WriteState: if(OneShotI2Cnegative==1) DataCounter<=DataCounter-1'b1; else DataCounter<=DataCounter;
    default: DataCounter<=4'd10; // check if this needs to be 10 
    endcase

//output block
always @(State or OneShotI2Cnegative) 
case (State)
    InitialState: begin
        BaudEnable <= 0;
        ReadorWrite <= 0;
        WriteLoad <= 0;
        Select <= 0;
        ShiftorHold <= 0;
        StartStopAck <= 1;
        StartDelay = 1;
    end    
    StartState: begin 
        BaudEnable <= 0;
        ReadorWrite <= 0;
        WriteLoad <= 0;
        Select <= 0;
        ShiftorHold <= 0;
        StartStopAck <= 0;
        StartDelay = 0; 
    end
    LoadState: begin
        BaudEnable <= 1;
        ReadorWrite <= 0;
        WriteLoad <= 1;
        Select <= 0;
        ShiftorHold <= 0;
        StartStopAck <= 0;
        StartDelay = 1;
    end    
    WriteState: begin 
        BaudEnable <= 1;
        ReadorWrite <= 0;
        WriteLoad <= 0;
        Select <= 1;
        ShiftorHold <= OneShotI2Cnegative;
        StartStopAck <= 0;
        StartDelay = 1;
    end
    AcknowledgeState: begin 
        BaudEnable <= 1;
        ReadorWrite <= 1;
        WriteLoad <= 0;
        Select <= 0;
        ShiftorHold <= 0;
        StartStopAck <= 0;
        StartDelay = 1;
    end 
    TransitState: begin 
        BaudEnable <= 0;
        ReadorWrite <= 0;
        WriteLoad <= 0;
        Select <= 0;
        ShiftorHold <= 0;
        StartStopAck <= 0;
        StartDelay = 0;
    end
    StopState: begin 
        BaudEnable <= 0;
        ReadorWrite <= 0;
        WriteLoad <= 0;
        Select <= 0;
        ShiftorHold <= 0;
        StartStopAck <= 1;
        StartDelay = 0;
    end
    
    default: begin
        BaudEnable <= 0;
        ReadorWrite <= 0;
        WriteLoad <= 0;
        Select <= 0;
        ShiftorHold <= 0;
        StartStopAck <= 0;
        StartDelay = 1;
    end
endcase


endmodule
