module Processor(clk,reset,init,enter,in,out,halt,IR40,MeminstOut,regAOut,RAMout);
	input clk,reset,enter;
	input init;
	input [7:0]in;
	output [7:0]out;
	output halt;
	output [4:0]MeminstOut;
    output [7:0]regAOut,RAMout;
    output [4:0]IR40;
	
	
DataPath DP1(clk,reset,init,IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub,in,out,IR75,Aeq0,Apos,IR40,MeminstOut,regAOut,RAMout);
CU CU1(clk,reset,enter,Aeq0,Apos,IR75,IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub,halt);

endmodule