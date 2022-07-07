module alu_tb;

 reg [7:0] in_a, in_b;
 reg clk; //zflag,
 reg [2:0] alu_sel;
 wire [7:0] alu_out;
 wire zf, c;

 alu dut(.in_a(in_a), .in_b(in_b), .clk(clk), 
	.alu_sel(alu_sel), .alu_out(alu_out), .z(zf), .c(c));

 initial begin 
  clk = 1'b0;
  forever
  #5 clk = ~clk;
  end

 initial begin
 in_a = 0;
 in_b = 0;
 alu_sel = 0;
 #20;
 in_a = 0;
 in_b = 1;
 alu_sel = 1;
 #20;
 in_a = 0;
 in_b = 0;
 alu_sel = 2;
 #20;
 in_a = 0;
 in_b = 0;
 alu_sel = 3;
 #20;
 in_a = 0;
 in_b = 0;
 alu_sel = 4;
 #20;
 in_a = 0;
 in_b = 0;
 alu_sel = 5;
 #20;
 in_a = 0;
 in_b = 0;
 alu_sel = 6;
 #20;
 in_a = 0;
 in_b = 0;
 alu_sel = 7;
 #20;
 in_a = 6;
 in_b = 5;
 alu_sel = 0;
 #20;
 in_a = 7;
 in_b = 9;
 alu_sel = 0;
 #20;
 in_a = 10;
 in_b = 16;
 alu_sel = 0;
 #20;


 end

 initial
   #250 $finish;

endmodule