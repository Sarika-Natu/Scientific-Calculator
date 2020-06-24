module switch_cal_tb();

  reg [3:0]num;
  reg [1:0]op;
  reg mode;  
  reg CLK, reset;
  wire [7:0]result;
  reg done;
  wire [27:0]display_seg;
  wire [2:0]state;
  wire [7:0]bin;
  
  switch_calc u1 (num,done,mode,op, result, CLK, reset,display_seg, bin,state);
  
  initial CLK = 0;
  initial done = 1;
  always begin
       #5 done = ~done;
          CLK = ~CLK;
   end
 integer i = 0;
 integer j = 0;
 integer k = 0;


 initial begin  
  reset = 1;
  num = 0;
   {mode,op} = 3'b110;  // changing the mode for each operation
 end
 
always begin
for (j = 0; j<= 16 ; j = j+1) begin
      #9 num = num+1;
      end
  end
  always begin
      for (k = 0;k<=16;k = k+1) begin
	  #9 num = num+1;
	 end
	    
 end	   
  
initial begin
  #5000;
  $finish;
  end
  
  initial begin
$monitor("%d %b %d %d",num, {mode,op}, num,result);
end

initial begin
$dumpfile("Test.vcd");
$dumpvars();
end

endmodule

  
