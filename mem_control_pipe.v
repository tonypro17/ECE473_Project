


// file mem_control_pipe.v


module mem_control_pipe (
	// inputs
	input wire MemRead,
	input wire MemWrite,
	input wire Branch,
	input wire clk,
	// outputs
	output reg MemRead_o,
	output reg MemWrite_o,
	output reg Branch_o);
	
always @(posedge clk) begin
	MemRead_o <= MemRead;
	MemWrite_o <= MemWrite;
	Branch_o <= Branch;
end

endmodule
