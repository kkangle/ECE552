module addsub_4bit_tb();

reg [7:0] stim;
wire [3:0] Sum;
wire Ovfl;
reg sub;
reg [3:0] temp;

addsub_4bit DUT(Sum, Ovfl, stim[3:0], stim[7:4], sub);

initial begin
    assign sub = 1'b0;
	stim = 8'b0;
	repeat(100) begin
	    temp = stim[3:0] + stim[7:4];
		#20 stim = $random;
		assert(Sum == temp) $display("success");
		    else 
                    begin
                        $display("sum is %d, it should be %d", Sum, stim[3:0] + stim[7:4]);
                        $stop;
                    end
   
	end
	#10;
	
	assign sub = 1'b1;
	stim = 8'b0;
	repeat(100) begin
		temp = stim[3:0] - stim[7:4];
		#20 stim = $random;
		assert(Sum == temp) $display("success");
		    else 
                    begin
                        $display("sum is %d, it should be %d", Sum, stim[3:0] + stim[7:4]);
                        $stop;
                    end
	end
	#10;
	
	$display("all tests passed");
	$stop;
end

endmodule

