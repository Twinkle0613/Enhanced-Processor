module Processor_tb();


 reg clk,reset,init,enter;
 reg [7:0]in;
 wire [7:0]out;
 wire halt;
 reg errors;
 wire [4:0]MeminstOut;
 wire [7:0]regAOut,RAMout;
 wire [4:0]IR40;
	
Processor Up(clk,reset,init,enter,in,out,halt,IR40,MeminstOut,regAOut,RAMout);

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
    $display("| clk | reset | init | enter |    in    |    out    | halt | IR40 | MeminstOut | regAOut | RAMout |");
    $monitor("|  %b  |   %b  |   %b   |   %b  | %b | %b | %b | %b | %b | %b | %b |",
    clk,reset,init,enter,in,out,halt,IR40,MeminstOut,regAOut,RAMout); 
   end 

initial 
	begin
	#2 init = 1; enter = 0; in = 7;
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


endmodule 