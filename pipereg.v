


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
	input wire [4:0] shamt_in,
	input wire [31:0] imm_in,
	input wire zero_in,
	input wire [31:0] pc_in,
	input wire flush,
	output reg [31:0] out1,
	output reg [31:0] out2,
	output reg [4:0] rdout,
	output reg [4:0] rsout,
	output reg [4:0] rtout,
	output reg [4:0] shamt_out,
	output reg [31:0] imm_out,
	output reg zero_out,
	output reg [31:0] pc_out);
	
	initial begin
			out1 = 0;
			out2 = 0;
			rdout = 0;
			rsout = 0;
			rtout = 0;
			shamt_out = 0;
			zero_out = 0;
			imm_out = 0;
			pc_out = 0;
	end
	
	always @(posedge clock) begin
		if (reset == 1 || flush == 1) begin
			out1 = 0;
			out2 = 0;
			rdout = 0;
			rsout = 0;
			rtout = 0;
			shamt_out = 0;
			zero_out = 0;
			imm_out = 0;
			pc_out = 0;
		end else if (wen == 1) begin
			out1 <= in1;
			out2 <= in2;
			rdout <= rdin;
			rsout <= rsin;
			rtout <= rtin;
			shamt_out <= shamt_in;
			imm_out <= imm_in;
			zero_out <= zero_in;
			pc_out <= pc_in;
		end
	end
	
endmodule
