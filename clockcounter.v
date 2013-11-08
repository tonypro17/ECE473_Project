

// file clockcounter.v

module clockcounter (
	input wire clock,
	input wire reset,
	output reg [31:0] val);
	
initial begin
	val = 0;
end

always @(posedge clock) begin
	if (reset == 1) begin
		val = 0;
	end else begin
		val = val + 1;
	end
end

endmodule
