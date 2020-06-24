// Code your design here
module calc_fsm (operand1, operand2, md_operator, sof_reset, result, show_res);
  
  input wire [3:0]operand1;
  input wire [3:0]operand2;
  input wire [2:0]md_operator;
  input sof_reset;
  input wire show_res;
  output reg [7:0]result = 8'b00000000;
  
  parameter resST = 3'b111;					//md_operator mode states
  parameter addST = 3'b000;
  parameter subST = 3'b001;
  parameter mulST = 3'b010;
  parameter divST = 3'b011;
  parameter modST = 3'b100;
  parameter pwrST = 3'b101;
  parameter facST = 3'b110;
   
  always@(*)
   begin: COMB								//combinational always block
		if (show_res)begin
 							
         case(md_operator)
          addST: begin						//case for addition
            result = operand1 + operand2;
            
          end

          subST: begin						//case for subtraction
            result = operand1 - operand2;
            
          end

          mulST: begin						//case for multiplication
            result = operand1 * operand2;
            
          end

          divST: begin						//case for division
            result = operand1 / operand2;
            
          end

          modST: begin						//case for modulus 
            result = operand1 % operand2;
           
          end

           pwrST: begin						//case for power of a number
				result = (operand1)**2;
           
          end

          facST: begin						//case for factorial of a number
			   integer i;
				reg [31:0] pro;
            pro = 1;
            for(i = 1; i<= operand1; i = i+1) begin
              pro = pro * i;
            end
              result = pro;
            end
           
           default: begin
             
				 result=8'b00000000;
           end	
           
         
		endcase
	 end
	 else begin
		result=8'b00000000;
	 end
  end
 
  
endmodule