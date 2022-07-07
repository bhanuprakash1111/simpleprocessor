module control_unit(
 input [4:0] opcode, 
 input rst, clk, c, z, v,
 output reg load_pc, pc_inc, k_rs_sel, gpr_load,
	    rd_wrt_mode, rs_rd_sel,
 output reg [1:0] aluout_k_d_sel, a_rd_rs_sel
);

 parameter reset_state = 2'b00;
 parameter fetch = 2'b01;
 parameter execute = 2'b10;

 reg [1:0] current_state, next_state;

 always@(*)
	begin
	if(rst)
		current_state <= reset_state;
	else
		current_state <= next_state;
	end

 always@(*)
	begin
	case(current_state)
	reset_state: 
		if(rst)
			begin
			load_pc = 0;
			pc_inc = 0;
			k_rs_sel = 0;
			gpr_load = 0;
			a_rd_rs_sel = 0; 
			rd_wrt_mode = 0;
 			aluout_k_d_sel = 0;
			rs_rd_sel = 0;
			
			end
		else
			next_state <= fetch;
	fetch: 
		begin
		load_pc = 0;
		pc_inc = 1;
		k_rs_sel = 0;
		gpr_load = 0;
		a_rd_rs_sel = 0; 
		rd_wrt_mode = 0;
 		aluout_k_d_sel = 0;
		rs_rd_sel = 0;
		next_state <= execute;
		end
	execute: 
		begin
		case(opcode[4:3])
		2'b00:
			begin
			case(opcode[2:0])
			3'b000: begin 
				load_pc = 1; 
				pc_inc = 0;

				k_rs_sel = 0;
				gpr_load = 0;
				a_rd_rs_sel = 0;
				rd_wrt_mode = 0;
				aluout_k_d_sel = 2'b00;
				rs_rd_sel = 0;
				end
			3'b001: 
				begin
				if(c==1) begin
					load_pc = 1;
					pc_inc = 0; 

					k_rs_sel = 0;
					gpr_load = 0;
					a_rd_rs_sel = 0;
					rd_wrt_mode = 0;
					aluout_k_d_sel = 2'b00;
					rs_rd_sel = 0;
					end
				else
					pc_inc = 1;

					load_pc = 0;
					k_rs_sel = 0;
					gpr_load = 0;
					a_rd_rs_sel = 0;
					rd_wrt_mode = 0;
					aluout_k_d_sel = 2'b00;
					rs_rd_sel = 0;
				end
			3'b010: 
				begin
				if(z==1) begin
					load_pc = 1;
					pc_inc = 0;
					k_rs_sel = 0;
					gpr_load = 0;
					a_rd_rs_sel = 0;
					rd_wrt_mode = 0;
					aluout_k_d_sel = 2'b00;
					rs_rd_sel = 0;
					end 
				else
					pc_inc = 1; 
					load_pc = 0;
					k_rs_sel = 0;
					gpr_load = 0;
					a_rd_rs_sel = 0;
					rd_wrt_mode = 0;
					aluout_k_d_sel = 2'b00;
					rs_rd_sel = 0;
				end
			3'b011: 
				begin
				if(v==1) begin
					load_pc = 1; 
					pc_inc = 0;
					k_rs_sel = 0;
					gpr_load = 0;
					a_rd_rs_sel = 0;
					rd_wrt_mode = 0;
					aluout_k_d_sel = 2'b00;
					rs_rd_sel = 0;
					end
				else
					pc_inc = 1; 
					load_pc = 0;
					k_rs_sel = 0;
					gpr_load = 0;
					a_rd_rs_sel = 0;
					rd_wrt_mode = 0;
					aluout_k_d_sel = 2'b00;
					rs_rd_sel = 0;
				end
			//3'b100: ; JSR [SP] ?PC,SP?SP-1,PC?k
			//3'b101: ; RET PC?[SP]+1,SP?SP+1
			endcase
			end
		2'b01:		
			begin
			case(opcode[2:0])
			3'b000, 3'b001, 3'b010, 3'b011: 
				begin
				k_rs_sel = 0; //selects k as input b to alu
				gpr_load = 1; 
				aluout_k_d_sel = 2'b00; // selects alu output to write to registers

				load_pc =0;
				a_rd_rs_sel = 0;
				rd_wrt_mode = 0;
				pc_inc = 1;
				rs_rd_sel = 0;
				end
			3'b100:
				begin
				gpr_load = 1; 
				aluout_k_d_sel = 2'b01; // selects immediate k to write to registers
				
				load_pc = 0;
				k_rs_sel = 0;
				a_rd_rs_sel = 0;
				rd_wrt_mode = 0;
				pc_inc = 1;
				rs_rd_sel = 0;
				end 
			3'b101: 
				begin
				a_rd_rs_sel = 0; // selects A (immediate) as address to datamem
				rd_wrt_mode = 0; // read signal
				gpr_load = 1;
				aluout_k_d_sel = 2'b10;

				load_pc = 0;
				k_rs_sel = 0;
				pc_inc = 1;
				rs_rd_sel = 0;
				end
			3'b110: 
				begin
				a_rd_rs_sel = 0; // selects A (immediate) as address to datamem
				rd_wrt_mode = 1; // write signal
				gpr_load = 0;

				load_pc = 0;
				k_rs_sel = 0;
				aluout_k_d_sel = 2'b00;
				pc_inc = 1;
				rs_rd_sel = 1;
				end
			endcase
			end
		2'b10:
			begin
			case(opcode[2:0])
			3'b000, 3'b001, 3'b010, 3'b011: 
				begin
				k_rs_sel = 1; // selects rs as input b to alu 
				gpr_load = 1; 
				aluout_k_d_sel = 2'b00; // selects alu output to write to registers
				
				load_pc = 0;
				a_rd_rs_sel = 0;
				rd_wrt_mode = 0;
				pc_inc = 1;
				rs_rd_sel = 0;
				end
 			3'b100: 
				begin
				a_rd_rs_sel = 2'b10; // selects rs as address to datamem
				rd_wrt_mode = 0; // read signal
				gpr_load = 1;
				aluout_k_d_sel = 2'b10;
	
				load_pc = 0;
				k_rs_sel = 0;
				pc_inc = 1;
				rs_rd_sel = 0;
				end
			3'b101: 	
				begin
				a_rd_rs_sel = 1; // selects rd as address to datamem
				rd_wrt_mode = 1; // write signal

				load_pc =0;
				k_rs_sel = 0;
				gpr_load = 0;
				aluout_k_d_sel =2'b00;
				pc_inc = 1;
				rs_rd_sel = 0;
				end

			endcase
			end
		2'b11:
			begin
			case(opcode[2:0])
			3'b100, 3'b101, 3'b110:
				begin
				gpr_load = 1; 
				aluout_k_d_sel = 2'b00; // selects alu output to write to registers
				
				load_pc = 0;
				k_rs_sel = 0;
				a_rd_rs_sel = 0;
				rd_wrt_mode = 0;
				pc_inc = 1;
				rs_rd_sel = 0;
				end
			//3'b111 swap
			//3'b000 push
			//3'b001 pop
			endcase
			
			end
		endcase
		
		end
	default: next_state <= fetch;	
	endcase
	end
endmodule
