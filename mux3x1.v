module mux3x1(
 input [7:0] in1, in2, in3,
 input [1:0] sel,
 output [7:0] muxout
);

 assign muxout = (sel == 2'b00)?in1:(sel == 2'b01)?in2: (sel == 2'b10)?in3 : 2'bzz;

endmodule
