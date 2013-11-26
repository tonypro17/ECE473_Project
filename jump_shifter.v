
//file jump_shifter.v

module jump_shifter(
	input wire [25:0] in,
	input wire gnd,
	output reg [27:0] out);
	
	always @* begin
		out <= {in[25:0], {2{gnd}} };
	end

endmodule

