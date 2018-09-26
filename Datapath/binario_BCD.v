module binario_BCD (D_Binary, DATA_BCD);

	input [15:0] D_Binary; //dado escolhido do registrador
	output reg [15:0] DATA_BCD;// saída para os displays (unidade, dezena, centena...)
	
	integer cont;
	reg [31:0] aux;
	
	// Shift and add-3 Algorithm
	
	always @(D_Binary) begin
		
		aux={16'h0000, D_Binary};
		
		for(cont=0; cont < 15; cont=cont + 1) begin
			aux = aux << 1;
			if(aux[19:16] > 4) aux[19:16] = aux[19:16] + 4'b0011;
			if(aux[23:20] > 4) aux[23:20] = aux[23:20] + 4'b0011;
			if(aux[27:24] > 4) aux[27:24] = aux[27:24] + 4'b0011;
			if(aux[31:28] > 4) aux[31:28] = aux[31:28] + 4'b0011;
			
		end
		aux = aux << 1;
		DATA_BCD = aux[31:16];
	end
		
endmodule