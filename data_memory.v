module data_memory(
 input [7:0] data_in,
 input [7:0] address,
 input rd_wrt_mode, clk, rst,
 
 output reg [7:0] data_out
 
);

 reg [7:0] data_mem[255:0];
 
 always@(*)
 	begin
	if(rst)
		data_out <= 8'b00000000;
		
	else if(rd_wrt_mode == 0) // read
		data_out <= data_mem[address];
  	else // write
		data_mem[address] <= data_in;
	end
endmodule
