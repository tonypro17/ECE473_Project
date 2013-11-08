


// file control.v


module control(
	input wire [5:0] opcode,
	input wire [5:0] funct,
	
	output reg [1:0] ALUOp,
	output reg ALUSrc,
	output reg RegWrite,
	output reg RegDst,
	output reg MemRead,
	output reg MemWrite,
	output reg MemToReg,
	output reg Branch);
	
	always @* begin
	
		// check opcode
		if (opcode == 6'b000000) begin 				//			opcode = 0 means R-CODE instruction
		
			// check function code
			if (funct == 6'b100000) begin 			//			funct = 100000 means ADD instruction
				ALUOp <= 2'b01;
				ALUSrc <= 0;
				RegWrite <= 1;
				RegDst <= 0;
				MemRead <= 0;
				MemWrite <= 0;
				MemToReg <= 0;
				Branch <= 0;
			end else if (funct == 6'b000000) begin	// 		funct = 000000 means NOP/SLL instruction
				ALUOp <= 2'b00;
				ALUSrc <= 0;
				RegWrite <= 0;
				RegDst <= 0;
				MemRead <= 0;
				MemWrite <= 0;
				MemToReg <= 0;
				Branch <= 0;
			end else if (funct == 6'b100010) begin	// -IAN-	funct = 100010 means SUB intstruction
				ALUOp <= 2'b10;
				ALUSrc <= 0;
				RegWrite <= 1;
				RegDst <= 0;
				MemRead <= 0;
				MemWrite <= 0;
				MemToReg <= 0;
				Branch <= 0;			
			end else if (funct == 6'b100100) begin	// -IAN-	funct = 1001000 means AND instruction
				ALUOp <= 2'b11;
				ALUSrc <= 0;
				RegWrite <= 1;
				RegDst <= 0;
				MemRead <= 0;
				MemWrite <= 0;
				MemToReg <= 0;
				Branch <= 0;		
		end else begin
			ALUOp <= 2'b00;
			ALUSrc <= 0;
			RegWrite <= 0;
			RegDst <= 0;
			MemRead <= 0;
			MemWrite <= 0;
			MemToReg <= 0;
			Branch <= 0;
		end
		
	end
end	
	
endmodule
