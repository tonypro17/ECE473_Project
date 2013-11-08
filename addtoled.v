

// file addtoled.v

module addtoled (
	input wire [1:0] sel,
	input wire [4:0] regadd,
	input wire [4:0] instadd,
	input wire [4:0] dataadd,
	output reg [4:0] addout);
	
always @* begin
	if (sel == 2'b00) begin
		addout = regadd;
	end else if (sel == 2'b01) begin
		addout = dataadd;
	end else if (sel == 2'b10) begin
		addout = instadd;
	end
end

endmodule

