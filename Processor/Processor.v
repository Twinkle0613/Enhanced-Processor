//module Processor(clk,reset,init,enter,in,out,halt,IR40,MeminstOut,regAOut,RAMout,DisplayState,IR75);
//module Processor(clk,reset,init,enter,in,out,halt,DisplayState);
module Processor(CLOCK_50,SW,KEY,LEDR,LEDG);
	input CLOCK_50;
	input [9:0]SW;
	input [3:0]KEY;
	output [9:0]LEDR;
	output [7:0]LEDG;
	
	/*input CLOCK_50,reset,enter;
	input init;
	input [7:0]in;
	output [7:0]out;
	output halt;
	output [3:0]DisplayState;*/
	
	wire CLOCK_50,reset,enter;
	wire init;
	wire [7:0]in;
	wire [7:0]out;
	wire halt;
	wire [3:0]DisplayState;
  // reg [7:0]wireIn,wireOut;
	
	assign in[7:0] = SW[7:0];
	assign init = SW[8];
	assign enter = SW[9];
	assign LEDG[3:0] = DisplayState[3:0];
   assign LEDR[7:0] = out[7:0];
	assign reset = KEY[3];
   assign LEDG[6] = ~reset;
	//assign wireIn = in;
	//assign wireOut = out;

/*	
	always@(negedge CLOCK_50)
	
	begin 
   wireIn = in;
	wireOut = out;
	if(KEY[2])
	LEDR <= wireIn;
	else 
	LEDR <= wireOut;
	end 
*/
	
	wire IRload, JMPmux, PCload, Meminst, MemWr, Aload, Sub;
	wire [1:0]Asel;
	wire [4:0]IR40;
	wire [2:0]IR75;
	wire Aeq0, Apos;
	wire [4:0]MeminstOut;
   wire [7:0]regAOut,RAMout;
   wire clock;
  
  halfSecClock(CLOCK_50,reset,clock);
  assign LEDG[7] = clock;	
  
DataPath DP1(clock,reset,init,IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub,in,out,IR75,Aeq0,Apos,IR40,MeminstOut,regAOut,RAMout);
CU CU1(clock,reset,enter,Aeq0,Apos,IR75,IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub,halt,DisplayState);

endmodule
