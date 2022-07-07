module instruction_decoder_tb;
 reg clk;
 reg [15:0] instruction;
 wire [4:0] opcode;
 wire [2:0] rd, rs;
 wire [7:0] k;

 instruction_decoder dut(instruction, clk, opcode, rd, rs, k);

 initial 
   	begin 
	clk = 1'b0;
   	forever
	#5 clk = ~clk;
	end

 initial
 	begin
	instruction <= 16'b0000000000000000;
	#10;
	instruction <= 16'b0000000000000001;
	#10;
	instruction <= 16'b0110000011111111;
	#10;
	instruction <= 16'b0110000111111110;
	#10;
	instruction <= 16'b0110001011111101;
	#10;
	instruction <= 16'b0100000100000001;
	end
 initial 
	#100 $finish;

endmodule