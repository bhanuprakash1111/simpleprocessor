module program_counter(
 input clk, rst,[7:0] pc_in, 
 input load_pc, pc_inc,
 output reg [7:0] pout
);
 reg [7:0] pc_reg = 8'b00000000;
 always@(posedge clk)
 begin

 if(rst)
 	pc_reg <= 8'b00000000;

 else if(pc_inc)
	pc_reg <= pc_reg + 1'b1; 

 else if(load_pc)
	pc_reg <= pc_in;	
 else
	pc_reg <= pc_reg;

 end

 always@(*)
 begin
	pout <= pc_reg;
 end



endmodule