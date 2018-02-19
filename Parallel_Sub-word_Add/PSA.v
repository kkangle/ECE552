module PSA_16bit (Sum, Error, A, B);
input [15:0] A, B; //Input values
output [15:0] Sum; //sum output
output Error; //To indicate overflows

wire [3:0] Ovfl;

adder_4bit ll(.Sum(Sum[3:0]), 
				.Ovfl(Ovfl[0]), 
				.A(A[3:0]), 
				.B(B[3:0])
			);
adder_4bit l(.Sum(Sum[7:4]), 
				.Ovfl(Ovfl[1]), 
				.A(A[7:4]), 
				.B(B[7:4])
			);
adder_4bit h(.Sum(Sum[11:8]), 
				.Ovfl(Ovfl[2]), 
				.A(A[11:8]), 
				.B(B[11:8])
			);
adder_4bit hh(.Sum(Sum[15:12]), 
				.Ovfl(Ovfl[3]), 
				.A(A[15:12]), 
				.B(B[15:12])
			);

assign Error = |Ovfl;

endmodule

