


// file PCadder.v

module pcadder (
	input wire [31:0] pc,
	input wire [1:0]jump,
	input wire [31:0] jump_add,
	input wire [31:0] jump_forward_add,
	output reg [31:0] pc_4);
	
	always @* begin
	/*	if (jump == 2'b01 || jump == 2'b11) begin	//-IAN-  added for jump instruction,  removed PC mux
			pc_4 = jump_add;
		end else if (jump == 2'b10) begin
			pc_4 = jump_forward_add;
		end else begin */
		pc_4 = pc+4;
	end
endmodule
