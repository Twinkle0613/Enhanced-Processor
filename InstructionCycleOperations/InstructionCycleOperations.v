module InstructionCycleOperations(clk,clear,IRload,PCload,IMPsel,MeminstSel,
IRin,MeminstOut,IR75,IR40,IROut,PCOut,IMPmuxOut,IncOut);
 
 
  input clk,clear,IRload,PCload,IMPsel,MeminstSel;
  input  [7:0]IRin; 
  
  output [4:0]MeminstOut;
  output [2:0]IR75;
  output [4:0]IR40;
  output [7:0]IROut;
  output [4:0]PCOut;
  output [4:0]IMPmuxOut;
  output [4:0]IncOut;
  
  assign IR75[2:0] = IROut[7:5];
  assign IR40 = IROut[4:0];
  
  Register #(.n(8)) IR(clk,clear,IRload,IRin,IROut);
  MUX_2_To_1 #(.n(5)) IMP(IR40,IncOut,IMPsel,IMPmuxOut);
  Register #(.n(5)) PC(clk,clear,PCload,IMPmuxOut,PCOut);
  Increment #(.n(5)) Inc1(PCOut,IncOut);
  MUX_2_To_1 #(.n(5)) Memi(IR40,PCOut,MeminstSel,MeminstOut);
  
  endmodule
	