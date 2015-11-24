module InstructionSetOperations_tb();

 reg [7:0]IROut,Input,GND;
 reg [1:0]Asel;
 reg clk,loadA,clearA,sub;
 //reg [7:0]RAMout;
 wire Aeq0,Apos;
 wire [7:0]regAOut;
 wire [7:0]SubOut;
 wire [7:0]MuxOut;

 InstructionSetOperations #(.n(8)) ISO(IROut,Input,GND,
 Asel,clk,loadA,clearA,sub,Aeq0,Apos,regAOut,SubOut,MuxOut);
 integer i = 0;
initial 
 begin 
   clearA <= 0;
   @(posedge clk);
   @(negedge clk);
   clearA <= 1;
 end 
 


 initial 
   begin 
 
    $display(" clk | loadA | clearA | sub | Asel |  GND(3)  | IROut(2) | Input(1) | SubOut(0)|(out)MuxOut | (out)regAOut | (out)Aeq0 | (out)Apos |");
    $monitor("  %b  |   %b   |   %b    |  %b  |  %d   | %b | %b | %b | %b |  %b  |   %b   |     %b     |     %b     |",clk,loadA,clearA,sub,Asel,GND,IROut,Input,SubOut,MuxOut,regAOut,Aeq0,Apos); 

   end 
 
initial 
 begin 
  //                                            (3)       (2)        (1)  
  #2 loadA = 0; sub = 1 ; Asel = 1; GND = 0; IROut = 0; Input = 1; 
  #2 loadA = 1; sub = 1 ; Asel = 1; GND = 0; IROut = 0; Input = 1; 
  
  #2 loadA = 1; sub = 1 ; Asel = 0; GND = 0; IROut = 0; Input = 1; 
  #2 loadA = 1; sub = 1 ; Asel = 2; GND = 0; IROut = 2; Input = 1; 
  #2 loadA = 1; sub = 1 ; Asel = 3; GND = 0; IROut = 2; Input = 1; 

  #2 loadA = 1; sub = 0 ; Asel = 0; GND = 0; IROut = 2; Input = 1; 
  #2 loadA = 1; sub = 0 ; Asel = 1; GND = 0; IROut = 2; Input = 8'b11001100; 
   
 #2 $finish;
 end 


 initial 
  begin 
   clk = 0;
   forever #1 clk = ~clk;
  end 



endmodule 

   /*$monitor("MUX4to1 : Asel | SubOut | Input | IROut | GND | MuxOut\n %b  |  %b  |  %b  | %b  |  %b  |  %b  |",Asel,SubOut,Input,IROut,GND,MuxOut);
   $monitor("RegA : clk| clearA | loadA |  MuxOut(in)  |  regAOut(out) |\n  %b  |  %b  |  %b  | %b  |", clk,clearA,loadA,MuxOut,regAOut);   
   $monitor("AddSub : sub | RAMout | IROut |  SubOut(out)|\n %b  |  %b  |  %b  | %b  |", sub ,RAMout,IROut,SubOut);   
   */
