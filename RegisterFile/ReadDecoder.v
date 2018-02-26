module ReadDecoder_4_16(input [3:0] RegId, output [15:0] Wordline);

wire [15:0]temp = 16'h0001;

assign Wordline = temp << RegId;

endmodule
