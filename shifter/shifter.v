module Shifter (Shift_Out, Shift_In, Shift_Val, Mode);

input [15:0] Shift_In; //This is the number to perform shift operation on
input [3:0] Shift_Val; //Shift amount (used to shift the ‘Shift_In’)
input  Mode; // To indicate SLL or SRA 
output [15:0] Shift_Out; //Shifter value

reg [15:0] sll, sra;

always@(*) begin
	case(Shift_Val)
		1'h0: sll = Shift_In << 0;
		1'h1: sll = Shift_In << 1;
		1'h2: sll = Shift_In << 2;
		1'h3: sll = Shift_In << 3;
		1'h4: sll = Shift_In << 4;
		1'h5: sll = Shift_In << 5;
		1'h6: sll = Shift_In << 6;
		1'h7: sll = Shift_In << 7;
		1'h8: sll = Shift_In << 8;
		1'h9: sll = Shift_In << 9;
		1'hA: sll = Shift_In << 10;
		1'hB: sll = Shift_In << 11;
		1'hC: sll = Shift_In << 12;
		1'hD: sll = Shift_In << 13;
		1'hE: sll = Shift_In << 14;
		1'hF: sll = Shift_In << 15;
	endcase
end

always@(*) begin
	case(Shift_Val)
		1'h0: sra = Shift_In;
		1'h1: sra = {Shift_In[15], Shift_In[15:1]};
		1'h2: sra = {{2{Shift_In[15]}}, Shift_In[15:2]};
		1'h3: sra = {{3{Shift_In[15]}}, Shift_In[15:3]};
		1'h4: sra = {{4{Shift_In[15]}}, Shift_In[15:4]};
		1'h5: sra = {{5{Shift_In[15]}}, Shift_In[15:5]};
		1'h6: sra = {{6{Shift_In[15]}}, Shift_In[15:6]};
		1'h7: sra = {{7{Shift_In[15]}}, Shift_In[15:7]};
		1'h8: sra = {{8{Shift_In[15]}}, Shift_In[15:8]};
		1'h9: sra = {{9{Shift_In[15]}}, Shift_In[15:9]};
		1'hA: sra = {{10{Shift_In[15]}}, Shift_In[15:10]};
		1'hB: sra = {{11{Shift_In[15]}}, Shift_In[15:11]};
		1'hC: sra = {{12{Shift_In[15]}}, Shift_In[15:12]};
		1'hD: sra = {{13{Shift_In[15]}}, Shift_In[15:13]};
		1'hE: sra = {{14{Shift_In[15]}}, Shift_In[15:14]};
		1'hF: sra = {{15{Shift_In[15]}}, Shift_In[15]};
	endcase
end

assign Shift_Out = (Mode)? sra:sll;

endmodule
