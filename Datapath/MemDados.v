//Memoria de Dados

module MemDados(Writedata,address,clock,dataOut,MemWrite);

input [31:0] Writedata,address;
input clock, MemWrite;
output [31:0] dataOut;

reg [31:0] Mem[31:0];

always @ (posedge clock) begin

	if(MemWrite)
			Mem[address]= Writedata;
end

assign dataOut = Mem[address];

endmodule