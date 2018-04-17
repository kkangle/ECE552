cache_fill_FSM(clk, rst_n, miss_detected, miss_address, fsm_busy, write_data_array, write_tag_array,memory_address, memory_data, memory_data_valid);
input clk, rst_n;
input miss_detected; // active high when tag match logic detects a miss
input [15:0] miss_address; // address that missed the cache
output fsm_busy; // asserted while FSM is busy handling the miss (can be used as pipeline stall signal)
output write_data_array; // write enable to cache data array to signal when filling with memory_data
output write_tag_array; // write enable to cache tag array to write tag and valid bit once all words are filled in to data array
output [15:0] memory_address; // address to read from memory
input [15:0] memory_data; // data returned by memory (after  delay)
input memory_data_valid; // active high indicates valid data returning on memory bus

wire [3:0] state_new;
wire [3:0] state_current;
wire [15:0] data_new1, data_current1;
wire [15:0] data_new2, data_current2;
wire [15:0] data_new3, data_current3;
wire [15:0] data_new4, data_current4;
wire [15:0] data_new5, data_current5;
wire [15:0] data_new6, data_current6;
wire [15:0] data_new7, data_current7;
wire [15:0] data_new8, data_current8;
wire [15:0] address_new, address_current;

wire data_wen1;
wire data_wen2;
wire data_wen3;
wire data_wen4;
wire data_wen5;
wire data_wen6;
wire data_wen7;
wire data_wen8;

localparam IDLE  = 4'b0000;
localparam WAIT1 = 4'b0001;
localparam WAIT2 = 4'b0010;
localparam WAIT3 = 4'b0011;
localparam WAIT4 = 4'b0100;
localparam WAIT5 = 4'b0101;
localparam WAIT6 = 4'b0110;
localparam WAIT7 = 4'b0111;
localparam WAIT8 = 4'b1000;

state_reg data_reg1(
	.state_new(data_new1),
	.clk(clk),
	.rst(~rst_n)
	.wen(data_wen1),
	.state_current(data_current1)
);

full_adder_16b address_adder(
	.A(address_current), 
	.B(16'h0002), 
	.cin(1'b0), 
	Sum(address_new),
	.cout()
);


state_reg data_reg1(
	.state_new(data_new1),
	.clk(clk),
	.rst(~rst_n)
	.wen(data_wen1),
	.state_current(data_current1)
);
state_reg data_reg2(
	input [15:0] state_new,
	.clk(clk,)
	.rst(~rst_n)
	.wen(data_wen2),
	.state_current(data_current2)
);
state_reg data_reg3(
	input [15:0] state_new,
	.clk(clk,)
	.rst(~rst_n)
	.wen(data_wen3),
	.state_current(data_current3)
);
state_reg data_reg4(
	input [15:0] state_new,
	.clk(clk,)
	.rst(~rst_n)
	.wen(data_wen4),
	.state_current(data_current4)
);
state_reg data_reg5(
	input [15:0] state_new,
	.clk(clk,)
	.rst(~rst_n)
	.wen(data_wen5),
	.state_current(data_current5)
);
state_reg data_reg6(
	input [15:0] state_new,
	.clk(clk,)
	.rst(~rst_n)
	.wen(data_wen6),
	.state_current(data_current6)
);
state_reg data_reg7(
	input [15:0] state_new,
	.clk(clk,)
	.rst(~rst_n)
	.wen(data_wen7),
	.state_current(data_current7)
);
state_reg data_reg8(
	input [15:0] state_new,
	.clk(clk,)
	.rst(~rst_n)
	.wen(data_wen8),
	.state_current(data_current8)
);

always_comb
	begin
		address_new = 16'h0000;
		fsm_busy = 1'b0;
		write_data_array = 1'b0;
		state_new = IDLE;
		data_wen1 = 1'b0;
		data_wen2 = 1'b0;
		data_wen3 = 1'b0;
		data_wen4 = 1'b0;
		data_wen5 = 1'b0;
		data_wen6 = 1'b0;
		data_wen7 = 1'b0;
		data_wen8 = 1'b0;

		case(state)
			IDLE: begin
				fsm_busy = (miss_detected)? 1'b1:1'b0;
				memory_address[15:0] = (miss_detected) ? miss_address[15:0]:16'h0000;
				address_new = (miss_detected)? miss_address[15:0]: 16'h0000;
				write_data_array = (miss_detected)1'b1:1'b0;
				state_new = (miss_detected)? WAIT1:IDLE;
			end

			WAIT1: begin
				data_wen1 = 1'b1;
				data_new1[15:0] = 16{memory_data_valid} | memory_data[15:0];
				address_current = address_new;
				memory_address = address_new;
				state_new = WAIT2;
			end

			WAIT2: begin
				data_wen2 = 1'b1;
				data_new2[15:0] = 16{memory_data_valid} | memory_data[15:0];
				address_current = address_new;
				memory_address = address_new;
				state_new = WAIT3;
			end

			WAIT3: begin
				data_wen3 = 1'b1;
				data_new3[15:0] = 16{memory_data_valid} | memory_data[15:0];
				address_current = address_new;
				memory_address = address_new;
				state_new = WAIT4;
			end

			WAIT4: begin
				data_wen4 = 1'b1;
				data_new4[15:0] = 16{memory_data_valid} | memory_data[15:0];
				address_current = address_new;
				memory_address = address_new;
				state_new = WAIT5;
			end

			WAIT5: begin
				data_wen5 = 1'b1;
				data_new5[15:0] = 16{memory_data_valid} | memory_data[15:0];
				address_current = address_new;
				memory_address = address_new;
				state_new = WAIT6;
			end

			WAIT6: begin
				data_wen6 = 1'b1;
				data_new6[15:0] = 16{memory_data_valid} | memory_data[15:0];
				address_current = address_new;
				memory_address = address_new;
				state_new = WAIT7;
			end

			WAIT7: begin
				data_wen7 = 1'b1;
				data_new7[15:0] = 16{memory_data_valid} | memory_data[15:0];
				address_current = address_new;
				memory_address = address_new;
				state_new = WAIT8;
			end


			WAIT8: begin
				data_wen8 = 1'b1;
				data_new8[15:0] = 16{memory_data_valid} | memory_data[15:0];
				address_new = 16'h0000;

				memory_address = add;
				state_new = IDLE;
			end

	end