module processortop_tb;
 reg rst, clk;

 processor_top dut(rst, clk);
 
 initial 
 	begin 
	clk = 1'b0;
   	forever
	#5 clk = ~clk;
	end
 initial begin
 rst = 1;
 #20;
 rst = 0;
 #20;
 end
 initial
  #600 $finish;

endmodule