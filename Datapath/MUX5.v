module MUX5(inputIN, inputbanco, saidaMUX5, flagIN);

input [15:0] inputIN,inputbanco;
input flagIN;

output reg[15:0] saidaMUX5;

always @(*) begin
	
		case(flagIN)
				1'b0: saidaMUX5 = inputbanco;
				1'b1: saidaMUX5 = inputIN;
		endcase
end

endmodule