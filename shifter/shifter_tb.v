module shifter_tb();

wire [15:0] Shift_In; //This is the number to perform shift operation on
wire [3:0] Shift_Val; //Shift amount (used to shift the ‘Shift_In’)
wire  Mode; // To indicate SLL or SRA 
wire [15:0] Shift_Out; //Shifter value

Shifter (.Shift_Out(Shift_Out), 
		.Shift_In(Shift_In), 
		.Shift_Val(Shift_Val), 
		.Mode(Mode)
		);


endmodule
