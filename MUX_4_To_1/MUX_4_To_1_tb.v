module MUX_4_To_1_tb();

 reg [7:0]intA,intB,intC,intD;
 reg [1:0]sel;
 wire [7:0]out;
 
 MUX_4_To_1 #(.b(8)) Mux1(intA,intB,intC,intD,sel,out);
 

initial 
 begin 
 #2 sel = 0; intA = 8'b00000001; intB =8'b00000010 ; intC =8'b00000011 ; intD =8'b00000100 ; 
 #2 sel = 1; intA = 8'b00000001; intB =8'b00000010 ; intC =8'b00000011 ; intD =8'b00000100 ; 
 #2 sel = 2; intA = 8'b00000001; intB =8'b00000010 ; intC =8'b00000011 ; intD =8'b00000100 ; 
 #2 sel = 3; intA = 8'b00000001; intB =8'b00000010 ; intC =8'b00000011 ; intD =8'b00000100 ; 
 #2 $finish;
 end 


initial 
   begin 
    $display(" sel |  intA   |   intB   |   intC   |   intD   |    out   |\n");
    $monitor("  %b  |  %b  |  %b  |  %b  |  %b | %b  |",sel,intA,intB,intC,intD,out);   
   end 


endmodule 

