module RAM(clock,WE,Address,D,Q);
    parameter n = 8;
	input clock;
	input WE;
	input[4:0]Address;
	input[n-1:0]D;
	output reg [n-1:0]Q;


reg [7:0]ram[31:0];
reg [4:0]addr_reg;
  
always@ (posedge clock,posedge WE)
begin 
 if(WE)
 ram[Address] <= D;
 else 
 Q <= ram[Address];
end 

endmodule 