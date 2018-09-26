module Display_BIG (binary, out, R1, R2, R3, R4, clock);

	input [31:0] binary; 
	input out,clock;
	output reg [6:0] R1, R2, R3, R4;
	wire [15:0] aux; 
	wire [6:0] A1, A2, A3, A4;
	
	binario_BCD binario_BCD (binary[15:0], aux);
	

	DISPLAYBCD U1 (aux[15:12], A1);//unidade
	DISPLAYBCD U2 (aux[11:8], A2);//dezena
	DISPLAYBCD U3 (aux[7:4], A3);	//centena
	DISPLAYBCD U4 (aux[3:0], A4);	//mil
	
		always@ (posedge clock)
		begin
		 if(out==1)
			begin
			R1=A1;
			R2=A2;
			R3=A3;
			R4=A4;
			end
		end

endmodule