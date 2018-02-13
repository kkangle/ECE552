module ALU (ALU_Out, Error, ALU_In1, ALU_In2, Opcode);
input [3:0] ALU_In1, ALU_In2;
input [1:0] Opcode; 
output reg [3:0] ALU_Out;
output Error; // Just to show overflow

wire [3:0] ALU_result;
wire sub;
assign sub = (Opcode[0])? 1'b1:1'b0;
addsub_4bit adder(ALU_result, Error, ALU_In1, ALU_In2, sub);

always @(*)
begin 
    casex(Opcode)
	2'b00: // Add
		assign ALU_Out = ALU_result;
	2'b01:
		assign ALU_Out = ALU_result;
	2'b10: // Nand
	    assign ALU_Out = ~(ALU_In1 & ALU_In2);
	2'B11: // Xor
	    assign ALU_Out = ALU_In1 ^ ALU_In2;
	default:
		assign ALU_Out = 4'b0000;
	endcase	
end

endmodule

