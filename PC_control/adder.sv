module addsub_4bit(Sum, A, B, Cout, Cin);

input Cin;
input[3:0] A, B;
output [3:0] Sum;
output Cout;

wire [3:0] C_internal_out;
assign Cout = C_internal_out[3];


full_adder_1bit A1 (Sum[0], C_internal_out[0], A[0], B[0], 1'b0);
full_adder_1bit A2 (Sum[1], C_internal_out[1], A[1], B[1], C_internal_out[0]);
full_adder_1bit A3 (Sum[2], C_internal_out[2], A[2], B[2], C_internal_out[1]);
full_adder_1bit A4 (Sum[3], C_internal_out[3], A[3], B[3], C_internal_out[2]);


endmodule