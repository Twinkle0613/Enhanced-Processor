module Processor(clk,reset,init,enter,in,out,halt,DisplayState,IR75);
	input clk,reset,enter;
	input init;
	input [7:0]in;
	output [7:0]out;
	output halt;
//	output [4:0]MeminstOut;
///  output [7:0]regAOut,RAMout;
  output [2:0]IR75;
	output [3:0]DisplayState;
	
		wire IRload, JMPmux, PCload, Meminst, MemWr, Aload, Sub;
	wire [1:0]Asel;
	//wire [7:0]Minput,
	//wire [7:0]Moutput,
	wire [2:0]IR75;
	wire Aeq0, Apos;
//	wire [7:0] RamToIR, OutAsel, A, ProdSub; // erasable
//	wire [4:0] Address, IR40, OutIncre, OutJMP, PC40; // erasable

DataPath DP1(clk,reset,init,IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub,in,out,IR75,Aeq0,Apos,IR40,MeminstOut,regAOut,RAMout);
CU CU1(clk,reset,enter,Aeq0,Apos,IR75,IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub,halt,DisplayState);

endmodule