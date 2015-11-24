module AddSubtract_tb;

reg [7:0]inA,inB;
reg sub;
wire [7:0]out;

AddSubtract #(.n(8)) AddSub(inA,inB,sub,out);

initial 
	begin 
	
	#2 sub = 1; inA = 20; inB = 20;
	#2 sub = 1; inA = 14; inB = 3;

	#2 sub = 1; inA = 100; inB = 2;
	#2 sub = 1; inA = 5; inB = 3;
	
	#2 sub = 0; inA = 1; inB = 1;
	#2 sub = 0; inA = 100; inB = 3;
	
	#2 $finish;
	end 
	
initial 
   begin 
    $display("  sub |  inA  |  inB  |  out |");
    $monitor("  %b  |  %d   |  %d   |  %d  |",sub,inA,inB,out);   
   end 

	
	
endmodule 