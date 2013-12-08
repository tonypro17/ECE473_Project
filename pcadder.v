


// file PCadder.v

module pcadder (
	input wire [31:0] pc,
	input wire [31:0] pc_resume,
	input wire delay,
	output reg [31:0] pc_4);
	
	always @* begin
		if (delay == 1) begin
			pc_4 <= pc_resume;
		end else begin
			pc_4 = pc+4;
		end
	end
endmodule
