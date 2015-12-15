module CU(clk,reset,Enter,Aeq0,Apos,IR,IRload,JMPmux,PCload,Meminst,MenWr,Asel,Aload,Sub,Halt,DisplayState);

	input clk,reset,Enter,Aeq0,Apos;
	input [2:0]IR;
	output reg IRload,JMPmux,PCload,Meminst,MenWr,Aload,Sub,Halt;
	output reg [1:0]Asel;
	output [3:0]DisplayState;
	
	//assign reset = KEY[0];
	//assign Enter = SW[5];                           
	//assign Aeq0 = SW[4];
	//assign Apos = SW[3];
	//assign IR = SW[2:0];
	
	//assign LEDR[9] = IRload ;
	//assign LEDR[8] = JMPmux ;
	//assign LEDR[7] = PCload ;
	//assign LEDR[6] = Meminst ;
	//assign LEDR[5] = MenWr;
	//assign LEDR[4] = Aload;
	//assign LEDR[3] = Sub;                                                                                          
	//assign LEDR[2] = Halt;
	//assign LEDR[1:0] = Asel;
	//assign LEDG[3:0] = DisplayState;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
	
	
//oneSecClock(CLOCK_50,reset,ClOCK_1S);
	
parameter start = 4'b0000, fetch = 4'b0001, decode = 4'b0010;
parameter load = 4'b1000, store = 4'b1001, add = 4'b1010, sub = 4'b1011;
parameter Input = 4'b1100, jz = 4'b1101, jpos = 4'b1110, halt = 4'b1111;

reg [3:0] NextState,CurrState;
assign DisplayState = CurrState;
// ******START THE PROGRAM********

always@(posedge clk, negedge reset) //asynchronous clock and reset.
	if(!reset)
		CurrState <= start;		//if reset is active, the CurrState will stand in 'start'.
	else
		CurrState <= NextState;	//else the CurrState will next to another state.


always@(CurrState, Enter, IR, Aeq0, Apos)
begin
	case(CurrState) 	
	start: 	begin
			 IRload = 0;
			 JMPmux = 0;
			 PCload = 0;
			 Meminst = 0;
			 MenWr = 0;
			 Asel = 2'b00;
	         Aload = 0;
	         Sub = 0;
             Halt = 0;
             NextState = fetch;	//straigh away 
			end 
	
	fetch: 	begin
			 IRload = 1;
			 JMPmux = 0;
			 PCload = 1;
			 Meminst = 0;
			 MenWr = 0;
			 Asel = 2'b00;
	         Aload = 0;
	         Sub = 0;
             Halt = 0;
             NextState = decode;
			end 
			
	decode:	begin
			 IRload = 0;
			 JMPmux = 0;
			 PCload = 0;
			 Meminst = 1;
			 MenWr = 0;
			 Asel = 2'b00;
	         Aload = 0;
	         Sub = 0;
             Halt = 0;
             case(IR)
				3'b000:	NextState = load;
				3'b001:	NextState = store;
				3'b010:	NextState = add;
				3'b011:	NextState = sub;
				3'b100:	NextState = Input;
				3'b101:	NextState = jz;
				3'b110:	NextState = jpos;
				3'b111:	NextState = halt;
			 endcase
		    
			end 
			
	load:	begin 
			 IRload = 0;
			 JMPmux = 0;
			 PCload = 0;
			 Meminst = 0;
			 MenWr = 0;
			 Asel = 2'b10;
	         Aload = 1;
	         Sub = 0;
             Halt = 0;
             NextState = start;
			end 
			
	store:	begin 
			 IRload = 0;
			 JMPmux = 0;
			 PCload = 0;
			 Meminst = 1;
			 MenWr = 1;
			 Asel = 2'b00;
	         Aload = 0;
	         Sub = 0;
             Halt = 0;
             NextState = start;
			end 
		  
	add:	begin 
			 IRload = 0;
			 JMPmux = 0;
			 PCload = 0;
			 Meminst = 0;
			 MenWr = 0;
			 Asel = 2'b00;
	         Aload = 1;
	         Sub = 0;
             Halt = 0;
             NextState = start;
			end 
			
	sub:	begin 
			 IRload = 0;
			 JMPmux = 0;
			 PCload = 0;
			 Meminst = 0;
			 MenWr = 0;
			 Asel = 2'b00;
	         Aload = 1;
	         Sub = 1;
             Halt = 0;
             NextState = start;
			end
			
	Input:	begin 
			 IRload = 0;
			 JMPmux = 0;
			 PCload = 0;
			 Meminst = 0;
			 MenWr = 0;
			 Asel = 2'b01;
	         Aload = 1;
	         Sub = 0;
             Halt = 0;
             if(Enter)
             NextState = start;
             else 
             NextState = Input;
			end 
			
	jz:		begin 
			 IRload = 0;
			 JMPmux = 1;
			 PCload = Aeq0;
			 Meminst = 0;
			 MenWr = 0;
			 Asel = 2'b00;
	         Aload = 0;
	         Sub = 0;
             Halt = 0;
             NextState = start;
			end 
			
	jpos:	begin
			 IRload = 0;
			 JMPmux = 1;
			 PCload = Apos;
			 Meminst = 0;
			 MenWr = 0;
			 Asel = 2'b00;
	         Aload = 0;
	         Sub = 0;
             Halt = 0;
             NextState = start;
			end 
			
	halt:	begin
			 IRload = 0;
			 JMPmux = 0;
			 PCload = 0;
			 Meminst = 0;
			 MenWr = 0;
			 Asel = 2'b00;
	         Aload = 0;
	         Sub = 0;
             Halt = 1;
             NextState = halt;
			end 
	
	default: NextState = start;
	endcase
end 
endmodule 