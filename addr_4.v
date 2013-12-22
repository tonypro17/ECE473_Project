


// file addr_4.v

module addr_4(
	input wire [4:0] addr_in,
	output reg [6:0] addr_out);
	
always @* begin
	addr_out = addr_in*4;
end

endmodule
