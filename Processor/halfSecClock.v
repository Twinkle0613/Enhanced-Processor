module halfSecClock
(
	input 	CLOCK_50,
	input 	reset, //Reset
	output reg clock
);   

reg [24:0] count;
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
		count <= 0;
	end
	else
		if(count == 12500000)
		begin
			clock <= !clock ;
			count <=0;
		end
		else
			count <= count + 1; 
end

endmodule
