
//file jump_shifter.v

module jump_shifter(
	input wire [25:0] in,
	output reg [27:0] out);
	
	always @* begin
		out = { {2{in[25]}}, in[25:0] };
		out <= out << 2;
	end

endmodule

