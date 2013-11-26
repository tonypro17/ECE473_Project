


// file wb_control_pipe.v


module wb_control_pipe (
	// inputs
	input wire RegWrite,
	input wire MemToReg,
	input wire clk,
	input wire reset,
	// outputs
	output reg RegWrite_o,
	output reg MemToReg_o);

initial begin
	RegWrite_o = 0;
	MemToReg_o = 0;
end
	
always @(posedge clk) begin
	if (reset == 1) begin
		RegWrite_o <= 0;
		MemToReg_o <= 0;
	end else begin
		RegWrite_o <= RegWrite;
		MemToReg_o <= MemToReg;
	end
end

endmodule
