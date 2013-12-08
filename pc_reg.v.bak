

// file pc_reg.v


module pc_reg(
	input wire [31:0] pc_in,
	input wire clock,
	input wire reset,
	output reg [31:0] pc_out);
	
	initial begin
		pc_out = 32'h00400000;
	end
	
	always @(posedge clock) begin
		if (reset == 1) begin
			pc_out = 32'h00400000;
		end else begin
			pc_out <= pc_in;
		end
	end

endmodule
