

// file adder.v


module adder(
	input wire [31:0] rs,
	input wire [31:0] rt,
	input wire [1:0] ALUOp,
	input wire clock,        				  	// -IAN-	added clock so ALU can be clocked on NEGEDGE (suggested by TA)
	output reg [31:0] result);
	
	always @(negedge clock) begin			  	// -IAN-	changed to clock on NEGEDGE 

		if (ALUOp == 2'b01) begin 			  	//			ALUOp = 01 means ADD instruction
			result <= rs + rt;
		end else if (ALUOp == 2'b00) begin 	//			ALUOp = 00 means no ALU function
			result <= 0;
		end else if (ALUOp == 2'b10) begin 	// -IAN-	ALUOp = 10 means SUB instruction
			result <= rs - rt;
		end else if (ALUOp == 2'b11) begin 	// -IAN-	ALUOp = 11 means AND instruction
			result <= rs & rt;
		end
			
	end
	
endmodule
