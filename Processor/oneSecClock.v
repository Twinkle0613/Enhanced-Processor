module oneSecClock
(
	input 	CLOCK_50,
	input 	reset, //Reset
	output reg clock
);   

reg [24:0] count25M;
/*

  1/50M = 2x10^-8 sec
   1/50M = 0.5/X
	50M/0.5 = X
	X = 25M
   
*/
always@(posedge CLOCK_50, negedge reset)
begin
	if(!reset)
	begin
		count25M <= 0;
	end
	else
		if(count25M == 25000000)
		begin
			clock <= !clock ;
			count25M <=0;
		end
		else
			count25M <= count25M + 1; 
end

endmodule
