


// file mux31.v


module mux31(
	input wire [31:0] regdata,
	input wire [31:0] data_add,
	input wire [31:0] inst_add,
	input wire [31:0] alu_result,
	input wire [1:0] sel,
	output reg [31:0] to_lcd);
	
always @* begin
	if (sel == 2'b00) begin
		to_lcd = regdata;
	end else if (sel == 2'b01) begin
		to_lcd = data_add;
	end else if (sel == 2'b10) begin
		to_lcd = inst_add;
	end else if (sel == 2'b11) begin
		to_lcd = alu_result;
	end
end

endmodule

	