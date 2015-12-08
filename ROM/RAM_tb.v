module RAM_tb();

reg clk,WE;
reg [4:0]Address;
reg [7:0]D;
wire [7:0]Q;

RAM #(.n(8)) ramA(clk,WE,Address,D,Q);
/*
initial 
 begin 
   WE <= 0;
   @(posedge clk);
   @(negedge clk);
   clear <= 1;
 end 
*/
initial 
 begin 


 #2 WE = 1; Address = 4'b00000; D = 8'b00000000; 
 #2 WE = 1; Address = 4'b00001; D = 8'b00000001; 
 #2 WE = 1; Address = 4'b00010; D = 8'b00000010; 
 #2 WE = 1; Address = 4'b00011; D = 8'b00000011;
 #2 WE = 1; Address = 4'b00100; D = 8'b00000100;
 
 #2 WE = 0; Address = 4'b00000; D = 8'bxxxxxxxx;
 #2 WE = 0; Address = 4'b00001; D = 8'bxxxxxxxx;
 #2 WE = 0; Address = 4'b00010; D = 8'bxxxxxxxx;
 #2 WE = 0; Address = 4'b00011; D = 8'bxxxxxxxx;
 #2 WE = 0; Address = 4'b00100; D = 8'bxxxxxxxx;
 #2 $finish;
 end 

initial 
  begin 
   clk = 0;
   forever #1 clk = ~clk;
  end 




initial 
   begin 
    $display(" clk |WE| Address |  D  |  Q  |\n");
    $monitor("  %b  |  %b  |  %b  | %b  |  %b  |", clk,WE,Address,D,Q);   
   end 


endmodule 


