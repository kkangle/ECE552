module WriteDecoder_4_16(input [3:0] RegId, input WriteReg, output [15:0] Wordline);

wire [15:0] temp = 16'h0001;

assign tempaddr = temp << RegId;

assign Wordline = (WriteReg) ? tempaddr: 16'h0000;

endmodule