module ReadDecoder_tb();

logic [3:0] RegId;
logic [15:0] Wordline;

ReadDecoder_4_16 DUT (.RegId(RegId),
		 .Wordline(Wordline)
		);

initial begin

assign RegId = 4'b0000;
#20
assert(Wordline == 16'h0001) $display("success");
	else $display("wrong : %h", Wordline);

assign RegId = 4'b0001;
#20
assert(Wordline == 16'h0002) $display("success");
	else $display("wrong : %h", Wordline);

assign RegId = 4'b0010;
#20
assert(Wordline == 16'h0004) $display("success");
	else $display("wrong : %h", Wordline);

assign RegId = 4'b0011;
#20
assert(Wordline == 16'h0008) $display("success");
	else $display("wrong : %h", Wordline);

assign RegId = 4'b0100;
#20
assert(Wordline == 16'h0010) $display("success");
	else $display("wrong : %h", Wordline);

end

endmodule

