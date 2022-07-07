module control_unit_tb;

 reg [4:0]opcode; 
 reg rst, clk, c, z, v;
 wire load_pc, pc_inc, k_rs_sel, gpr_load, rd_wrt_mode;
 wire [1:0] aluout_k_d_sel, a_rd_rs_sel;

 control_unit dut( opcode, rst, clk, c, z, v, load_pc, pc_inc, 
		k_rs_sel, gpr_load, rd_wrt_mode, aluout_k_d_sel, a_rd_rs_sel);
 
 initial 
 	begin 
	clk = 1'b0;
   	forever
	#5 clk = ~clk;
	end

 initial
	begin

	/*opcode = 5'b00000; 
  	rst = 1;
	c = 0;
	z = 0; 
	v = 0;
	#20*/
	opcode = 5'b00001; 
  	rst = 0;
	c = 0;
	z = 0; 
	v = 0;
	#20
	opcode = 5'b00010; 
  	rst = 0;
	#20
	opcode = 5'b00011; 
  	rst = 0;
	#20
	opcode = 5'b00100; 
  	rst = 0;
	#20
	opcode = 5'b01000; 
  	rst = 0;
	#20
	opcode = 5'b01001; 
  	rst = 0;
	#20
	opcode = 5'b01010; 
  	rst = 0;
	#20
	opcode = 5'b01011; 
	#20
	opcode = 5'b01100; 
	#20
	opcode = 5'b01101; 
	#20
	opcode = 5'b01110; 

	#20
	opcode = 5'b10000; 
	#20
	opcode = 5'b10001; 
	#20
	opcode = 5'b10010; 
	#20
	opcode = 5'b10011; 
	#20
	opcode = 5'b10100; 
	#20
	opcode = 5'b10101;
	//r1 instructions
	#20
	opcode = 5'b11100;  
	#20
	opcode = 5'b11101;  
	#20
	opcode = 5'b11110;  
	#20
	opcode = 5'b11111;  
	#20
	opcode = 5'b11000;  
	#20
	opcode = 5'b11001;  
	end
 initial
	#500 $finish;
endmodule
