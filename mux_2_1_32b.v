

// file mux_2_1_32b.v


module mux_2_1_32b (
	input wire [31:0] in0,
	input wire [31:0] in1,
	input wire sel,
	output reg [31:0] out);
	
	always @* begin
		if (sel == 0) begin
			out <= in0;
		end else if (sel == 1) begin
			out <= in1;
		end
	end
endmodule
