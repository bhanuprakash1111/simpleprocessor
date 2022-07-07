module processor_top(
 
 input rst, clk 

 );
 wire load_pc, pc_inc, k_rs_sel, rd_wrt_mode;
 wire [4:0] opcode;
 wire [7:0] alu_out, mux1_out, mux2_out, mux3_out, mux4_out, rd_out, rs_out, 
	    ir, idr, k_imm, ar, pout, datamem_out;
 wire [1:0] aluout_k_d_sel, a_rd_rs_sel;
 wire rs_rd_sel;
 wire [2:0] rd_sel, rs_sel;
 wire gpr_load;
 wire [15:0] instruction;
 wire c, v;
 
 program_counter i1(clk, rst, k_imm, load_pc, pc_inc, pout);
 
 mux2x1 m1( k_imm, rs_out, k_rs_sel, mux1_out); // mux to alu
 
 alu i2(rd_out, mux1_out, clk, opcode[2:0],  alu_out, z ,c);
 
 control_unit i3(opcode, rst, clk, c, z, v, 
		 load_pc, pc_inc, k_rs_sel,  gpr_load, 
		  rd_wrt_mode, rs_rd_sel, aluout_k_d_sel, a_rd_rs_sel);
 
 mux3x1 m2(k_imm, rd_out, rs_out, a_rd_rs_sel, mux2_out); //mux to datamem address

 mux2x1 m3(rs_out, rd_out, rs_rd_sel, mux3_out);
 
 data_memory i4(mux3_out, mux2_out, rd_wrt_mode, clk, rst, datamem_out);
 
 mux3x1 m4(alu_out, k_imm, datamem_out, aluout_k_d_sel, mux4_out );
 //mux to gpr
 
 gpr i5(mux4_out, rd_sel, rs_sel, gpr_load, clk, rd_out, rs_out );
 
 instruction_decoder i6(ir, idr, clk, opcode, rd_sel, rs_sel, k_imm);
 
 instruction_register i7(clk, instruction, pout, ir, idr, ar);
 
 program_memory i8(pout, clk, rst, instruction);


endmodule