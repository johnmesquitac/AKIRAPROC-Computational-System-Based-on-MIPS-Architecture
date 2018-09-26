module MUX3(aluResult,readMemoria,saidaMUX3,memToReg);

input [31:0] aluResult,readMemoria;
input memToReg;

output reg[31:0] saidaMUX3;

always @(*) begin
	
		case(memToReg)
				1'b0: saidaMUX3 = aluResult;
				1'b1: saidaMUX3 = readMemoria;
		endcase
end

endmodule