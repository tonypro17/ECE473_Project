


// file control.v


module control(
	input wire [5:0] opcode,
	input wire [5:0] funct,
	input wire [4:0] rs,					//-IAN- added rs and rd inputs for jump instruction forwarding
	input wire [4:0] previous_rd,
	input wire clock,
	
	output reg RegWrite,
	output reg MemToReg,
	output reg MemRead,
	output reg MemWrite,
	output reg Branch,
	output reg RegDst,
	output reg [3:0] ALUOp,
	output reg ALUSrc,
	output reg [1:0] Jump,
	output reg J_Jump,
	output reg [2:0] Branch_op);			//-IAN- changed to 2 bit line to accompany jump With forwarding
	
	initial begin
		RegWrite = 0;
		MemToReg = 0;
		MemRead = 0;
		MemWrite = 0;
		Branch = 0;
		RegDst = 0;
		ALUOp = 4'b0000;
		ALUSrc = 0;
		Jump = 2'b00;
		J_Jump = 0;
		Branch_op = 3'b000;
	end
	
	always @(negedge clock) begin
		RegWrite <= 0;
		MemToReg <= 0;
		MemRead <= 0;
		MemWrite <= 0;
		Branch <= 0;
		RegDst <= 0;
		ALUOp <= 4'b0000;
		ALUSrc <= 0;
		Branch_op <= 3'b000;
		// check opcode
		if (opcode == 6'b000000) begin 				//			opcode = 0 means R-CODE instruction
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
			Branch_op <= 3'b001;
			Branch <= 1;
		end else if (opcode == 6'b000101) begin // tony: 000101 = bne
			Branch_op <= 3'b010;
			Branch <= 1;
		end else if (opcode == 6'b000111) begin // tony: 000111 = bgtz	
			Branch_op <= 3'b011;
			Branch <= 1;
		end else if (opcode == 6'b000001) begin // tony: 000001 = bgez
			Branch_op <= 3'b100;
			Branch <= 1;
		end else if (opcode == 6'b100011) begin // tony: 100011 = lw
			ALUOp <= 4'b0001;
			ALUSrc <= 1;
			RegWrite <= 1;
			RegDst <= 1;
			MemRead <= 1;
			MemToReg <= 1;
		end else if (opcode == 6'b101011) begin // tony: 101011 = sw
			ALUOp <= 4'b0001;
			ALUSrc <= 1;
			MemWrite <= 1;
		end else if (opcode == 6'b001111) begin // tony: 001111 = lui
			ALUOp <= 4'b1111;
			ALUSrc <= 1;
			RegWrite <= 1;
			RegDst <= 1;
		end
	end
		
	always @* begin
		Jump <= 2'b00;
		J_Jump <= 0;
		if (opcode == 6'b000000 && funct == 6'b001000) begin //-tony-	funct = 001000 means JR instruction
			Jump <=2'b01;
		end else if (opcode == 6'b000011) begin //-IAN- 000011 = jal 
			Jump <= 2'b11; 							 //-IAN- jump with link
			J_Jump <= 1;
		end else if (opcode == 6'b000010) begin // tony: 000010 = j
			J_Jump <= 1;
		end
	end
endmodule
