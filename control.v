


// file control.v


module control(
	input wire [5:0] opcode,
	input wire [5:0] funct,
	
	output reg RegWrite,
	output reg MemToReg,
	output reg MemRead,
	output reg MemWrite,
	output reg Branch,
	output reg RegDst,
	output reg [3:0] ALUOp,
	output reg ALUSrc);
	
	always @* begin
	
		// check opcode
		if (opcode == 6'b000000) begin 				//			opcode = 0 means R-CODE instruction
		
			// check function code
			if (funct == 6'b100000) begin 			//			funct = 100000 means ADD instruction
				RegWrite <= 1;
				MemToReg <= 0;
				MemRead <= 0;
				MemWrite <= 0;
				Branch <= 0;
				RegDst <= 0;
				ALUOp <= 4'b0001;
				ALUSrc <= 0;
			end else if (funct == 6'b100001) begin	//-tony-	funct = 000001 means ADDU instruction
				RegWrite <= 1;
				MemToReg <= 0;
				MemRead <= 0;
				MemWrite <= 0;
				Branch <= 0;
				RegDst <= 0;
				ALUOp <= 4'b1010;
				ALUSrc <= 0;
			end else if (funct == 6'b100010) begin	// -IAN-	funct = 100010 means SUB intstruction
				RegWrite <= 1;
				MemToReg <= 0;
				MemRead <= 0;
				MemWrite <= 0;
				Branch <= 0;
				RegDst <= 0;
				ALUOp <= 4'b0010;
				ALUSrc <= 0;
			end else if (funct == 6'b100011) begin	//-tony-	funct = 100011 means SUBU instruction
				RegWrite <= 1;
				MemToReg <= 0;
				MemRead <= 0;
				MemWrite <= 0;
				Branch <= 0;
				RegDst <= 0;
				ALUOp <= 4'b1011;
				ALUSrc <= 0;
			end else if (funct == 6'b100100) begin	// -IAN-	funct = 1001000 means AND instruction
				RegWrite <= 1;
				MemToReg <= 0;
				MemRead <= 0;
				MemWrite <= 0;
				Branch <= 0;
				RegDst <= 0;
				ALUOp <= 4'b0011;
				ALUSrc <= 0;
			end else if (funct == 6'b100101) begin	//-tony-	funct = 100101 means OR instruction
				RegWrite <= 1;
				MemToReg <= 0;
				MemRead <= 0;
				MemWrite <= 0;
				Branch <= 0;
				RegDst <= 0;
				ALUOp <= 4'b0100;
				ALUSrc <= 0;
			end else if (funct == 6'b100111) begin	//-tony- funct = 100111 means NOR instruction
				RegWrite <= 1;
				MemToReg <= 0;
				MemRead <= 0;
				MemWrite <= 0;
				Branch <= 0;
				RegDst <= 0;
				ALUOp <= 4'b0101;
				ALUSrc <= 0;
			end else if (funct == 6'b101010) begin	//-tony-	funct = 101010 means SLT instruction
				RegWrite <= 1;
				MemToReg <= 0;
				MemRead <= 0;
				MemWrite <= 0;
				Branch <= 0;
				RegDst <= 0;
				ALUOp <= 4'b0110;
				ALUSrc <= 0;
			end else if (funct == 6'b000000) begin	//-tony-	funct = 000000 means NOP/SLL instruction
				RegWrite <= 1;
				MemToReg <= 0;
				MemRead <= 0;
				MemWrite <= 0;
				Branch <= 0;
				RegDst <= 0;
				ALUOp <= 4'b0111;
				ALUSrc <= 0;
			end else if (funct == 6'b000010) begin	//-tony-	funct = 000010 means SRL instruction
				RegWrite <= 1;
				MemToReg <= 0;
				MemRead <= 0;
				MemWrite <= 0;
				Branch <= 0;
				RegDst <= 0;
				ALUOp <= 4'b1000;
				ALUSrc <= 0;
			end else if (funct == 6'b000011) begin	//-tony-	funct = 000011 means SRA instruction
				RegWrite <= 1;
				MemToReg <= 0;
				MemRead <= 0;
				MemWrite <= 0;
				Branch <= 0;
				RegDst <= 0;
				ALUOp <= 4'b1001;
				ALUSrc <= 0;
			end else if (funct == 6'b001000) begin	//-tony-	funct = 001000 means JR instruction
				RegWrite <= 0;
				MemToReg <= 0;
				MemRead <= 0;
				MemWrite <= 0;
				Branch <= 1;
				RegDst <= 0;
				ALUOp <= 4'b0000;
				ALUSrc <= 0;
		end else begin
			RegWrite <= 0;
			MemToReg <= 0;
			MemRead <= 0;
			MemWrite <= 0;
			Branch <= 0;
			RegDst <= 0;
			ALUOp <= 4'b0000;
			ALUSrc <= 0;
		end
		
	end
end	
	
endmodule
