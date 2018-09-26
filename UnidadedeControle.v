module UnidadedeControle(WriteMark,RegDest,AluSrce,checkin,AluOp,MemWrite,MemReg,beq,bne,AluSelec,jmp,hlt,rst,opcode,flag,flagIN);
input [5:0] opcode;
input checkin;
output reg hlt,jmp,rst,beq,bne,flag,flagIN;
output reg RegDest;
output reg WriteMark;
output reg AluSrce;
output reg[4:0]AluOp;
output reg[1:0] AluSelec;
output reg MemReg;
output reg MemWrite;
always @(opcode or checkin) begin

		case(opcode[5:0] )
			 6'b000000: begin //add
				WriteMark = 1'b1;
				AluSrce = 1'b0;
				AluOp = 5'b00000;
				AluSelec= 2'b10;
				MemReg= 1'b0;
				RegDest= 1'b1;
				MemWrite= 1'b0;
				beq= 1'b0;
				bne= 1'b0;
				jmp= 1'b0;
				hlt= 1'b0;
				rst= 1'b0;
				flag=1'b0;
				flagIN=1'b0;
				end
			6'b000001: begin //sub
				WriteMark = 1'b1;
				AluSrce = 1'b0;
				AluOp = 5'b00001;
				AluSelec= 2'b10;
				MemReg= 1'b0;
				RegDest= 1'b1;
				MemWrite= 1'b0;
				beq= 1'b0;
				bne= 1'b0;
				jmp= 1'b0;
				hlt= 1'b0;
				rst= 1'b0;
				flag=1'b0;
				flagIN=1'b0;
				end
			6'b000010: begin //addi
				WriteMark = 1'b1;
				AluSrce = 1'b1;
				AluOp = 5'b00000;
				AluSelec= 2'b10;
				MemReg= 1'b0;
				RegDest= 1'b0;
				MemWrite= 1'b0;
				beq= 1'b0;
				bne= 1'b0;
				jmp= 1'b0;
				hlt= 1'b0;
				rst= 1'b0;
				flag=1'b0;
				flagIN=1'b0;
				end
			6'b000011: begin //subi
				WriteMark = 1'b1;
				AluSrce = 1'b1;
				AluOp = 5'b00001;
				AluSelec= 2'b10;
				MemReg= 1'b0;
				RegDest= 1'b0;
				MemWrite= 1'b0;
				beq= 1'b0;
				bne= 1'b0;
				jmp= 1'b0;
				hlt= 1'b0;
				rst= 1'b0;
				flag=1'b0;
				flagIN=1'b0;
				end
			6'b000100: begin //mult
				WriteMark = 1'b1;
				AluSrce = 1'b0;
				AluOp = 5'b00011;
				AluSelec= 2'b10;
				MemReg= 1'b0;
				RegDest= 1'b1;
				MemWrite= 1'b0;
				beq= 1'b0;
				bne= 1'b0;
				jmp= 1'b0;
				hlt= 1'b0;
				rst= 1'b0;
				flag=1'b0;
				flagIN=1'b0;
				end
			6'b000101: begin //div
				WriteMark = 1'b1;
				AluSrce = 1'b0;
				AluOp = 5'b00101;
				AluSelec= 2'b10;
				MemReg= 1'b0;
				RegDest= 1'b1;
				MemWrite= 1'b0;
				beq= 1'b0;
				bne= 1'b0;
				jmp= 1'b0;
				hlt= 1'b0;
				rst= 1'b0;
				flag=1'b0;
				flagIN=1'b0;
				end
			6'b000110: begin //slt
				WriteMark = 1'b1;
				AluSrce = 1'b0;
				AluOp = 5'b000010;
				AluSelec= 2'b10;
				MemReg= 1'b0;
				RegDest= 1'b1;
				MemWrite= 1'b0;
				beq= 1'b0;
				bne= 1'b0;
				jmp= 1'b0;
				hlt= 1'b0;
				rst= 1'b0;
				flag=1'b0;
				flagIN=1'b0;
				end
			6'b000111: begin //NOT
				WriteMark = 1'b1;
				AluSrce = 1'b0;
				AluOp = 5'b01000;
				AluSelec= 2'b10;
				MemReg= 1'b0;
				RegDest= 1'b1;
				MemWrite= 1'b0;
				beq= 1'b0;
				bne= 1'b0;
				jmp= 1'b0;
				hlt= 1'b0;
				rst= 1'b0;
				flagIN=1'b0;
				end
			6'b001000: begin //AND
				WriteMark = 1'b1;
				AluSrce = 1'b0;
				AluOp = 5'b01001;
				AluSelec= 2'b10;
				MemReg= 1'b0;
				RegDest= 1'b1;
				MemWrite= 1'b0;
				beq= 1'b0;
				bne= 1'b0;
				jmp= 1'b0;
				hlt= 1'b0;
				rst= 1'b0;
				flag= 1'b0;
				flagIN=1'b0;
				end
			6'b001001: begin //OR
				WriteMark = 1'b1;
				AluSrce = 1'b0;
				AluOp = 5'b01010;
				AluSelec= 2'b10;
				MemReg= 1'b0;
				RegDest= 1'b1;
				MemWrite= 1'b0;
				beq= 1'b0;
				bne= 1'b0;
				jmp= 1'b0;
				hlt= 1'b0;
				rst= 1'b0;
				flag= 1'b0;
				flagIN=1'b0;
				end
			6'b001010: begin //xor
				RegDest = 1'b1;
				WriteMark = 1'b1;
				AluSrce = 1'b0;
				AluOp = 5'b01011;
				AluSelec= 2'b10;
				MemReg= 1'b0;
				RegDest= 1'b1;
				MemWrite= 1'b0;
				beq= 1'b0;
				bne= 1'b0;
				jmp= 1'b0;
				hlt= 1'b0;
				rst= 1'b0;
				flag= 1'b0;
				flagIN=1'b0;
				end
			6'b001011: begin //lw
				WriteMark = 1'b1;
				AluSrce = 1'b1;
				AluOp = 5'b00000;
				AluSelec= 2'b10;
				MemReg= 1'b1;
				RegDest= 1'b0;
				MemWrite= 1'b0;
				beq= 1'b0;
				bne= 1'b0;
				jmp= 1'b0;
				hlt= 1'b0;
				rst= 1'b0;
				flag=1'b0;
				flagIN=1'b0;
				end
			6'b001100: begin//ldi
				WriteMark = 1'b1;
				AluSrce = 1'b1;
				AluOp = 5'b00000;
				AluSelec= 2'b10;
				MemReg= 1'b0;
				RegDest= 1'b0;
				MemWrite= 1'b0;
				beq= 1'b0;
				bne= 1'b0;
				jmp= 1'b0;
				hlt= 1'b0;
				rst= 1'b0;
				flag=1'b0;
				flagIN=1'b0;
				end
			6'b001101: begin //sw
				WriteMark = 1'b0;
				AluSrce = 1'b1;
				AluOp = 5'b00000;
				AluSelec= 2'b10;
				MemReg= 1'b0;
				RegDest= 1'b0;
				MemWrite= 1'b1;
				beq= 1'b0;
				bne= 1'b0;
				jmp= 1'b0;
				hlt= 1'b0;
				rst= 1'b0;
				flag=0;
				flagIN=1'b0;
				end
			6'b001110: begin //beq (parei aqui)
				WriteMark = 1'b0;
				AluSrce = 1'b0;
				AluOp = 5'b00100;
				AluSelec= 2'b00;
				MemReg= 1'b0;
				RegDest= 1'b0;
				MemWrite= 1'b0;
				beq= 1'b1;
				bne= 1'b0;
				jmp= 1'b0;
				hlt= 1'b0;
				rst= 1'b0;
				flag=1'b0;
				flagIN=1'b0;
				end
			6'b001111: begin //bne
				WriteMark = 1'b0;
				AluSrce = 1'b0;
				AluOp = 5'b00100;
				AluSelec= 2'b00;
				MemReg= 1'b0;
				RegDest= 1'b0;
				MemWrite= 1'b0;
				beq= 1'b0;
				bne= 1'b1;
				jmp= 1'b0;
				hlt= 1'b0;
				rst= 1'b0;
				flag=1'b0;
				flagIN=1'b0;
				end
			6'b010000: begin //jmp
				WriteMark = 1'b0;
				AluSrce = 1'b0;
				AluOp = 5'b00000;
				AluSelec= 2'b01;
				MemReg= 1'b0;
				RegDest= 1'b0;
				MemWrite= 1'b0;
				beq= 1'b0;
				bne= 1'b0;
				jmp= 1'b1;
				hlt= 1'b0;
				rst= 1'b0;
				flag=1'b0;
				flagIN=1'b0;
				end
			6'b010001: begin //jmpr
				WriteMark = 1'b0;
				AluSrce = 1'b0;
				AluOp = 5'b00000;
				AluSelec= 2'b11;
				MemReg= 1'b0;
				RegDest= 1'b0;
				MemWrite= 1'b0;
				beq= 1'b0;
				bne= 1'b0;
				jmp= 1'b1;
				hlt= 1'b0;
				rst= 1'b0;
				flag=1'b0;
				flagIN=1'b0;
				end
			6'b010010: begin //NOP
				WriteMark = 1'b0;
				AluSrce = 1'b0;
				AluOp = 5'b00000;
				AluSelec= 2'b10;
				MemReg= 1'b0;
				RegDest= 1'b0;
				MemWrite= 1'b0;
				beq= 1'b0;
				bne= 1'b0;
				jmp= 1'b0;
				hlt= 1'b0;
				rst= 1'b0;
				flag= 1'b1;
				flagIN=1'b0;
				end
			6'b010011: begin //HALT
				WriteMark = 1'b0;
				AluSrce = 1'b0;
				AluOp = 5'b00000;
				AluSelec= 2'b10;
				MemReg= 1'b0;
				RegDest= 1'b0;
				MemWrite= 1'b0;
				beq= 1'b0;
				bne= 1'b0;
				jmp= 1'b0;
				hlt= 1'b1;
				rst= 1'b0;
				flag= 1'b0;
				flagIN=1'b0;
				end
			6'b010100: begin//IN
			if(checkin==1)
			begin
				WriteMark = 1'b1;
				AluSrce = 1'b1;
				AluOp = 5'b00000;
				AluSelec= 2'b10;
				MemReg= 1'b0;
				RegDest= 1'b1;
				MemWrite= 1'b0;
				beq= 1'b0;
				bne= 1'b0;
				jmp= 1'b0;
				hlt= 1'b0;
				rst= 1'b0;
				flag= 1'b0;
				flagIN=1'b1;
			end
			else if(checkin==0)
			begin
				WriteMark = 1'b1;
				AluSrce = 1'b1;
				AluOp = 5'b00000;
				AluSelec= 2'b10;
				MemReg= 1'b0;
				RegDest= 1'b1;
				MemWrite= 1'b0;
				beq= 1'b0;
				bne= 1'b0;
				jmp= 1'b0;
				hlt= 1'b1;
				rst= 1'b0;
				flag= 1'b0;
				flagIN=1'b1;
			end
				end
			6'b010101: begin //OUT
				WriteMark = 1'b0;
				AluSrce = 1'b0;
				AluOp = 5'b01011;
				AluSelec= 2'b10;
				MemReg= 1'b0;
				RegDest= 1'b1;
				MemWrite= 1'b0;
				beq= 1'b0;
				bne= 1'b0;
				jmp= 1'b0;
				hlt= 1'b0;
				rst= 1'b0;
				flag= 1'b1;
				flagIN=1'b0;
				end
			6'b010110: begin //MOVE
				WriteMark = 1'b1;
				AluSrce = 1'b0;
				AluOp = 5'b00000;
				AluSelec= 2'b10;
				MemReg= 1'b0;
				RegDest= 1'b1;
				MemWrite= 1'b0;
				beq= 1'b0;
				bne= 1'b0;
				jmp= 1'b0;
				hlt= 1'b0;
				rst= 1'b0;
				flag= 1'b0;
				flagIN=1'b0;
				end
			6'b010111: begin //SHL
				WriteMark = 1'b1;
				AluSrce = 1'b0;
				AluOp = 5'b00110;
				AluSelec= 2'b10;
				MemReg= 1'b0;
				RegDest= 1'b1;
				MemWrite= 1'b0;
				beq= 1'b0;
				bne= 1'b0;
				jmp= 1'b0;
				hlt= 1'b0;
				rst= 1'b0;
				flag= 1'b0;
				flagIN=1'b0;
				end
			6'b011000: begin //SHR
				WriteMark = 1'b1;
				AluSrce = 1'b0;
				AluOp = 5'b00111;
				AluSelec= 2'b10;
				MemReg= 1'b0;
				RegDest= 1'b1;
				MemWrite= 1'b0;
				beq= 1'b0;
				bne= 1'b0;
				jmp= 1'b0;
				hlt= 1'b0;
				rst= 1'b0;
				flag= 1'b0;
				flagIN=1'b0;
				end
			default:
			begin
				WriteMark = 1'b0;
				AluSrce = 1'b0;
				AluOp = 5'b00000;
				AluSelec= 2'b00;
				MemReg= 1'b0;
				RegDest= 1'b0;
				MemWrite= 1'b0;
				beq= 1'b0;
				bne= 1'b0;
				jmp= 1'b0;
				hlt= 1'b0;
				rst= 1'b0;
				flag= 1'b0;
				flagIN=1'b0;
			end

endcase
end
endmodule				
				
		