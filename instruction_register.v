module instruction_register(
 input clk, [15:0] instr_in, [7:0] pc_value,
 output  [7:0] ir, idr, ar

);

 	assign ir = instr_in[15:8];
	assign idr = instr_in[7:0];
	assign ar = pc_value;
endmodule

