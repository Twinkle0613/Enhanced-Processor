module Register_tb();

reg clk,load,clear;
reg [7:0]in;
wire [7:0]regOut;


initial 
 begin 
   clear <= 0;
   @(posedge clk);
   @(negedge clk);
   clear <= 1;
 end 
 
initial 
 begin 


 #2 load = 1; in = 8'b00000001;
 #2 load = 0; in = 8'b00000011;
 #2 load = 1; in = 8'b00000011;
 #2 load = 0; in = 8'b00000111;
 #2 load = 1; in = 8'b00000111;
 #2 load = 1; in = 8'b00001111;
 
 #20 $finish;
 end 

initial 
  begin 
   clk = 0;
   forever #1 clk = ~clk;
  end 


initial 
   begin 
    $display(" clk |clear|load|  in  |  regOut  |\n");
    $monitor("  %b  |  %b  |  %b  | %b  |  %b  |", clk,clear,load,in,regOut);   
   end 

Register #(.n(8)) regA(in,clk,load,clear,regOut);
endmodule 


