module gpr_tb;
 reg [7:0] data_in;
 reg  [2:0] rd_sel, rs_sel;
 reg  gpr_load, clk;
 wire[7:0] rd_out, rs_out;


 gpr dut(  data_in, rd_sel, rs_sel, gpr_load, clk, rd_out, rs_out );

 initial 
   	begin 
	clk = 1'b0;
   	forever
	#5 clk = ~clk;
	end

 task initialise;
	{data_in, rd_sel, rs_sel, gpr_load}=0;
 endtask

/*task resetip;
begin
@(negedge clk)
rst=1;
@(negedge clk)
rst=0;
end
endtask*/


 initial
begin 
//resetip;
 initialise;
 gpr_load=1;
 data_in=8'b10001110;
 rd_sel=3'b000;
 rs_sel=3'b000;
 #30;
 rd_sel=3'b001;
 rs_sel=3'b001;
 #30;
 rd_sel=3'b010;
 rs_sel=3'b010;
 #30;
 data_in=8'b10011011;
 rd_sel=3'b011;
 rs_sel=3'b011;
 #30;
 rd_sel=3'b100;
 rs_sel=3'b100;
 #35;
 gpr_load=0;
 rd_sel=3'b000;
 rs_sel=3'b000;
 #30;
 rd_sel=3'b001;
 rs_sel=3'b001;
 #30;
 rd_sel=3'b010;
 rs_sel=3'b010;
 #30;
 rd_sel=3'b011;
 rs_sel=3'b011;
 #30;
 rd_sel=3'b100;
 rs_sel=3'b100;
 
end
 initial
	#300 $finish;
endmodule

