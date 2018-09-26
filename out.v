module out(data1,saida,flag);

input[31:0] data1;
reg [31:0] aux;
input flag;
output reg [31:0] saida;

always @(*)
begin
if(flag==1)
	
saida=data1;

end 


endmodule