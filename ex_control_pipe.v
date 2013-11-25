


// file ex_control_pipe.v


module ex_control_pipe (
	// inputs
	input wire RegDst,
	input wire [3:0] ALUOp,
	input wire ALUSrc,
	input wire [1:0]Jump,
	input wire J_Jump,
	input wire clk,
	// outputs
	output reg RegDst_o,
	output reg [3:0] ALUOp_o,
	output reg ALUSrc_o,
	output reg [1:0] Jump_o,
	output reg J_Jump_o);
	
always @(posedge clk) begin
	RegDst_o <= RegDst;
	ALUOp_o <= ALUOp;
	ALUSrc_o <= ALUSrc;
	Jump_o <= Jump;
	J_Jump_o <= J_Jump;
end

endmodule
