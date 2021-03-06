module MUX_2_To_1_tb;

reg [4:0]inA,inB;
reg [0:0]sel;
wire [4:0]out;

MUX_2_To_1 #(.n(5)) Mux12(inA,inB,sel,out);

initial 
	begin 
	
	#2 sel = 1; inA = 1; inB = 2;
	#2 sel = 0; inA = 1; inB = 2;
	
  #2 sel = 1; inA = 4; inB = 3;
	#2 sel = 0; inA = 4; inB = 3;
	
	#2 $finish;
	end 
	
initial 
   begin 
    $display("  sel |  inA  |  inB  |  out |");
    $monitor("  %b  |  %d   |  %d   |  %d  |",sel,inA,inB,out);   
   end 

	
	
endmodule 