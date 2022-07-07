module data_memory_tb;
 reg [7:0] data_in, address;
 reg rd_wrt_mode, clk, rst;
 
 wire [7:0] data_out;
 
 data_memory dut (data_in, address, rd_wrt_mode, clk, rst, data_out);

 initial 
 	begin 
	clk = 1'b0;
   	forever
	#5 clk = ~clk;
	end
 initial begin
 data_in = 0;
 address = 0;
 rd_wrt_mode = 1;
 rst = 1;
 #30
 data_in = 1;
 address = 0;
 rd_wrt_mode = 1;
 rst = 0;
 #20
 data_in = 2;
 address = 1;
 rd_wrt_mode = 1;
 rst = 0;
 #20
 data_in = 3;
 address = 0;
 rd_wrt_mode = 0;
 rst = 0;
 #20
 data_in = 3;
 address = 1;
 rd_wrt_mode = 0;
 rst = 0;
 #20
 data_in = 4;
 address = 3;
 rd_wrt_mode = 1;
 rst = 0; 
 end

 initial 
	#200 $finish;

endmodule
