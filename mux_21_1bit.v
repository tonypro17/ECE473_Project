

// file mux_21_1bit.v

module mux_21_1bit(
	input wire in0,
	input wire in1,
	input wire sel,
	output reg out);
	
always @* begin
	if (sel == 0) begin
		out <= in0;
	end else if (sel == 1) begin
		out <= in1;
	end
end

endmodule
