module DataPath_tb(clk,clear,IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub,in,out,IR75,Aeq0,Apos,MeminstOut,regAOut,RAMout);

    reg clk,clear;
	reg IRload,JMPmux,PCload,Meminst,MemWr,Aload,Sub;
	reg[1:0]Asel;
	reg [7:0]in;
	wire [7:0]out;
	wire [2:0]IR75;
	wire Aeq0,Apos;
    wire [4:0]MeminstOut;
    wire [7:0]regAOut,RAMout;
    
DataPath DP (clk,clear,IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub,in,out,IR75,Aeq0,Apos,MeminstOut,regAOut,RAMout);

initial 
 begin 
   clearA <= 0;
   @(posedge clk);
   @(negedge clk);
   clearA <= 1;
 end 
 


 initial 
   begin 
 
    $display(" clk | clear | IRload | JMPmux | PCload | Meminst |MemWr,Asel,Aload,Sub,in,out,IR75,Aeq0,Apos,MeminstOut,regAOut,RAMout");
    $monitor("  %b  |   %b   |   %b    |  %b  |  %d   | %b | %b | %b | %b |  %b  |   %b   |     %b     |     %b     |",clk,loadA,clearA,sub,Asel,GND,IROut,Input,SubOut,MuxOut,regAOut,Aeq0,Apos); 

   end 
 
initial 
 begin 


   
 #2 $finish;
 end 


 initial 
  begin 
   clk = 0;
   forever #1 clk = ~clk;
  end 



endmodule 