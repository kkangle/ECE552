module shifter_tb();

reg [15:0] Shift_In; //This is the number to perform shift operation on
reg [3:0] Shift_Val; //Shift amount (used to shift the ‘Shift_In’)
reg  Mode; // To indicate SLL or SRA 
wire [15:0] Shift_Out; //Shifter value

Shifter DUT(.Shift_Out(Shift_Out), 
		.Shift_In(Shift_In), 
		.Shift_Val(Shift_Val), 
		.Mode(Mode)
		);

initial begin

	Shift_In = 16'b0000000000000001;
	Shift_Val =  4'b0001;
	Mode = 0;
	#100
	
	assert(Shift_Out == 16'b0000000000000010) $display("sll success: %h", Shift_Out);
		else 
			$display("sll failed: %h", Shift_Out);
	
	
	Mode = 0;
	Shift_In = 16'b0000000000000001;
	Shift_Val = 4'b0010;
	#100
	
	assert(Shift_Out == 16'b0000000000000100) $display("sll success: %h", Shift_Out);
		else 
			$display("sll failed: %h", Shift_Out);
		
	Mode = 0;
	Shift_In = 16'b0000000000000001;
	Shift_Val =  4'b0011;
	#100
	
	assert(Shift_Out == 16'b000000000001000) $display("sll success: %h", Shift_Out);
		else
			$display("sll failed: %h", Shift_Out);
	
	
	Shift_In = 16'b1000000000000000;
	Shift_Val =  4'b0001;
	Mode = 1;
	#100
	
	assert(Shift_Out == 16'b1100000000000000) $display("sll success: %h", Shift_Out);
		else 
			$display("sll failed: %h", Shift_Out);
	
	
	Mode = 1;
	Shift_In = 16'b1000000000000000;
	Shift_Val = 4'b0010;
	#100
	
	assert(Shift_Out == 16'b1110000000000000) $display("sll success: %h", Shift_Out);
		else 
			$display("sll failed: %h", Shift_Out);
		
	Mode = 1;
	Shift_In = 16'b1000000000000000;
	Shift_Val =  4'b0011;
	#100
	
	assert(Shift_Out == 16'b1111000000000000) $display("sll success: %h", Shift_Out);
		else
			$display("sll failed: %h", Shift_Out);
			
	$stop;
	
end

endmodule
