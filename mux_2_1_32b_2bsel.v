



// file mux_2_1_32b_2bsel.v


module mux_2_1_32b_2bsel (
	input wire [31:0] in0,
	input wire [31:0] in1,
	input wire [1:0] sel,
	output reg [31:0] out);
	
	always @* begin
		if (sel == 2'b00) begin
			out <= in0;
		end else if (sel == 2'b01) begin
			out <= in1;
		end else begin
			out <= in0;
		end
	end
endmodule
