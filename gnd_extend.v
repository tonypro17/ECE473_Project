

// file gnd_extend.v


module gnd_extend(
	input wire gnd,
	output reg [31:0] ground);
	
	always @* begin
		ground <= {32{gnd}};
	end
endmodule
