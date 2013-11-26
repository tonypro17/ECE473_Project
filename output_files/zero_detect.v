

// file zero_detect.v


module zero_detect(
	input wire [31:0] value,
	output reg zero);
	
	initial begin
		zero = 0;
	end
	
	always @* begin
		if (value == 0) begin
			zero <= 1;
		end else if (value != 0) begin
			zero <= 0;
		end
	end
endmodule