module DataPath_tb();//(clk,clear,IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub,in,out,IR75,Aeq0,Apos,MeminstOut,regAOut,RAMout);

  reg clk,clear;
	reg IRload,JMPmux,PCload,Meminst,MemWr,Aload,Sub;
	reg[1:0]Asel;
	reg [7:0]in;
	wire [7:0]out;
	wire [2:0]IR75;
	wire Aeq0,Apos;
    wire [4:0]MeminstOut;
    wire [7:0]regAOut,RAMout;
    
DataPath DP(clk,clear,IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub,in,out,IR75,Aeq0,Apos,MeminstOut,regAOut,RAMout);

initial 
 begin 
   clear <= 0;
   @(posedge clk);
   @(negedge clk);
   clear <= 1;
 end 
 


 initial 
   begin 
 
    $display(" clk | clear | IRload | JMPmux | PCload | Meminst | MemWr | Asel | Aload | Sub |    in    |    out   | IR75 | Aeq0 | Apos | MeminstOut |  regAOut  |  RAMout  |");
    $monitor("  %b  |   %b   |   %b    |  %b     |   %b    |   %b     |   %b   |  %b  |   %b   |  %b  | %b | %b |  %b |   %b  |   %b  |   %b    | %b  | %b |",
    clk,clear,IRload,JMPmux,PCload,Meminst,MemWr,Asel,Aload,Sub,in,out,IR75,Aeq0,Apos,MeminstOut,regAOut,RAMout); 

   end 
 
initial 
 begin 
   
  //put 00000000 into the RAM at address 00000000
  #2 IRload = 0; JMPmux = 1; PCload = 0; Meminst = 1; MemWr = 1; Asel = 1; Aload = 0; Sub = 0;  in = 3;
  #2 IRload = 0; JMPmux = 1; PCload = 0; Meminst = 1; MemWr = 0; Asel = 1; Aload = 0; Sub = 0;  in = 3;
  //put 00000011 into the RAM at address 00000000
  #2 IRload = 0; JMPmux = 1; PCload = 0; Meminst = 1; MemWr = 0; Asel = 1; Aload = 1; Sub = 0;  in = 3;
  #2 IRload = 0; JMPmux = 1; PCload = 0; Meminst = 1; MemWr = 1; Asel = 1; Aload = 0; Sub = 0;  in = 3;
  #2 IRload = 0; JMPmux = 1; PCload = 0; Meminst = 1; MemWr = 0; Asel = 1; Aload = 0; Sub = 0;  in = 3;
  
  // state:0000(start)      
  #2 IRload = 0; JMPmux = 0; PCload = 0; Meminst = 0; MemWr = 0; Asel = 0; Aload = 0; Sub = 0;  in = 7;  
  // state:0001(fetch)
  #2 IRload = 1; JMPmux = 0; PCload = 1; Meminst = 0; MemWr = 0; Asel = 0; Aload = 0; Sub = 0;  in = 7;     
  // state:0010(decode)
  #2 IRload = 0; JMPmux = 0; PCload = 0; Meminst = 1; MemWr = 0; Asel = 0; Aload = 0; Sub = 0;  in = 7;   
  // state:1000(load)                                        
  #2 IRload = 0; JMPmux = 0; PCload = 0; Meminst = 0; MemWr = 0; Asel = 1; Aload = 1; Sub = 0;  in = 7; //correct 
  // state:1001(store)
  //#2 IRload = 0; JMPmux = 0; PCload = 0; Meminst = 1; MemWr = 1; Asel = 0; Aload = 0; Sub = 0;  in = 7; //correct 
  // state:1010(add) 
  //#2 IRload = 0; JMPmux = 0; PCload = 0; Meminst = 0; MemWr = 0; Asel = 0; Aload = 1; Sub = 0;  in = 7; //correct 
  // state:1011(sub) 
  //#2 IRload = 0; JMPmux = 0; PCload = 0; Meminst = 0; MemWr = 0; Asel = 0; Aload = 1; Sub = 1;  in = 7; //correct 
  // state:1100(input) 
  //#2 IRload = 0; JMPmux = 0; PCload = 0; Meminst = 0; MemWr = 0; Asel = 1; Aload = 1; Sub = 0;  in = 7; //correct 
  // state:1101(jz) 
  //#2 IRload = 0; JMPmux = 0; PCload = 0; Meminst = 0; MemWr = 0; Asel = 0; Aload = 0; Sub = 0;  in = 7; //correct 
  // state:1110(jpos) 
  // state:1111(halt) 
   
 #2 $finish;
 end 
               
                                                                                  
 initial 
  begin 
   clk = 0;
   forever #1 clk = ~clk;
  end 



endmodule 
