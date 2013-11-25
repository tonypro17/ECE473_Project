

// file concat.v


module concat(
	input wire [27:0] jmp_imm,
	input wire [3:0] pc,
	output reg [31:0] jump_addr);
	
	always @* begin
		jump_addr <= { pc[3:0], jmp_imm[27:0] };
	end
	
endmodule
