module adder_4bit(Sum, Ovfl, A, B);

input[3:0] A, B;
output [3:0] Sum;
output Ovfl;

wire [3:0] Cout;

assign Ovfl = (Sum[3] & ~A[3] & ~B[3]) | (~Sum[3] & A[3] & B[3]);

full_adder_1bit A1 (.S(Sum[0]), 
					.Cout(Cout[0]), 
					.A(A[0]), 
					.B(B[0]), 
					.Cin(1'b0)
					);
full_adder_1bit A2 (.S(Sum[1]), 
					.Cout(Cout[1]), 
					.A(A[1]), 
					.B(B[1]),
					.Cin(Cout[0])
					);
full_adder_1bit A3 (.S(Sum[2]), 
					.Cout(Cout[2]), 
					.A(A[2]), 
					.B(B[2]),
					.Cin(Cout[1]));
full_adder_1bit A4 (.S(Sum[3]), 
					.Cout(Cout[3]), 
					.A(A[3]), 
					.B(B[3]),
					.Cin(Cout[2])
					);

endmodule