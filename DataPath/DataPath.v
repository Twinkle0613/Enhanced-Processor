module DataPath(clk,clear,IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub,in,out,IR75,Aeq0,Apos,MeminstOut,regAOut,RAMout);
    input clk,clear;
	input IRload,JMPmux,PCload,Meminst,MemWr,Aload,Sub;
	input[1:0]Asel;
	input [7:0]in;
	output [7:0]out;
	output [2:0]IR75;
	output Aeq0,Apos;
    output [4:0]MeminstOut;
    output [7:0]regAOut,RAMout;

	InstructionCycleOperations ICO(clk,clear,IRload,PCload,JMPmux,Meminst,RAMout,MeminstOut,IR75);
	RAM #(.n(8)) ramA(clk,MemWr,MeminstOut,regAOut,RAMout);
	InstructionSetOperations #(.n(8)) ISO(RAMout,in,0,Asel,clk,Aload,clear,Sub,Aeq0,Apos,regAOut);
	

endmodule 