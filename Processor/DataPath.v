module DataPath(clk,clear,init,IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub,in,out,IR75,Aeq0,Apos,IR40,MeminstOut,regAOut,RAMout);
   input clk,clear;
   input init;
	input IRload,JMPmux,PCload,Meminst,MemWr,Aload,Sub;
	input[1:0]Asel;
	input [7:0]in;
	output [7:0]out;
	output [2:0]IR75;
	output Aeq0,Apos;
	wire [7:0]zero = 0;
	
    output [4:0]MeminstOut;
    output [7:0]regAOut,RAMout;
    assign  regAOut = out ;
    output [4:0]IR40;
	InstructionCycleOperations ICO(clk,clear,IRload,PCload,JMPmux,Meminst,RAMout,MeminstOut,IR75,IR40);
	ROM #(.n(8)) romA(clk,MemWr,MeminstOut,init,regAOut,RAMout);
	InstructionSetOperations #(.n(8)) ISO(RAMout,in,zero,Asel,clk,Aload,clear,Sub,Aeq0,Apos,out);
	

endmodule 