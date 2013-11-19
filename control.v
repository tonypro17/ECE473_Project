


// file control.v


module control(
	input wire [5:0] opcode,
	input wire [5:0] funct,
	input wire [4:0] rs,					//-IAN- added rs and rd inputs for jump instruction forwarding
	input wire [4:0] previous_rd,
	
	output reg RegWrite,
	output reg MemToReg,
	output reg MemRead,
	output reg MemWrite,
	output reg Branch,
	output reg RegDst,
	output reg [3:0] ALUOp,
	output reg ALUSrc,
	output reg [1:0] Jump);			//-IAN- changed to 2 bit line to accompany jump With forwarding
	
	always @* begin
	
		// check opcode
		if (opcode == 6'b000000) begin 				//			opcode = 0 means R-CODE instruction
				RegWrite = 0;
				MemToReg = 0;
				MemRead = 0;
				MemWrite = 0;
				Branch = 0;
				RegDst = 0;
				ALUOp = 4'b0000;
				ALUSrc = 0;
				Jump = 0;
			// check function code
			if (funct == 6'b100000) begin 			//			funct = 100000 means ADD instruction
				RegWrite <= 1;
				ALUOp <= 4'b0001;
			end else if (funct == 6'b100001) begin	//-tony-	funct = 000001 means ADDU instruction
				RegWrite <= 1;
				ALUOp <= 4'b1010;
			end else if (funct == 6'b100010) begin	// -IAN-	funct = 100010 means SUB intstruction
				RegWrite <= 1;
				ALUOp <= 4'b0010;
			end else if (funct == 6'b100011) begin	//-tony-	funct = 100011 means SUBU instruction
				RegWrite <= 1;
				ALUOp <= 4'b1011;
			end else if (funct == 6'b100100) begin	// -IAN-	funct = 1001000 means AND instruction
				RegWrite <= 1;
				ALUOp <= 4'b0011;
			end else if (funct == 6'b100101) begin	//-tony-	funct = 100101 means OR instruction
				RegWrite <= 1;
				ALUOp <= 4'b0100;
			end else if (funct == 6'b100111) begin	//-tony- funct = 100111 means NOR instruction
				RegWrite <= 1;
				ALUOp <= 4'b0101;
			end else if (funct == 6'b101010) begin	//-tony-	funct = 101010 means SLT instruction
				RegWrite <= 1;
				ALUOp <= 4'b0110;
			end else if (funct == 6'b000000) begin	//-tony-	funct = 000000 means NOP/SLL instruction
				RegWrite <= 1;
				ALUOp <= 4'b0111;
			end else if (funct == 6'b000010) begin	//-tony-	funct = 000010 means SRL instruction
				RegWrite <= 1;
				ALUOp <= 4'b1000;
			end else if (funct == 6'b000011) begin	//-tony-	funct = 000011 means SRA instruction
				RegWrite <= 1;
				ALUOp <= 4'b1001;
			end else if (funct == 6'b001000) begin	//-tony-	funct = 001000 means JR instruction
				if (rs==previous_rd) begin
					Jump <=2'b10;							//-IAN- jump with forwarding
				end else begin
					Jump <=2'b01;					//-IAN- jump with NO forwarding
				end
			end
			
		end else if (opcode == 6'b001100) begin // tony: 001100 = andi
			ALUSrc <= 1;
			ALUOp <= 4'b0011;
			RegWrite <= 1;
			RegDst <= 1;
		end else if (opcode == 6'b001101) begin // tony: 001101 = ori
			ALUSrc <= 1;
			ALUOp <= 4'b0100;
			RegWrite <= 1;
			RegDst <= 1;
		end else if (opcode == 6'b001010) begin // tony: 001010 = slti
			ALUSrc <= 1;
			ALUOp <= 4'b0110;
			RegWrite <= 1;
			RegDst <= 1;
		end else if (opcode == 6'b001000) begin // tony: 001000 = addi
			ALUSrc <= 1;
			ALUOp <= 4'b0001;
			RegWrite <= 1;
			RegDst <= 1;
		end else if (opcode == 6'b001001) begin // tony: 001001 = addiu
			ALUSrc <=1;
			ALUOp <= 4'b1010;
			RegWrite <= 1;
			RegDst <= 1;
		end else if (opcode == 6'b000100) begin // tony: 000100 = beq
			ALUOp <= 4'b0010; //tony: send subtract operation to alu
			Branch <= 1;
		end else if (opcode == 6'b000101) begin // tony: 000101 = bne
			ALUOp <= 4'b1110;
			Branch <= 1;
		end else if (opcode == 6'b000111) begin // tony: 000111 = bgtz	
			ALUOp <= 4'b1100;
			Branch <= 1;
		end else if (opcode == 6'b000001) begin // tony: 000001 = bgez
			ALUOp <= 4'b1101;
			Branch <= 1;
		end else if (opcode == 6'b100011) begin // tony: 100011 = lw
		
		end else if (opcode == 6'b101011) begin // tony: 101011 = sw
		
		end else if (opcode == 6'b001111) begin // tony: 001111 = lui
		
		end
	end
	
	
/*

			//check opcode
			if( opcode == 6'b       ) begin 
				RegWrite = 0;
				MemToReg = 0;
				MemRead = 0;
				MemWrite = 0;
				Branch = 0;
				RegDst = 0;
				ALUOp = 4'b0000;
				ALUSrc = 0;
				Jump = 0;
			
			// check function code
			if(funct == 6'b001100) begin 				//-IAN- andi function
			end else if (funct == 6'b001101)					//-IAN- ori function
			end else if (funct == 6'b001010)					//-IAN- slti
			end else if (funct == 6'b001000)					//-IAN- addi
			end else if (funct == 6'b001001)					//-IAN- addiu
			end else if (funct == 6'b000100)					//-IAN- beq
			end else if (funct == 6'b000101)					//-IAN- bne
			end else if (funct == 6'b000111)					//-IAN- bgtz
			end else if (funct == 6'b000001)					//-IAN- bgez
			end else if (funct == 6'b100011)					//-IAN- lw
			end else if (funct == 6'b101011)					//-IAN- sw
			end else if (funct == 6'b001111)					//-IAN- lui


			end else if (funct == 6'b000010)					//-IAN- j
			end else if (funct == 6'b000011)					//-IAN- jal
			
end



*/

		
endmodule
