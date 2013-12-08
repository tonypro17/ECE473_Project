

// file hazard_detect.v

module hazard_detect(
	input wire Branching,
	input wire MemRead,
	input wire [4:0] mem_rd,
	input wire [4:0] rs,
	input wire [4:0] rt,
	input wire branch,
	output reg Flush,
	output reg wen,
	output reg delay);
	
	initial begin
		wen <= 1;
		delay <= 0;
	end
	
	always @* begin
		Flush <= 0;
		delay <= 0;
		wen <= 1;
		
		if (Branching == 1) begin
			Flush <= 1;
		end
		
		if (MemRead == 1 && branch == 1 && (mem_rd == rs || mem_rd == rt)) begin
			delay <= 1;
			wen <= 0;
		end
	end
	
endmodule


