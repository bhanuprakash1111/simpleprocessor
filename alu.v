module alu(
 input [7:0] in_a, in_b,
 input clk, //zflag,
 input [2:0] alu_sel,
 output reg [7:0] alu_out,
 output reg z, c
);

 always@(*)
 	begin
 	case(alu_sel)
		3'b000: {c, alu_out} = in_a + in_b;
		3'b001: {c, alu_out} = in_a - in_b;
		3'b010: alu_out = in_a & in_b;
		3'b011: alu_out = in_a | in_b;
		3'b100: alu_out = ~in_a;
		3'b101: alu_out = in_a << 1;
		3'b110: alu_out = in_a >> 1;
		3'b111: alu_out = in_a <<< 1; // pads 0 at the right while keeping the sign if it is signed
 		default: alu_out = 8'bzzzzzzzz;
	endcase
	end
 always@(posedge clk)
 	begin
	z = ~(alu_out[0]|alu_out[1]|alu_out[2]|alu_out[3]
	      |alu_out[4]|alu_out[5]|alu_out[6]|alu_out[7]);
   	end
endmodule