module Processor_tb();

 reg clk,reset,init,enter;
 reg [7:0]in;
 wire [7:0]out;
 wire halt;
 wire [4:0]MeminstOut;
 wire [7:0]regAOut,RAMout;
 wire [4:0]IR40;
 wire [2:0]IR75;
 wire [3:0]DisplayState;


reg [7:0]expectValue,X,Y;
integer i;
integer errors = 0;
integer pass = 0;
Processor Up(clk,reset,init,enter,in,out,halt,IR40,MeminstOut,regAOut,RAMout,DisplayState,IR75);

initial 
 begin 
   reset <= 0; init = 1;
   @(posedge clk);
   @(negedge clk);
   reset <= 1; init = 0;
 end 
  
initial 
  begin 
   clk = 0;
   forever #1 clk = ~clk;
  end 
  
task resetProcessor;
  begin 
  #2 reset <= 0; 
   #2 reset <= 1; 
 end 
endtask 

initial 
 begin 
  //  $display("| clk | reset | init | enter |  in  |  out | halt |  IR40  | MeminstOut |  regAOut |  RAMout  | DisplayState | IR75 |");
 //   $monitor("|  %b  |   %b   |  %b   |   %b   | %d  | %d |  %b  |  %b |   %b    | %b | %b |     %b     | %b |",
 // clk,reset,init,enter,in,out,halt,IR40,MeminstOut,regAOut,RAMout,DisplayState,IR75); 
  // $display("| X | Y |");

   end 

initial 
	begin
  in <= 0; enter <= 0; expectValue <= 0;
  #2 autoChecking();	
	#2 $finish;  
	end 

  
task autoChecking;
 for(i = 0 ; i <100 ; i= i+1)
   begin 
    resetProcessor();
    X = {$random}%128; Y = {$random}%128;
    
    while(X == 0) begin X = ({$random} % 128); end
    while(Y == 0) begin Y = ({$random} % 128); end //restart();
   // $display("X = %d , Y = %d",X,Y);
    inputXandY(X,Y);
    AlgorithmChecking(X,Y);

   end 
endtask
  

  
task inputXandY;
  input [7:0]X,Y;
  begin
	#8 in = X;enter = 1;
	#2 enter = 0; 
	#14 in = Y; enter = 1;
	#2 enter = 0;
  end 
endtask

task verifyOutput;
 input[7:0] expValue;
begin 
 // $display("CP4");
 while(!halt) #1;
 if(out != expValue)
   begin
    errors = errors + 1;
    $display("expected %d was %d , error collection is %d at %d",expValue,out,errors,$time);
   end 
else 
   begin 
    pass = pass + 1;
  $display("pass collection is %d at %d",pass,$time);
   end 
end 
endtask
  
task AlgorithmChecking;
 input [7:0]X,Y;
  begin 
   while( X != Y )
    begin 
	   if( X > Y )
	     X = X - Y;
	   else 
	     Y = Y - X;
     //$display("| X = %d | Y = %d |",X,Y);
    end 
    verifyOutput(X);
 end 
endtask 





endmodule 
 
