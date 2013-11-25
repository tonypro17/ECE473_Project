


// file wb_control_pipe.v


module wb_control_pipe (
	// inputs
	input wire RegWrite,
	input wire MemToReg,
	input wire clk,
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
end

endmodule
