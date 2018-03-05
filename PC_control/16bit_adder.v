module full_adder(
	input [15:0] A,
	input [8:0] B,
	output [15:0] Sum
	);

	wire [3:0] Cout;

	addsub_4bit A1(.Sum(Sum[3:0]), .A(A[3:0]), .B(B[3:0]), .Cout(Cout[0]), .Cin(1'b0));
	addsub_4bit A2(.Sum(Sum[7:4]), .A(A[7:4]), .B(B[7:4]), .Cout(Cout[1]), .Cin(Cout[0]));
	addsub_4bit A3(.Sum(Sum[11:8]), .A(A[11:8]), .B({4{B[8]}}), .Cout(Cout[2]), .Cin(Cout[1]));
	addsub_4bit A4(.Sum(Sum[15:12]), .A(A[15:12]), .B({4{B[8]}}), .Cout(Cout[3]), .Cin(Cout[2]));

endmodule