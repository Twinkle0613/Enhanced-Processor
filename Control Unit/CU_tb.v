//....... Testbench to check the divide by 10 logic .......

//`include "CU.v"   // Include module (design block) to be tested
module CU_tb();
  //Nate Lai design "CU"
  /*-----Design Input----*/
	reg CLOCK_50;
	reg reset;
	reg Enter;   
	reg [2:0]IR;
	reg Aeq0;
	reg Apos;
	/*-----Design Output----*/
	wire IRload;                                                                              ,                                                         
	wire JMPmux;
	wire PCload;
	wire Meminst;
	wire MenWr;
	wire [1:0]Asel;
	wire Aload;
	wire Sub;
	wire Halt;
	wire [3:0]DisplayState;
	assign NateOutput = { IRload,JMPmux,PCload,Meminst,MenWr,Asel,Aload,Sub,Halt,DisplayState };
	//Louise design "controlUnit"
	/*-----Design Output----*/
	wire IRload1;
	wire JMPmux1;
	wire PCload1;
	wire Meminst1;
	wire MenWr1;
	wire [1:0]Asel1;
	wire Aload1;
	wire Sub1;
	wire Halt1;
	wire [3:0]DisplayState1;
	assign LouiseOutput = { IRload1,JMPmux1,PCload1,Meminst1,MenWr1,Asel1,Aload1,Sub1,Halt1,DisplayState1 };
	integer i;

initial begin
	CLOCK_50 = 0;
	reset = 1;
	Enter = 0;
	IR = 3'b000;
	Aeq0 = 0;
	Apos = 0;
	#4 reset = 0;
	#4 reset = 1;
	#9 IR = 3'b000; 
	#8 IR = 3'b001; 
	#8 IR = 3'b010; 
	#8 IR = 3'b011; 
	#8 IR = 3'b100; 
	#8 Enter = 0;
	#8 Enter = 1;
	#8 IR = 3'b101; Enter = 0;
	#8 IR = 3'b101; Aeq0 = 1;
	#8 IR = 3'b110; Aeq0 = 0;
	#8 IR = 3'b110; Apos = 1;
	#8 IR = 3'b111; Apos = 0;
/*	for( i = 0 ; i < 8 ; i = i + 1)
	begin 
	     
	     if( IR == 3'b001 && Enter == 0)
	       begin 
	       #8  IR = 3'b001; Enter = 1;
	       end
	     else
	       begin  
	      #8 IR = IR + 3'b001;  
	       end 
  end
	*/
#100 $finish;
end 

//..................clock pulse generator................
always #1 CLOCK_50 = ~CLOCK_50;
//Connect module to test bench
CU Cu1 (CLOCK_50, reset, Enter, IR,
Aeq0, Apos, IRload, JMPmux, PCload, Meminst, 
MenWr,Asel,Aload,Sub,Halt,DisplayState);

controlUnit Cu2(CLOCK_50,reset,Enter,IR,
Aeq01,Apos1,IRload1, JMPmux1, PCload1, Meminst1,
 MemWr1, Aload1, Sub1,Halt1,Asel1,DisplayState1);

always #1 begin
		if(NateOutput != LouiseOutput)
		  begin
			$display("Result Not Match at state %d", DisplayState);
			$display("Output = {Aeq0, Apos, IRload, JMPmux, PCload, Meminst,MenWr,Asel,Aload,Sub,Halt,DisplayState}");
			$display("NateOutput = {%b, %b, %b, %b, %b, %b,%b,%b,%b,%b,%b,%h}",Aeq0, Apos, IRload, JMPmux, PCload, Meminst,MenWr,Asel,Aload,Sub,Halt,DisplayState);
			$display("LouiseOutput = {%b, %b, %b, %b, %b, %b,%b,%b,%b,%b,%b,%h}",Aeq01, Apos1, IRload1, JMPmux1, PCload1, Meminst1,MenWr1,Asel1,Aload1,Sub1,Halt1,DisplayState1);
			$stop;
			end
		else
		  begin
			$display("Match State %d", DisplayState);
			end
			
	end

endmodule 