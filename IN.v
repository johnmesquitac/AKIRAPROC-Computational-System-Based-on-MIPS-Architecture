module IN(entrada,saida);

input[15:0] entrada;
output reg[15:0] saida;

always@(*) begin


	saida = {entrada};
	
end 
endmodule 