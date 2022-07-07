module program_memory_tb;
 reg [7:0] address;
 reg clk, rst;
 
 wire [15:0] data_out;

 program_memory dut( address, clk, rst, data_out);
 
 initial 
   	begin 
	clk = 1'b0;
   	forever
	#5 clk = ~clk;
	end
 initial
	#300 $finish;
 initial
 	begin
 	rst = 1;
	address = 0;
 	#30;
	rst = 0;
	address = 0;
 	#30;
	rst = 0;
	address = 1;
 	#30;
	rst = 0;
	address = 2;
 	#30;
	rst = 1;
	address = 3;
 	#30;
	rst = 0;
	address = 3;
 	
	end

endmodule
