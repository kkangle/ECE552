module PSA_tb();

reg [15:0] stimA;
reg [15:0] stimB;
wire [15:0] Sum;
reg [3:0] Ovfl;
wire Error;
reg [3:0] tempA,tempB,tempC,tempD;

PSA_16bit DUT(.Sum(Sum[15:0]), 
				.Error(Error), 
				.A(stimA[15:0]), 
				.B(stimB[15:0])
			);

initial begin
	stimA = 16'b0;
	stimB = 16'b0;
	Ovfl = 4'b0;
	repeat(100) begin
	    tempA = stimA[3:0] + stimB[3:0];
		tempB = stimA[7:4] + stimB[7:4];
		tempC = stimA[11:8] + stimB[11:8];
		tempD = stimA[15:12] + stimB[15:12];
		Ovfl[0] = (tempA[3] & ~stimA[3] & ~stimB[3]) | (~tempA[3] & stimA[3] & stimB[3]);
		Ovfl[1] = (tempB[3] & ~stimA[7] & ~stimB[7]) | (~tempB[3] & stimA[7] & stimB[7]);
		Ovfl[2] = (tempC[3] & ~stimA[11] & ~stimB[11]) | (~tempC[3] & stimA[11] & stimB[11]);
		Ovfl[3] = (tempD[3] & ~stimA[15] & ~stimB[15]) | (~tempD[3] & stimA[15] & stimB[15]);
		#20 begin
				stimA = $random;
				stimB = $random;
			end
		
		assert(Sum[3:0] == tempA & Sum[7:4] == tempB & Sum[11:8] == tempC & Sum[15:12] == tempD)
		    else 
                begin
                    $display("shoot! Sum is wrong, here is a list of info: Sum: %h, temp: %h %h %h %h", 
							Sum, tempA, tempB, tempC, tempD);
                    $stop;
                end
		assert(Error == |Ovfl)
			else 
                begin
                    $display("shoot! Error is wrong, here is a list of info: Error: %h, Ovfl: %b", 
								Error, Ovfl);
					$stop;
                end
	end
	$display("All test passed!");
	$finish;
end

endmodule

