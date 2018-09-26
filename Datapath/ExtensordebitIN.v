module ExtensordebitIN(entrada,saida16,reset,clock);

input [15:0] entrada;
input reset,clock;
output reg [31:0] saida16;

always @(posedge clock)
begin
		if(reset==1)
		saida16= 32'b0;
		else
		saida16 = {{16{1'b0}}, entrada};
end

endmodule