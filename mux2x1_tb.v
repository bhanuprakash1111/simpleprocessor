module mux2x1_tb;
 reg [7:0] in1, in2;
 reg sel;
 wire [7:0] muxout;
 
 mux2x1 dut(in1, in2, sel, muxout);
 initial
  begin
   in1 = 0;
   in2 = 1;
   sel = 0;
   #10
   in1 = 1;
   in2 = 1;
   sel = 0;
   #10
   in1 = 2;
   in2 = 1;
   sel = 0;
   #10
   in1 = 0;
   in2 = 1;
   sel = 1;
   #10
   in1 = 0;
   in2 = 3;
   sel = 1;
   #10;
  end
 initial
  #60 $finish;

endmodule
