module switch_calc (num,done,mode,op, result, CLK, reset,mode_test,display_seg, bin,state);

  input wire [3:0]num;
  input wire  [1:0]op;
  input wire mode;  
  input wire CLK, reset;
  output wire [7:0]result;
  output mode_test=calcmod;
  wire [2:0]md_operator;
  wire [3:0]operand1;
  wire [3:0]operand2;
  input wire done;
  output wire [27:0]display_seg;
  output wire [2:0]state;
  wire calcmod;
  wire sof_reset; 
  wire clock_out_1s;
  wire show_res;
  output wire [7:0]bin;
  
  
  



input_calc i1 (.clock_out_1s(clock_out_1s),.operand1(operand1), .operand2(operand2),.state(state),
               .md_operator(md_operator),.reset(reset), .sof_reset(sof_reset), .num(num),.done(done),
               .mode(mode),.op(op), .calcmod(calcmod), .show_res(show_res), .result(result), .bin(bin));  

calc_fsm f1 (.operand1(operand1), .operand2(operand2),.md_operator(md_operator), 
             .sof_reset(sof_reset), .result(result), .show_res(show_res));

segment_display s1 (.state(state),.calcmod(calcmod),.display_seg(display_seg));

clock_divider c1(.CLK(CLK), .clock_out_1s(clock_out_1s), .clock_out_50ms(clock_out_50ms));

endmodule
