module WriteDecoder_4_16(input [3:0] RegId, input WriteReg, output [15:0] Wordline);

assign Wordline =   (RegId == 4'b0000) ? 16'h0001 & WriteReg:
					(RegId == 4'b0001) ? 16'h0002 & WriteReg:
					(RegId == 4'b0010) ? 16'h0004 & WriteReg:
					(RegId == 4'b0011) ? 16'h0008 & WriteReg:
					(RegId == 4'b0100) ? 16'h0010 & WriteReg:
					(RegId == 4'b0101) ? 16'h0020 & WriteReg:
					(RegId == 4'b0110) ? 16'h0040 & WriteReg:
					(RegId == 4'b0111) ? 16'h0080 & WriteReg:
					(RegId == 4'b1000) ? 16'h0100 & WriteReg:
					(RegId == 4'b1001) ? 16'h0200 & WriteReg:
					(RegId == 4'b1010) ? 16'h0400 & WriteReg:
					(RegId == 4'b1011) ? 16'h0800 & WriteReg:
					(RegId == 4'b1100) ? 16'h1000 & WriteReg:
					(RegId == 4'b1101) ? 16'h2000 & WriteReg:
					(RegId == 4'b1110) ? 16'h4000 & WriteReg: 16'h8000 & WriteReg;	

endmodule