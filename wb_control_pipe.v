


// file wb_control_pipe.v


module wb_control_pipe (
	// inputs
	input wire RegWrite,
	input wire MemToReg,
	input wire clk,
	input wire reset,
	input wire flush,
	input wire wen,
	// outputs
	output reg RegWrite_o,
	output reg MemToReg_o);

initial begin
	RegWrite_o = 0;
	MemToReg_o = 0;
end
	
always @(posedge clk) begin
	RegWrite_o <= RegWrite;
	MemToReg_o <= MemToReg;
/*	if (reset == 1 || flush == 1 || wen == 0) begin
		RegWrite_o <= 0;
		MemToReg_o <= 0;
	end */
end

endmodule
