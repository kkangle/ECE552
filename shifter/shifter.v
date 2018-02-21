module Shifter (Shift_Out, Shift_In, Shift_Val, Mode);

input [15:0] Shift_In; //This is the number to perform shift operation on
input [3:0] Shift_Val; //Shift amount (used to shift the ‘Shift_In’)
input  Mode; // To indicate SLL or SRA 
output [15:0] Shift_Out; //Shifter value

reg [15:0] sll, sra;

always@(Mode or Shift_Val or Shift_In) begin
	case(Shift_Val)
		0: sll = Shift_In;
		1: sll = {Shift_In[14:0], 1'b0};
		2: sll = {Shift_In[13:0], 2'b0};
		3: sll = {Shift_In[12:0], 3'b0};
		4: sll = {Shift_In[11:0], 4'b0};
		5: sll = {Shift_In[10:0], 5'b0};
		6: sll = {Shift_In[9:0], 6'b0};
		7: sll = {Shift_In[8:0], 7'b0};
		8: sll = {Shift_In[7:0], 8'b0};
		9: sll = {Shift_In[6:0], 9'b0};
		10: sll = {Shift_In[5:0], 10'b0};
		11: sll = {Shift_In[4:0], 11'b0};
		12: sll = {Shift_In[3:0], 12'b0};
		13: sll = {Shift_In[2:0], 13'b0};
		14: sll = {Shift_In[1:0], 14'b0};
		15: sll = {Shift_In[0], 15'b0};
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
