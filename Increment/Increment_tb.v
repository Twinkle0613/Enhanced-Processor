module Increment_tb();

 reg [7:0]in;
 wire [7:0]out;

 
 Increment #(.n(8)) Inc1(in,out);
 

initial 
 begin 
 #2 in = 1; 
 #2 in = 2; 
 #2 in = 3; 
 #2 in = 4; 
 #2 in = 5; 
 #2 in = 6; 

 #2 $finish;
 end 


initial 
   begin 
    $display("  in  |  out |");
    $monitor("  %d  |  %d  |  ",in,out);   
   end 


endmodule 

