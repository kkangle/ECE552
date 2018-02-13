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
		assert(ALU_Out == temp)
		    else
		            begin
                        $display("Result is %d, it should be %d",  ALU_Out, temp);
                        
                    end

    end
	$display("Addition tests passed");
	#10;
	
    assign ops = 2'b01;
	repeat(100) begin
	    temp = stim[3:0] - stim[7:4];
	    #20 stim = $random;
		assert(ALU_Out == temp)
		    else 
		        begin
                    $display("Result is %d, it should be %d",  ALU_Out, temp);
                    
                end

    end
	$display("Subtraction tests passed");
    #10;
	
    assign ops = 2'b10;
	repeat(100) begin
	    temp = ~(stim[3:0] & stim[7:4]);
	    #20 stim = $random;
		assert(ALU_Out == temp)
		    else 
		        begin
                    $display("Result is %d, it should be %d",  ALU_Out, temp);
                    $stop;
                end

    end
	$display("NAND tests passed");
	#10;

    assign ops = 2'b11;
	repeat(100) begin
	    temp = stim[3:0] ^ stim[7:4];
	    #20 stim = $random;
		assert(ALU_Out == temp)
		    else 
		        begin
                    $display("Result is %d, it should be %d",  ALU_Out, temp);
                    $stop;
                end

    end
	$display("Xor tests passed");
	#10;
	
	$stop;
end


endmodule