

// file adder.v


module adder(
	input wire [31:0] rs,
	input wire [31:0] rt,
	input wire [3:0] ALUOp,
	input wire [4:0] shamt,
	input wire clock,        				  		// -IAN-	added clock so ALU can be clocked on NEGEDGE (suggested by TA)
	output reg [31:0] result,
	output reg zero);
	
	always @(negedge clock) begin			  		// -IAN-	changed to clock on NEGEDGE 

		if (ALUOp == 4'b0001) begin 			  	//			ALUOp = 0001 means ADD instruction
			result <= rs + rt;
		end else if (ALUOp == 4'b0010) begin 	// -IAN-	ALUOp = 0010 means SUB instruction
			result <= rs - rt;
		end else if (ALUOp == 4'b0011) begin 	// -IAN-	ALUOp = 0011 means AND instruction
			result <= rs & rt;
		end else if (ALUOp == 4'b0100) begin	//-tony- ALUOp = 0100 means OR instruction
			result <= rs | rt;
		end else if (ALUOp == 4'b0101) begin	//-tony- ALUOp = 0101 means NOR instruction
			result <= rs ^~ rt;
		end else if (ALUOp == 4'b0110) begin	//-tony- ALUOp = 0110 means SLT instruction
			if (rs < rt) begin
				result <= 1;
			end else begin
				result <= 0;
			end
		end else if (ALUOp == 4'b0111) begin	//-tony-	ALUOp = 0111 means SLL function
			result <= rt << shamt;
		end else if (ALUOp == 4'b1000) begin	//-tony-	ALUOp = 1000 means SRL function
			result <= rt >> shamt;
		end else if (ALUOp == 4'b1001) begin	//-tony-	ALUOp = 1001 means SRA function
			
		end else if (ALUOp == 4'b0000) begin 	//			ALUOp = 0000 means no ALU function
			result <= 0;
		end
			
	end
	
endmodule
