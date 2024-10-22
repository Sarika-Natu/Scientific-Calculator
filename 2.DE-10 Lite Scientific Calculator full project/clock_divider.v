module clock_divider(CLK, clock_out_1s, clock_out_50ms);
input CLK; //50Mhz
output reg clock_out_1s=0; //1000hz
output reg clock_out_50ms=0; //2.5Mhz
reg[27:0]  counter_1s = 0; 
reg[27:0] counter_50ms = 0;

always @(posedge CLK)
 begin 
   if (counter_1s == 28'd5000000)
	 begin 
		clock_out_1s <= ~clock_out_1s;
		counter_1s <= 28'd0;
	 end
	else
	   counter_1s <= counter_1s + 28'd1;
		
 end

always @(posedge CLK)
	begin
      if(counter_50ms == 28'd2500000)
			begin
			clock_out_50ms <= ~ clock_out_50ms;
			counter_50ms <= 0;
		   end
		else
		   counter_50ms = counter_50ms+ 28'd1;
   end
	
	
endmodule


