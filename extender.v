

// file extender.v


module extender(
	input wire [15:0] in,
	input wire clock,
	output reg [31:0] out);
	
	always @(negedge clock) begin
		out <= { {16{in[15]}}, in[15:0] };
	end
endmodule
