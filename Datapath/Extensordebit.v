module Extensordebit(entrada,saida16);

input [15:0] entrada;
output reg [31:0] saida16;

always @(*) begin

	if(entrada[15] == 1'b1) // caso o bit mais significativo do dado for 1 isso quer dizer que é um número negativo
		saida16= {{16{1'b1}}, entrada};
	else 
		saida16 = {{16{1'b0}}, entrada};
end

endmodule