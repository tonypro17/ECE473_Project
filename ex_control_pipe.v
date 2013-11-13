


// file ex_control_pipe.v


module ex_control_pipe (
	// inputs
	input wire RegDst,
	input wire [3:0] ALUOp,
	input wire ALUSrc,
	input wire clk,
	// outputs
	output reg RegDst_o,
	output reg [3:0] ALUOp_o,
	output reg ALUSrc_o);
	
always @(posedge clk) begin
	RegDst_o <= RegDst;
	ALUOp_o <= ALUOp;
	ALUSrc_o <= ALUSrc;
end

endmodule
