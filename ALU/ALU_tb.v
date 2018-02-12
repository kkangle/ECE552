module ALU_tb();

reg [1:0] ops;
wire [3:0] ALU_Out;
reg [7:0] stim;
reg [3:0] temp;
wire Error;

ALU DUT(.ALU_Out(ALU_Out), .Error(Error), .ALU_In1(stim[3:0]), .ALU_In2(stim[7:4]), .Opcode(ops));

initial begin
    assign ops = 2'b00;
    stim = 8'b0;
    repeat(100) begin
	    temp = stim[3:0] + stim[7:4];
	    #20 stim = $random;
		assert(ALU_Out == temp) $display("success");
		    else
		            begin
                        $display("sum is %d, it should be %d", Sum, stim[3:0] + stim[7:4]);
                        $stop;
                    end

    end
	#10;
	
    assign ops = 2'b10;
	repeat(100) begin
	    temp = stim[3:0] - stim[7:4];
	    #20 stim = $random;
		assert(ALU_Out == temp) $display("success");
		    else 
		        begin
                    $display("sum is %d, it should be %d", Sum, stim[3:0] + stim[7:4]);
                    $stop;
                end

    end
    #10;
	
    assign ops = 2'b11;
	repeat(100) begin
	    temp = ~(stim[3:0] & stim[7:4]);
	    #20 stim = $random;
		assert(ALU_Out == temp) $display("success");
		    else: 
		        begin
                    $display("sum is %d, it should be %d", Sum, stim[3:0] + stim[7:4]);
                    $stop;
                end

    end
	#10;

    assign ops = 2'b01;
	repeat(100) begin
	    temp = stim[3:0] ^ stim[7:4];
	    #20 stim = $random;
		assert(ALU_Out == temp) $display("success");
		    else: 
		        begin
                    $display("sum is %d, it should be %d", Sum, stim[3:0] + stim[7:4]);
                    $stop;
                end

    end
	#10;
end


endmodule