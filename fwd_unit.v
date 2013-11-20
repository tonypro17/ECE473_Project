


// file fwd_unit.v


module fwd_unit(
	input wire [4:0] id_ex_rs,
	input wire [4:0] id_ex_rt,
	input wire [4:0] ex_mem_rd,
	input wire ex_mem_regwrite,
	input wire [4:0] mem_wb_rd,
	input wire mem_wb_regwrite,
	input wire I_type,
	output reg [1:0] forward_rs,
	output reg [1:0] forward_rt);
	
	always @* begin
			forward_rs = 2'b00;
			forward_rt = 2'b00;
		if (mem_wb_regwrite == 1 && mem_wb_rd == id_ex_rs) begin
			forward_rs = 2'b10;
		end
		if (I_type == 0 && mem_wb_regwrite == 1 && mem_wb_rd == id_ex_rt) begin
			forward_rt = 2'b10;
		end
		if (ex_mem_regwrite == 1 && ex_mem_rd == id_ex_rs) begin
			forward_rs = 2'b01;
		end
		if (I_type == 0 && ex_mem_regwrite == 1 && ex_mem_rd == id_ex_rt) begin
			forward_rt = 2'b01;
		end
	end

endmodule
