// file extradig.v

module extradig (
	input wire [2:0] in,
	output reg [6:0] out);
	
	
	always @* begin 
		if (in == 3'h0) begin
			out = 7'b1000000;
		end else if (in == 3'h1) begin
			out = 7'b1111001;
		end else if (in == 3'h2) begin
			out = 7'b0100100;
		end else if (in == 3'h3) begin
			out = 7'b0110000;
		end else if (in == 3'h4) begin
			out = 7'b0011001;
		end else if (in == 3'h5) begin
			out = 7'b0010010;
		end else if (in == 3'h6) begin
			out = 7'b0000010;
		end else if (in == 3'h7) begin
			out = 7'b1111000;
		end else if (in == 3'h8) begin
			out = 7'b0000000;
		end else if (in == 3'h9) begin
			out = 7'b0011000;
		end else if (in == 3'ha) begin
			out = 7'b0001000;
		end else if (in == 3'hb) begin
			out = 7'b0000011;
		end else if (in == 3'hc) begin
			out = 7'b1000110;
		end else if (in == 3'hd) begin
			out = 7'b0100001;
		end else if (in == 3'he) begin
			out = 7'b0000110;
		end else if (in == 3'hf) begin
			out = 7'b0001110;
		end			
	end
	
endmodule