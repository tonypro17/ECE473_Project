


// file ex_control_pipe.v


module ex_control_pipe (
	// inputs
	input wire RegDst,
	input wire [3:0] ALUOp,
	input wire ALUSrc,
	input wire [1:0]Jump,
	input wire J_Jump,
	input wire clk,
	input wire reset,
	// outputs
	output reg RegDst_o,
	output reg [3:0] ALUOp_o,
	output reg ALUSrc_o,
	output reg [1:0] Jump_o,
	output reg J_Jump_o);
	
initial begin
	RegDst_o = 0;
	ALUOp_o = 4'b0000;
	ALUSrc_o = 0;
	Jump_o = 2'b00;
	J_Jump_o = 0;
end
	
always @(posedge clk) begin
	if (reset == 1) begin
		RegDst_o = 0;
		ALUOp_o = 4'b0000;
		ALUSrc_o = 0;
		Jump_o = 2'b00;
		J_Jump_o = 0;		
	end else begin
		RegDst_o <= RegDst;
		ALUOp_o <= ALUOp;
		ALUSrc_o <= ALUSrc;
		Jump_o <= Jump;
		J_Jump_o <= J_Jump;
	end
end

endmodule
