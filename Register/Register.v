module Register(in,Clock,Load,Clear,A_Reg);

 parameter n = 8;
 input [n-1:0]in;
 input Clock,Load,Clear;
 output reg[n-1:0]A_Reg;



always @( posedge Clock, negedge Clear )
begin 

 if(!Clear)
 A_Reg <= 0;
 else
 
 begin  
 if(Load)
 A_Reg <= in;  
 else
 A_Reg <= A_Reg;
 end 
 
end 


endmodule 