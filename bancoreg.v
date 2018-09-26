/*BANCO DE REGISTRADORES*/

module bancoreg(Reg1,Reg2,writeRegister,regWrite,clock,data1,data2,writeMark);

input [31:0] regWrite;
input [4:0] writeRegister,Reg1,Reg2;
input clock,writeMark;
output [31:0] data1,data2;
reg[31:0] REG[31:0];

 // a primeira posiçao nao salva nada pois a cada subida de clock o dado e perdido

always @(posedge clock) begin
 REG[0]=32'b0;
 //REG[5]=32'b1111;
	if(writeMark) // flag para escrita
		REG[writeRegister] = regWrite;
end
//caso contrário irá procurar os dados
	assign data1=REG[Reg1];
	assign data2=REG[Reg2];

endmodule 