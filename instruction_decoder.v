module instruction_decoder(
 input [7:0] ir, idr,
 input clk,
 output   [4:0] opcode,
 output   [2:0] rd, rs,
 output   [7:0] k
);
 
 /*always@(posedge clk)
	begin
	opcode <= instruction[15:11];
	rd <= instruction[10:8];
	rs <= instruction[7:5];
	k <= instruction[7:0];
 	end */
	assign opcode = ir[7:3];
	assign rd = ir[2:0];
	assign rs = idr[7:5];
	assign k = idr[7:0];

endmodule
	