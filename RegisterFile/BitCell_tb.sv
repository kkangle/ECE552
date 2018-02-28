module Bitcell_tb();

logic clk;
logic rst;
logic D;
logic WriteEnable;
logic ReadEnable1;
logic ReadEnable2;
wire Bitline1;
wire Bitline2;

BitCell BC(
	.clk(clk),
	.rst(rst), 
	.D(D),
	.WriteEnable(WriteEnable),
	.ReadEnable1(ReadEnable1), 
	.ReadEnable2(ReadEnable2), 
	.Bitline1(Bitline1),
	.Bitline2(Bitline2)
);


always #5 clk = ~clk;

initial begin
	clk = 1'b0;
	rst = 1'b1;
	#20

	rst = 1'b0;
	#20
	
	assign D = 1'b1;
	#100
	
	assign WriteEnable = 1'b1;
	#100 
	
	assign ReadEnable1 = 1'b1;
	#100
	
	assert(Bitline1 == 1'b1) $display("success");
		else $display("wrong : %h", Bitline1);
	#100
	
	assign ReadEnable2 = 1'b1;
	#100
	assert(Bitline2 == 1'b1) $display("success");
		else $display("wrong : %h", Bitline2);
	
end

endmodule
