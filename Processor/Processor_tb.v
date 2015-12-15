module Processor_tb();


 reg clk,reset,init,enter;
 reg [7:0]in;
 wire [7:0]out;
 wire halt;
 reg errors;
 wire [4:0]MeminstOut;
 wire [7:0]regAOut,RAMout;
 wire [4:0]IR40;
 wire [2:0]IR75;
wire [3:0]DisplayState;
Processor Up(clk,reset,init,enter,in,out,halt,IR40,MeminstOut,regAOut,RAMout,DisplayState,IR75);

initial 
 begin 
   reset <= 0;
   @(posedge clk);
   @(negedge clk);
   reset <= 1;
 end 
  
initial 
  begin 
   clk = 0;
   forever #1 clk = ~clk;
  end 

 initial 
   begin 
    $display("| clk | reset | init | enter |    in    |    out   | halt |  IR40  | MeminstOut |  regAOut |  RAMout  | DisplayState | IR75 |");
    $monitor("|  %b  |   %b  |   %b   |   %b   | %b | %b |   %b  |  %b |   %b    | %b | %b |     %b     | %b |",
    clk,reset,init,enter,in,out,halt,IR40,MeminstOut,regAOut,RAMout,DisplayState,IR75); 
   end 

initial 
	begin
	#2 init = 1; enter = 0; in = 8;
	//#4 enter = 1; in = 8;
	//#4 enter = 1; in = 2;
	//#4 init = 0 ;enter = 1; in = 8;
	#8 init = 0 ;enter = 1; in = 8;
	#2 init = 0 ;enter = 0; in = 8;
	
	#14 init = 0 ;enter = 1; in = 4;
	#2 init = 0 ;enter = 0; in = 4;
	verifyOutput(2,out);

 $display("%d",out);
   
	
	#2 $finish;  
	end 

task verifyOutput;
 input[7:0] expValue;
 input[7:0] actValue;
begin 
 if(actValue[7:0] != expValue[7:0])
   begin
    errors = errors + 1;
    $display("%b was %b , error collection is %d at %d",expValue,actValue,errors,$time);
   end 
     
end 
endtask
/*
task test1;
 input X,Y;
 
 while( X != Y )
 begin 
	if( X > Y )
	 X = X - Y;
	else 
	 Y = Y - X;
 end 
 verifyOutput(X,out);

endtask 

*/

endmodule 