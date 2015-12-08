module ROM(clock,WE,Address,initialize,D,Q);
    parameter n = 8;
	input clock;
	input WE;
	input[4:0]Address;
	input[n-1:0]D;
	input initialize;
	output reg [n-1:0]Q;
	
reg [7:0]rom[31:0];
reg [4:0]addr_reg;
  
always@ (posedge clock,posedge WE)
begin 

 if(initialize)
 begin 
 rom[5'b00000] = 0x00;
 rom[5'b00001] = 0x01;
 rom[5'b00010] = 0x02;
 rom[5'b00011] = 0x03;
 rom[5'b00100] = 0x04;
 rom[5'b00101] = 0x05;
 rom[5'b00110] = 0x06;
 rom[5'b00111] = 0x07;
 rom[5'b01000] = 0x08;
 rom[5'b01001] = 0x09;
 rom[5'b01010] = 0x0a;
 rom[5'b01011] = 0x0b;
 rom[5'b01100] = 0x0c;
 rom[5'b01101] = 0x0d;
 rom[5'b01110] = 0x0e;
 rom[5'b01111] = 0x0f;
 end

 if(WE)
 rom[Address] <= D;
 else 
 Q <= rom[Address];
 
 
end 

endmodule 