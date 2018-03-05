module PC_control_tb();

logic [2:0]C;
logic [8:0]I; 
logic [2:0]F;
logic [15:0]PC_in;
logic [15:0]PC_out;

PC_control	DUT(
		.C(C),
		.I(I), 
		.F(F), 
		.PC_in(PC_in),
		.PC_out(PC_out)
);

`ifdef DUMPFSDB
    initial begin
        $fsdbDumpfile("pc_control.fsdb");
        $fsdbDumpvars(0,"+all");
        // $fsdbDumpvars;
    end
`endif

	initial
    begin
        #15;
        repeat(500) begin
            #10 C = $random;
            I = $random;
            F = $random;
            PC_in = $random;
        end
        $finish;
    end

    
endmodule


