module Processador(clkk,reset,D1,D2,D3,D4,D11,D22,D33,D44,D333,D444,entradaIN,addressOut,OutMux,checkin);

input wire reset,checkin;
input wire clkk;
wire clk;
wire Regdst,WM,AluSrce,MemReg,beq,jmp,rst,zero,hlt,bne,MW;
wire[31:0] Instruction;
wire [1:0]AluSelec;
wire [4:0]AluOp;
output wire [31:0]addressOut;
wire[31:0]Extend26_32;
wire[31:0]Extend16_32;
wire [31:0]AluOut;
wire [31:0]data1;
wire [31:0]data2;
output wire [31:0]OutMux;
wire[31:0]DataWrite;
wire[4:0] RegBankInput;
wire[31:0]AluInput,DataOut,address;
wire[1:0]AluSelect;
output wire[6:0] D1,D2,D3,D4,D11,D22,D33,D44,D333,D444;
wire flg,ff;
input wire [15:0] entradaIN;
wire [15:0] saidaMuxIn,saidaIN;
wire [16:0] entradaIn;
wire [31:0] saidadisplay;

temporizador temp(.clockin(clkk), .clockout(clk));

UnidadedeControle UC(.opcode(Instruction[31:26]),
.WriteMark(WM),
.AluSrce(AluSrce),
.AluOp(AluOp),
.MemWrite(MW),
.RegDest(Regdst),
.MemReg(MemReg),
.beq(beq),
.bne(bne),
.AluSelec(AluSelec),
.jmp(jmp),
.hlt(hlt),
.rst(rst)
,.flag(flg)
,.flagIN(ff)
,.checkin(checkin));

PC ProgramCounter(.entrada(address),
						.Pc(addressOut),
						.clock(clk),
						.reset(reset),
						.halt(hlt),
						.zero(zero),
						.brancheq(beq),
						.branchneq(bne),
						.jump(jmp));

MemoriadeInstrucoes InstructionMemory(.address(addressOut),
												  .clock(clk),
												  .instruction(Instruction));

MUX1 MuxBankReg(.inputReg1(Instruction[20:16]),
					 .inputReg2(Instruction[15:11]),
					 .saidaMUX1(RegBankInput),
					 .Regdest(Regdst));

					
bancoreg RegisterBank(.Reg1(Instruction[25:21]),
							 .Reg2(Instruction[20:16]),
							 .writeRegister(RegBankInput),
							 .regWrite(OutMux),
							 .clock(clk),
							 .data1(data1), 
							 .data2(data2),
							 .writeMark(WM)); 
							 
Extensordebit26 Extender_26_32(.entrada(Instruction[25:0]),
										 .saida26(Extend26_32));
										 
MUX5 MuxInput(.inputIN(saidaIN), .inputbanco(Instruction[15:0]), .saidaMUX5(saidaMuxIn), .flagIN(ff));

Extensordebit Extender_16_32(.entrada(saidaMuxIn),
									  .saida16(Extend16_32));

MUX2 MuxRegAlu(.inputRT(data2),
					.inputextensor(Extend16_32),
					.saidaMUX2(AluInput),
					.AluSrc(AluSrce));

ULA ArithmeticLogicUnity(.op(AluOp),
								 .data1(data1),
								 .data2(AluInput),
								 .result(AluOut),
								 .zero(zero),
								 .shamt(Instruction[10:6]));

MemDados DataMemory(.Writedata(data2),
						  .address(AluOut),
						  .clock(clk),
						  .dataOut(DataOut),
						  .MemWrite(MW));
						 
MUX3 DataMemOut(.aluResult(AluOut),
					 .readMemoria(DataOut),
					 .saidaMUX3(OutMux),
					 .memToReg(MemReg));

MUX4 MasterMux(.zero(zero),
					.signalExtend(Extend26_32),
					.brancheq(beq),
					.branchneq(bne),
					.sumOut(Extend16_32),
					.regOut(data1),
					.PC(addressOut),
					.PCout(address),
					.control(AluSelec));
					
IN moduloentrada(.entrada(entradaIN),.saida(saidaIN));
ExtensordebitIN ExtensorIN(.entrada(saidaIN),.saida16(saidadisplay),.clock(clk),.reset(reset));

Display_BIG SeteSegmentos(.binary(OutMux),.out(flg),.R1(D1),.R2(D2),.R3(D3),.R4(D4),.clock(clk));

Display_IN seteSeg(.binary(saidadisplay),.R1(D11),.R2(D22), .R3(D33), .R4(D44), .clock(clk));

Display_PC seteSeg2(.binary(addressOut),.R1(D111),.R2(D222), .R3(D333), .R4(D444), .clock(clk));
					
endmodule