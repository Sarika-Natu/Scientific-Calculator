  module input_calc (operand1, operand2, md_operator, sof_reset, reset, num,done,mode,op, calcmod,clock_out_1s,state, show_res,bin, result);
  
  output reg [3:0]operand1 = 4'b0000;//first input
  output reg [3:0]operand2 = 4'b0000; //second input
  output reg [2:0]md_operator= 3'b000; //select custom/scientific mode
  output wire sof_reset; //reset the whole circuit
  input wire reset; 
  input wire [3:0]num; 
  input wire [1:0]op;  //selction of the operator
  input mode;
  output wire calcmod;
  input wire [7:0]result;
  output reg [2:0]state = 3'b000;
  input wire done;
  input wire clock_out_1s;
  wire push;
 output reg show_res; 
 output reg [7:0]bin;
 
  
  parameter S0 = 3'b000;//reset
  parameter S1 = 3'b001;//num1
  parameter S2 = 3'b010;//operator
  parameter S3 = 3'b011;//num2
  parameter S4 = 3'b100;//result
  
  assign sof_reset = (~reset);
  assign calcmod = mode?(1'b1):(1'b0);
  assign push = (~done);
  
     always @ (posedge clock_out_1s)//Clock slowed down to 1 hertz
      begin: SEQ
      	if(sof_reset)begin
      	state <= S0;

      end
      else if(push)begin
		   if(state==S4)
			state =S0;
			else
      	state <= state + 1;

      end
    
      end
  
        always @ (num, op, calcmod)//
      begin: COMB
		
		if(sof_reset)begin
			operand1 = 4'b0000;
     		operand2 = 4'b0000;
     		md_operator = 3'b000;
			show_res = 1'b0;
			
			bin = {8'b00000000};
		end
		else begin
		
        case(state)
        S0: begin
		  
         operand1 = 4'b0000;
     		operand2 = 4'b0000;
     		md_operator = 3'b000;
			
			bin = {8'b00000000};
        
		  end
          
        S1: begin
		   
          operand1[3:0] = num[3:0];        
			 bin = {4'b0000,operand1};
        
		  end
       
        S2: begin
		  
          md_operator[2:0] = {calcmod, op[1:0]};        
			 bin = {5'b00000,md_operator};  
       
		  end
          
        S3: begin
		  
          operand2[3:0] = num[3:0];
			bin = {4'b0000,operand2};
			 
			 
        
		  end
          
        S4: begin
		  
			 operand1=operand1;
		  operand2=operand2;
		  md_operator=md_operator;
		  show_res = 1'b1;
		  
			bin = result; 
        
		  end
		  
		  default: begin
		  operand1=operand1;
		  operand2=operand2;
		  md_operator=md_operator;		  
		  bin = 8'b00000000;
		  end
          
      endcase
		end
    end
	 

  endmodule
  
  