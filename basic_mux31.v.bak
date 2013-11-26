


// file basic_mux31.v


module basic_mux31(
	input wire [31:0] in1,
	input wire [31:0] in2,
	input wire [31:0] in3,
	input wire [1:0] sel,
	output reg [31:0] out);
	
always @* begin
	if (sel == 2'b00) begin
		out <= in1;
	end else if (sel == 2'b01) begin
		out <= in2;
	end else if (sel == 2'b10) begin
		out <= in3;
	end else begin
		out <= in1;
	end
end

endmodule

	