





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
	input wire [1:0] Jump,
	input wire [31:0] pc_address,
	input wire [25:0] J_type_add,
	output reg [31:0] rs_out,
	output reg [31:0] rt_out,
	output reg [31:0] data_out_debug);
	
integer register[31:0];
integer i;

initial begin
	for (i = 0; i<32; i=i+1) begin
		register[i] = 0;
	end
end

always @(negedge clock) begin
	if (reset == 1) begin
		for (i = 0; i<32; i=i+1) begin
			register[i] = 0;
		end
	end else if (WriteEnable == 1) begin
		register[rd] = write_data_in;
	end
	
	if (Jump == 2'b11) begin					//-IAN- if jal instruction register 31 saves pc_address 
		register [31] <=pc_address; 
	end
end

always @* begin
/*	if (Jump == 2'b11) begin					//-IAN- if jal, rs is set to instrut fetch bits [25:0]
		rs_out <= J_type_add;
	end else begin  */	
	rs_out <= register[rs_read];
	rt_out <= register[rt_read];
end

always @(clock_debug) begin
	data_out_debug <= register[read_address_debug];
end

endmodule		