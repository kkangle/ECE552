module Shifter (Shift_Out, Shift_In, Shift_Val, Mode);

input [15:0] Shift_In; //This is the number to perform shift operation on
input [3:0] Shift_Val; //Shift amount (used to shift the ‘Shift_In’)
input  Mode; // To indicate SLL or SRA 
output [15:0] Shift_Out; //Shifter value

reg [15:0] sll, sra;

always@(Mode or Shift_Val or Shift_In) begin
	case(Shift_Val)
		0: sll = Shift_In << 0;
		1: sll = Shift_In << 1;
		2: sll = Shift_In << 2;
		3: sll = Shift_In << 3;
		4: sll = Shift_In << 4;
		5: sll = Shift_In << 5;
		6: sll = Shift_In << 6;
		7: sll = Shift_In << 7;
		8: sll = Shift_In << 8;
		9: sll = Shift_In << 9;
		10: sll = Shift_In << 10;
		11: sll = Shift_In << 11;
		12: sll = Shift_In << 12;
		13: sll = Shift_In << 13;
		14: sll = Shift_In << 14;
		15: sll = Shift_In << 15;
		default : sll = Shift_In;
	endcase
end

always@(Mode, Shift_Val, Shift_In) begin
	case(Shift_Val)
		0: sra = Shift_In;
		1: sra = {Shift_In[15], Shift_In[15:1]};
		2: sra = {{2{Shift_In[15]}}, Shift_In[15:2]};
		3: sra = {{3{Shift_In[15]}}, Shift_In[15:3]};
		4: sra = {{4{Shift_In[15]}}, Shift_In[15:4]};
		5: sra = {{5{Shift_In[15]}}, Shift_In[15:5]};
		6: sra = {{6{Shift_In[15]}}, Shift_In[15:6]};
		7: sra = {{7{Shift_In[15]}}, Shift_In[15:7]};
		8: sra = {{8{Shift_In[15]}}, Shift_In[15:8]};
		9: sra = {{9{Shift_In[15]}}, Shift_In[15:9]};
		10: sra = {{10{Shift_In[15]}}, Shift_In[15:10]};
		11: sra = {{11{Shift_In[15]}}, Shift_In[15:11]};
		12: sra = {{12{Shift_In[15]}}, Shift_In[15:12]};
		13: sra = {{13{Shift_In[15]}}, Shift_In[15:13]};
		14: sra = {{14{Shift_In[15]}}, Shift_In[15:14]};
		15: sra = {{15{Shift_In[15]}}, Shift_In[15]};
		default : sra = Shift_In;
	endcase
end

assign Shift_Out = (Mode)? sra:sll;

endmodule
