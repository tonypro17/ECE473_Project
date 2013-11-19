


// file PCadder.v

module pcadder (
	input wire [31:0] pc,
	input wire clock,
	input wire reset,
	output reg [31:0] pc_4);
	
	initial begin
		pc_4 = 0;
	end
	
	always @(posedge clock) begin
		if (reset == 1) begin
			pc_4 = 0;
		end else begin
			pc_4 = pc + 4;
		end
	end
endmodule
