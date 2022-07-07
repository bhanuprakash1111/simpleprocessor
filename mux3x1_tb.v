module mux3x1_tb;
 reg [7:0] in1, in2, in3;
 reg [1:0] sel;
 wire [7:0] muxout;

 mux3x1 dut(in1, in2, in3, sel, muxout);
 initial
  begin
   in1 = 0;
   in2 = 1;
   in3 = 0;
   sel = 0;
   #10
   in1 = 1;
   in2 = 1;
   in3 = 0;
   sel = 0;
   #10
   in1 = 2;
   in2 = 1;
   in3 = 0;
   sel = 2;
   #10
   in1 = 0;
   in2 = 1;
   sel = 1;
   #10
   in1 = 0;
   in2 = 3;
   in3 = 6;
   sel = 2;
   #10;
  end
 initial
  #60 $finish;

endmodule
