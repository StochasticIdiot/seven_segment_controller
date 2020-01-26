/*
 *  Simple wrapper to test the seven_segment_controller in an FPGA
 *  It just puts a constant value on the display
 */

module seven_segment_wrapper(
	input clk_i,
	output [7:0] digit_enable_o,
	output [7:0] digit_code_o
);
wire [31:0] value;
assign value = 32'hFDECBA98;

seven_segment_controller seven_segment_controller_inst(
	.clk_i(clk_i),
	.value_i(value),
	.digit_enable_o(digit_enable_o),
	.digit_code_o(digit_code_o)
);
endmodule
