

// file pc_reg.v


module pc_reg(
	input wire [31:0] pc_in,
	input wire clock,
	output reg [31:0] pc_out);
	
	initial begin
		pc_out = 0;
	end
	
	always @(posedge clock) begin
		pc_out <= pc_in;
	end

endmodule
