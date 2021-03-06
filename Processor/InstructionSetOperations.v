module InstructionSetOperations(IROut,Input,GND, Asel,clk,loadA,clearA,sub,Aeq0,Apos,regAOut);    //SubOut,MuxOut);
 parameter n = 8;
 input [n-1:0]IROut,Input,GND;
 input [1:0]Asel;
 input clk,loadA,clearA,sub;
 //input [n-1:0]RAMout;
 output Aeq0,Apos;
 output [n-1:0]regAOut;
 
 
 wire [n-1:0]SubOut;
 wire [n-1:0]MuxOut;

//wire [7:0]SubOut;
//wire [7:0]MuxOut;
//wire [7:0]regAOut;
                        // 0    1   2    3
MUX_4_To_1 #(.b(8)) Mux1(SubOut,Input,IROut,GND,Asel,MuxOut);

Register #(.n(8)) regA(clk,clearA,loadA,MuxOut,regAOut);

AddSubtract #(.n(8)) AddSub(regAOut,IROut,sub,SubOut);

assign Apos = (regAOut[7] == 1)?0:1;
assign Aeq0 = (regAOut == 0)?1:0;


endmodule 