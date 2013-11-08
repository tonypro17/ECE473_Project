


// file control_pipe.v


module control_pipe (
	// inputs
	input wire [1:0] ALUOp,
	input wire ALUSrc,
	input wire RegWrite,
	input wire RegDst,
	input wire MemRead,
	input wire MemWrite,
	input wire MemToReg,
	input wire Branch,
	input wire clk,
	// outputs
	output reg [1:0] ALUOp_o,
	output reg ALUSrc_o,
	output reg RegWrite_o,
	output reg RegDst_o,
	output reg MemRead_o,
	output reg MemWrite_o,
	output reg MemToReg_o,
	output reg Branch_o);
	
always @(posedge clk) begin
	ALUOp_o <= ALUOp;
	ALUSrc_o <= ALUSrc;
	RegWrite_o <= RegWrite;
	RegDst_o <= RegDst;
	MemRead_o <= MemRead;
	MemWrite_o <= MemWrite;
	MemToReg_o <= MemToReg;
	Branch_o <= Branch;
end

endmodule
