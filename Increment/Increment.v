module Increment(in,out);
 parameter n = 8;
 input [n-1:0]in;
 output reg [n-1:0]out;
 
always @(in)
 begin
 out = in + 1;
 end 
 
endmodule 