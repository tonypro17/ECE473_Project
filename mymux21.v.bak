

// file mymux21.v

module mymux21(
	input wire [31:0] in_0,
	input wire [31:0] in_1,
	input wire sel,
	output reg [31:0] out);
	
always @* begin
	if (sel == 0) begin
		out = in_0;
	end else if (sel == 1) begin
		out = in_1;
	end
end

endmodule
