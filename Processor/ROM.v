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
  
always@ (posedge clock )
begin 

 if(initialize)
 begin 
 rom[5'b00000] = 8'b10000000;
 rom[5'b00001] = 8'b00111110;
 rom[5'b00010] = 8'b10000000;
 rom[5'b00011] = 8'b00111111;
 
 rom[5'b00100] = 8'b00011110;
 rom[5'b00101] = 8'b01111111;
 rom[5'b00110] = 8'b10110000;
 rom[5'b00111] = 8'b11001100;
 
 rom[5'b01000] = 8'b00011111;
 rom[5'b01001] = 8'b01111110;
 rom[5'b01010] = 8'b00111111;
 rom[5'b01011] = 8'b11000100;
 
 rom[5'b01100] = 8'b00011110;
 rom[5'b01101] = 8'b01111111;
 rom[5'b01110] = 8'b00111110;
 rom[5'b01111] = 8'b11000100;
 
 rom[5'b10000] = 8'b00011110;
 rom[5'b10001] = 8'b11111111;
 
 rom[5'b11110] = 8'b00000000;
 rom[5'b11111] = 8'b00000000;
 end

 if(WE)
 rom[Address] <= D;
 else 
 Q <= rom[Address];
 
 
end 

endmodule 