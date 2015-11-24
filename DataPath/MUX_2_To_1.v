module MUX_2_To_1(inA,inB,sel,out);
  parameter n = 5;
  input [n-1:0]inA,inB;
  input [0:0]sel;
  output [n-1:0]out;
  
assign out = sel?inA:inB;


endmodule 
  