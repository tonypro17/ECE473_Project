


// file mem_control_pipe.v


module mem_control_pipe (
	// inputs
	input wire MemRead,
	input wire MemWrite,
	input wire Branch,
	input wire clk,
	input wire reset,
	input wire flush,
	input wire wen,
	// outputs
	output reg MemRead_o,
	output reg MemWrite_o,
	output reg Branch_o);
	
initial begin
	MemRead_o = 0;
	MemWrite_o = 0;
	Branch_o = 0;
end
	
always @(posedge clk) begin
	if (reset == 1 || flush == 1) begin
		MemRead_o <= 0;
		MemWrite_o <= 0;
		Branch_o <= 0;
	end else if (wen == 1) begin
		MemRead_o <= MemRead;
		MemWrite_o <= MemWrite;
		Branch_o <= Branch;
	end
end

endmodule
