module seven_segment_controller #(
	parameter NUM_DIGITS=8,
	parameter CLK_FREQ_MHZ=50
)(
	input clk_i,
	input [NUM_DIGITS*4-1:0] value_i,
	output [NUM_DIGITS-1:0] digit_enable_o,
	output [7:0] digit_code_o
);

localparam COUNTER_DIGIT_WIDTH = $clog2(NUM_DIGITS);
localparam COUNTER_REFRESH = 16*CLK_FREQ_MHZ*100 / NUM_DIGITS;  // Refresh every 16 ms
localparam COUNTER_REFRESH_WIDTH = $clog2(COUNTER_REFRESH);

wire [7:0] digit_code;
reg [7:0] digit_code_q;

wire [3:0] half_byte;
wire [NUM_DIGITS-1:0] digit_enable;

reg [COUNTER_DIGIT_WIDTH:0] digit_counter;
reg [COUNTER_REFRESH_WIDTH-1:0] refresh_counter;


always_comb begin
	digit_enable = 1 << digit_counter;
	half_byte = value_i[4*digit_counter +: 4];
end

always @(posedge clk_i) begin
	if(refresh_counter == 0) begin
		digit_counter = digit_counter + 1;
		//digit_enable_q = digit_enable_reg;
		//digit_code_q = digit_code_aux;
	end
end

always @(posedge clk_i) begin
	if(refresh_counter >= COUNTER_REFRESH) begin
		refresh_counter = 0;
	end else begin
		refresh_counter = refresh_counter + 1;
	end
end

seven_segment_decoder dec_inst(
	.digit_i(half_byte),
	.segment_a_o(digit_code[7]),
	.segment_b_o(digit_code[6]),
	.segment_c_o(digit_code[5]),
	.segment_d_o(digit_code[4]),
	.segment_e_o(digit_code[3]),
	.segment_f_o(digit_code[2]),
	.segment_g_o(digit_code[1])
);

assign digit_code[0] = 1;

assign digit_enable_o = ~digit_enable;
assign digit_code_o = digit_code;
endmodule
