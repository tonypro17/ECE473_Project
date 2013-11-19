

// file RegDst_mux.v


module RegDst_mux(
	input wire [4:0] rd,
	input wire [4:0] rt,
	input wire sel,
	output reg [4:0] out);
	
	always @* begin
		if (sel == 0) begin
			out <= rd;
		end else if (sel == 1) begin
			out <= rt;
		end
	end
endmodule

