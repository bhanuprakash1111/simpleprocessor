module gpr(
 input [7:0] data_in, 
 input [2:0] rd_sel, rs_sel,
 input gpr_load, clk,
 output reg [7:0] rd_out, rs_out
);

 reg [7:0] r0, r1, r2, r3, r4, r5, r6, r7;

 always@(posedge clk)
 	begin
	if(gpr_load)
		begin
		case(rd_sel)
			3'b000 : r0 <= data_in;
			3'b001 : r1 <= data_in;
			3'b010 : r2 <= data_in;
			3'b011 : r3 <= data_in;
			3'b100 : r4 <= data_in;
			3'b101 : r5 <= data_in;
			3'b110 : r6 <= data_in;
			3'b111 : r7 <= data_in;
			//default: 
		endcase
		end
	end

 always@(*)
 	begin
	case(rd_sel)
		3'b000 : rd_out <= r0;
		3'b001 : rd_out <= r1;
		3'b010 : rd_out <= r2;
		3'b011 : rd_out <= r3;
		3'b100 : rd_out <= r4;
		3'b101 : rd_out <= r5;
		3'b110 : rd_out <= r6;
		3'b111 : rd_out <= r7;
	endcase
   	end

 always@(*)
 	begin
	case(rs_sel)
		3'b000 : rs_out <= r0;
		3'b001 : rs_out <= r1;
		3'b010 : rs_out <= r2;
		3'b011 : rs_out <= r3;
		3'b100 : rs_out <= r4;
		3'b101 : rs_out <= r5;
		3'b110 : rs_out <= r6;
		3'b111 : rs_out <= r7;
	endcase
	end
endmodule