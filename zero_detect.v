

// file zero_detect.v

module zero_detect(
	input wire [31:0] rs,
	input wire [31:0] rt,
	input wire [2:0] op,
	output reg zero);
	
	initial begin
		zero = 0;
	end
	
	always @* begin
		zero <= 0;
		if (op == 3'b001) begin //beq
			if (rs - rt == 0) begin
				zero <= 1;
			end
		end else if (op == 3'b010) begin //bne
			if (rs - rt != 0) begin
				zero <= 1;
			end
		end else if (op == 3'b011) begin //bgtz
			if (rs > 0) begin
				zero <= 1;
			end
		end else if (op == 3'b100) begin //bgez
			if (rs >= 0) begin
				zero <= 1;
			end
		end 
	end
endmodule
			