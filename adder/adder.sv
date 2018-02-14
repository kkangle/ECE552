module addsub_4bit(Sum, Ovfl, A, B, sub);

input[3:0] A, B;
input sub;
output [3:0] Sum;
output Ovfl;

wire [3:0] Cout;
wire [3:0] invB;
assign invB = sub? ~B + 1'b1: B;

assign Ovfl = sub ? (Sum[3] & ~A[3] & ~B[3]) | (~Sum[3] & A[3] & B[3]): (Sum[3] & ~A[3] & B[3]) | (~Sum[3] & A[3] & ~B[3]);

full_adder_1bit A1 (Sum[0], Cout[0], A[0], invB[0], 1'b0);
full_adder_1bit A2 (Sum[1], Cout[1], A[1], invB[1], Cout[0]);
full_adder_1bit A3 (Sum[2], Cout[2], A[2], invB[2], Cout[1]);
full_adder_1bit A4 (Sum[3], Cout[3], A[3], invB[3], Cout[2]);

endmodule