module ALU (ALU_Out, Error, ALU_In1, ALU_In2, Opcode);
input [3:0] ALU_In1, ALU_In2;
input [1:0] Opcode; 
output [3:0] ALU_Out;
output Error; // Just to show overflow

reg [3:0] ALU_result;
assign ALU_Out = ALU_result;
reg sub;
addsub_4bit adder(ALU_result, Error, ALU_In1, ALU_In2, sub);

always @(*)
begin 
    case(Opcode)
	2'b00: // Add
		    sub = 1'b0;
	2'b01: // Sub
		    sub = 1'b1;
	2'b10: // Nand
	    ALU_result = ~(ALU_In1 & ALU_In2);
	2'B11: // Xor
	    ALU_result = ALU_In1 ^ ALU_In2;
	default:
		ALU_result = 4'b0000;
	endcase	
end

endmodule

