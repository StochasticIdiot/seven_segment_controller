module seven_segment_decoder(
	input [3:0] digit_i,
	output segment_a_o,
	output segment_b_o,
	output segment_c_o,
	output segment_d_o,
	output segment_e_o,
	output segment_f_o,
	output segment_g_o
);

reg [6:0] decoded_digit;

always_comb begin
	case(digit_i)
	4'h0:
		decoded_digit = 7'b0000001;
	4'h1:
		decoded_digit = 7'b1001111;
	4'h2:
		decoded_digit = 7'b0010010;
	4'h3:
		decoded_digit = 7'b0000110;
	4'h4:
		decoded_digit = 7'b1001100;
	4'h5:
		decoded_digit = 7'b0100100;
	4'h6:
		decoded_digit = 7'b0100000;
	4'h7:
		decoded_digit = 7'b0001111;
	4'h8:
		decoded_digit = 7'b0000000;
	4'h9:
		decoded_digit = 7'b0000100;
	4'hA:
		decoded_digit = 7'b0001000;
	4'hB:
		decoded_digit = 7'b1100000;
	4'hC:
		decoded_digit = 7'b0110001;
	4'hD:
		decoded_digit = 7'b1000010;
	4'hE:
		decoded_digit = 7'b0110000;
	4'hF:
		decoded_digit = 7'b0111000;
	endcase
end

assign segment_a_o = decoded_digit[6];
assign segment_b_o = decoded_digit[5];
assign segment_c_o = decoded_digit[4];
assign segment_d_o = decoded_digit[3];
assign segment_e_o = decoded_digit[2];
assign segment_f_o = decoded_digit[1];
assign segment_g_o = decoded_digit[0];

endmodule
