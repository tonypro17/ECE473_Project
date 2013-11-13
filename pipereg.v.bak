


// file pipereg.v

module pipereg (
	input wire [31:0] in1,
	input wire [31:0] in2,
	input wire [4:0] rdin,
	input wire clock,
	input wire reset,
	input wire wen,
	input wire [4:0] rsin,
	input wire [4:0] rtin,
	output reg [31:0] out1,
	output reg [31:0] out2,
	output reg [4:0] rdout,
	output reg [4:0] rsout,
	output reg [4:0] rtout);
	
	always @(posedge clock) begin
		if (reset == 1) begin
			out1 = 0;
			out2 = 0;
			rdout = 0;
			rsout = 0;
			rtout = 0;
		end else if (wen == 1) begin
			out1 <= in1;
			out2 <= in2;
			rdout <= rdin;
			rsout <= rsin;
			rtout <= rtin;
		end
	end
	
endmodule
