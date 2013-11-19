





// file : RegModule.v

module RegModule(
	input wire [4:0]	rs_read,
	input wire [4:0] 	rt_read,
	input wire [31:0] write_data_in,
	input wire [4:0] 	rd,
	input wire WriteEnable,
	input wire reset,
	input wire clock,
	input wire [4:0] 	read_address_debug,
	input wire clock_debug,
	output reg [31:0] rs_out,
	output reg [31:0] rt_out,
	output reg [31:0] data_out_debug);
	
integer register[31:0];
integer i;

initial begin
	for (i = 0; i<32; i=i+1) begin
		register[i] = 0;
		register[1] = 32'hFFFFFFE2;
		register[2] = 32'h00000038;
	end
end

always @(negedge clock) begin
	if (reset == 1) begin
		for (i = 0; i<32; i=i+1) begin
			register[i] = i;
		end
		register[1] = 32'hFFFFFFE2;				//-IAN- added so registers 1&2 will initiate to test program
		register[2] = 32'h00000038;				// initial values when reset button is pushed
	end else if (WriteEnable == 1) begin
		register[rd] = write_data_in;
	end
end

always @* begin
	rs_out <= register[rs_read];
	rt_out <= register[rt_read];
end

always @(clock_debug) begin
	data_out_debug <= register[read_address_debug];
end

endmodule		