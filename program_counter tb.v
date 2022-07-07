module program_counter_tb;
reg clk, rst, load, pc_inc;
reg [7:0] pc_in;
wire [7:0] pout;


program_counter dut( clk, rst, pc_in, load, pc_inc,
    pout
);

initial 
   begin 
clk = 1'b0;
   forever
#5 clk = ~clk;
end

task initialise;
{rst,pc_in, load, pc_inc}=0;
 endtask

task resetip;
begin
@(negedge clk)
rst=1;
@(negedge clk)
rst=0;
end
endtask


initial
begin 
resetip;
initialise;
pc_inc=1;
#100;
load=0;
pc_in=8'b10010011;
#100;
pc_inc=0;
load=1;
pc_in=8'b10010011;
#100;
pc_inc=0;
end
 initial
	#300 $finish;
endmodule

