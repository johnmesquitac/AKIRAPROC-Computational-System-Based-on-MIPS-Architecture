module MUX2(inputRT, inputextensor, saidaMUX2, AluSrc);

input [31:0] inputRT,inputextensor;
input AluSrc;

output reg[31:0] saidaMUX2;

always @(*) begin
	
		case(AluSrc)
				1'b0: saidaMUX2 = inputRT;
				1'b1: saidaMUX2 = inputextensor;
		endcase
end

endmodule