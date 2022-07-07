module mux2x1(
 input [7:0] in1, in2,
 input sel,
 output [7:0] muxout
);

 assign muxout =sel?in2:in1;

endmodule