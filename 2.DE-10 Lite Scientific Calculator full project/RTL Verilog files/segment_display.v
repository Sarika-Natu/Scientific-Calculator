module segment_display(state,calcmod,display_seg);

input wire [2:0] state;
input wire calcmod;
output reg [27:0] display_seg;

always @(state,calcmod) 
 begin
	case(state)  
		3'b000: display_seg = {7'b1111001, 7'b0101011, 7'b0001100,7'b1111111}; //inp
		3'b001: display_seg = {7'b1111001, 7'b0101011, 7'b0001100,7'b1111001}; //inp1
		3'b010: begin
						if (calcmod==1'b0)
						display_seg = {7'b1000110,7'b1000001,7'b0010010,7'b0000111}; //Cust
						else
						display_seg = {7'b0010010,7'b0100111,7'b1111011,7'b0101011}; //Scint
				  end
		3'b011: display_seg = {7'b1111001, 7'b0101011, 7'b0001100,7'b0100100}; //inp2
		3'b100: display_seg = {7'b1000000, 7'b1000001, 7'b0000111,7'b1111111}; //Out
		default :
		display_seg = {7'b1111111, 7'b1111111, 7'b1111111,7'b1111111};
	endcase
	end
	endmodule
	