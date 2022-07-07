module program_memory(
 //input [15:0] data_in,
 input [7:0] address,
 input /*Rd_wrt_mode,*/ clk, rst,
 
 output reg [15:0] data_out
 
);

 reg [15:0] program_mem[255:0];
 //integer i;
 always@(*)
 	begin
	if(rst)
		begin
		data_out <= 0;
		end
	else  // read
		data_out <= program_mem[address];
  	/*else // write
		program_mem[address] <= data_in;*/
	end
 /*always@(posedge clk)
 	begin
   	program_mem[0] <= 16'b0000000000000000;
	program_mem[1] <= 16'b0000000000000001;
	program_mem[2] <= 16'b0110000011111111;
	program_mem[3] <= 16'b0110000111111110;
	program_mem[4] <= 16'b0110001011111101;
	program_mem[5] <= 16'b0100000100000001;
	end*/
 initial begin
	program_mem[0] <= 16'b0110000011111111; //LDI
	program_mem[1] <= 16'b0110000111111110; //LDI
	program_mem[2] <= 16'b0110001011111101; //LDI
	program_mem[3] <= 16'b0100000100000001; //ADDI 
  	program_mem[4] <= 16'b0101001000000010; //ANDI
	program_mem[5] <= 16'b1000000000100000; //ADD
	program_mem[6] <= 16'b1000100100000000; //SUB
	program_mem[7] <= 16'b0111000100000010; //STD
	program_mem[8] <= 16'b0000000000001010; //JMP
	program_mem[9] <= 16'b0110111100000010; //LDD
	program_mem[10] <= 16'b0110111000000010; //LDD
	program_mem[11] <= 16'b1010101000000000; //STX
	program_mem[12] <= 16'b1110011000000000; //NOT
	program_mem[13] <= 16'b1111011000000000; //SHR
	program_mem[14] <= 16'b1010010111000000; //LDX
	program_mem[15] <= 16'b0100000100000111 ; //ADDI
	program_mem[16] <= 16'b0100011000000001  ; //ADDI
	program_mem[17] <= 16'b0100011000001001  ; //ADDI
	program_mem[18] <= 16'b0100100100000001 ; //SUBI
	program_mem[19] <= 16'b0100111000001010 ; //SUBI
	program_mem[20] <= 16'b1001000000100000  ; //AND
	program_mem[21] <= 16'b1001001011000000  ; //AND
	program_mem[22] <= 16'b1001100000100000  ; //OR
	program_mem[23] <= 16'b1001101000100000  ; //OR
	program_mem[24] <= 16'b0100011011111111  ; //ADDI
	program_mem[25] <= 16'b0101100000000000  ; //ORI
	program_mem[26] <= 16'b0101100111111111  ; //ORI
	program_mem[27] <= 16'b0110001011111110  ; //LDI
	program_mem[28] <= 16'b0111000100000111  ; //STD
	program_mem[29] <= 16'b0111000100001000  ; //STD
	program_mem[30] <= 16'b0110110100000111  ; //LDD
	program_mem[31] <= 16'b0110111100001000  ; //LDD
 	end
endmodule