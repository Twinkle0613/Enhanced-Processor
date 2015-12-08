module Processor(clk,reset,enter,in,out,halt);
	input clk,reset,enter;
	input [7:0]in;
	output [7:0]out;
	output halt;
	
DataPath DP1(clk,reset,IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub,in,out,IR75,Aeq0,Apos);
CU CU1(clk,reset,enter,Aeq0,Apos,IR75,IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub,halt);

endmodule