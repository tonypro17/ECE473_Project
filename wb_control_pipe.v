


// file wb_control_pipe.v


module wb_control_pipe (
	// inputs
	input wire RegWrite,
	input wire MemToReg,
	input wire clk,
	// outputs
	output reg RegWrite_o,
	output reg MemToReg_o);
	
always @(posedge clk) begin
	RegWrite_o <= RegWrite;
	MemToReg_o <= MemToReg;
end

endmodule
