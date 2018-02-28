module WriteDecoder_tb();

logic [3:0] RegId;
logic [15:0] Wordline;
logic WriteReg;

WriteDecoder_4_16 DUT (
	.RegId(RegId),
	.WriteReg(WriteReg),
	.Wordline(Wordline)
);

initial begin
// test not write
assign RegId = 4'b0000;
assign WriteReg = 1'b0;
#100
assert(Wordline == 16'h0000) $display("success");
	else $display("wrong : %h", Wordline);

// test write
assign RegId = 4'b0000;
assign WriteReg = 1'b1;
#100
assert(Wordline == 16'h0001) $display("success");
	else $display("wrong : %h", Wordline);

	
	

// second test for not write
assign RegId = 4'b0011;
assign WriteReg = 1'b0;
#100
assert(Wordline != 16'h0008) $display("success");
	else $display("wrong : %h", Wordline);

// second test for write
assign RegId = 4'b0011;
assign WriteReg = 1'b1;
#100
assert(Wordline == 16'h0008) $display("success");
	else $display("wrong : %h", Wordline);

	
	
	
assign RegId = 4'b0010;
assign WriteReg = 1'b0;
#100
assert(Wordline == 16'h0000) $display("success");
	else $display("wrong : %h", Wordline);

// test write
assign RegId = 4'b0010;
assign WriteReg = 1'b1;
#100
assert(Wordline == 16'h0004) $display("success");
	else $display("wrong : %h", Wordline);

end

endmodule
