//File Name: I2C_BaudRateGenerator.v
//Author: Jianjian Song
//Date: October 13, 2024
//ECE433 Fall 2024
//Input: I2Cfrequency, i.e., Baud Rate in BaudRate, S
//Input: ystem Clock Frequency in ClockFrequency
//Output: SCL is a square wave
//-------------------------------------------------------------------

module I2C_BaudRateGenerator (input Reset, clock, StartStop,
input [19:0] I2Cfrequency,  //up to 1,000,000
input [29:0] ClockFrequency,
output reg  SCL);

reg [29:0] 	baud_count;

 always @(posedge clock)
      if(Reset==1) begin baud_count <= 29'b0;
      	     	SCL <= 1'b1;	//idle is "1"
					end
		else 
		case (StartStop)
		1'b0: begin SCL <= 1'b1; baud_count <= 29'b0; end
		1'b1: if (baud_count < (ClockFrequency/(I2Cfrequency*2)-1)) 
		begin
           		baud_count <= baud_count + 1'b1;
           		SCL <= SCL;
		end
       else
		begin
					baud_count <= 29'b0;
      	     	SCL <= ~SCL;
      	end
		endcase
endmodule
