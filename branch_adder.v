

// file branch_adder.v

module branch_adder(
	input wire [31:0] pc,
	input wire [31:0] offset,
	output reg [31:0] pc_offset);
	
	always @* begin
		pc_offset <= pc + offset;
	end
endmodule
