module ROM(clock,WE,Address,initialize,D,Q);
    parameter n = 8;
	input clock;
	input WE;
	input[4:0]Address;
	input initialize;
	input[n-1:0]D;
	output reg [n-1:0]Q;
	
reg [7:0]rom[31:0];
reg [4:0]addr_reg;
  
always@ (posedge clock,posedge WE ,posedge initialize )
begin 

 if(initialize)
 begin 
 rom[5'b00000] = 8'h00;
 rom[5'b00001] = 8'h01;
 rom[5'b00010] = 8'h02;
 rom[5'b00011] = 8'h03;
 rom[5'b00100] = 8'h04;
 rom[5'b00101] = 8'h05;
 rom[5'b00110] = 8'h06;
 rom[5'b00111] = 8'h07;
 rom[5'b01000] = 8'h08;
 rom[5'b01001] = 8'h09;
 rom[5'b01010] = 8'h0a;
 rom[5'b01011] = 8'h0b;
 rom[5'b01100] = 8'h0c;
 rom[5'b01101] = 8'h0d;
 rom[5'b01110] = 8'h0e;
 rom[5'b01111] = 8'h0f;
 end

 if(WE)
 rom[Address] <= D;
 else 
 Q <= rom[Address];
 
 
end 

endmodule 