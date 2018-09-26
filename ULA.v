//ULA

module ULA(op,data1,data2,result,zero,shamt);

input[31:0] data1,data2;
input [4:0] op,shamt;
output reg[31:0] result;
output zero;
wire[31:0] not_zero,addd,subb;
//wire resultadd,resultsub;
assign addd= data1+data2;
assign subb= data1-data2;
//assign resultadd = (data1[31] == data2[31] && data1[31] != addd[31]) ? 1 : 0;
//assign resultsub = (data1[31] == data2[31] && data1[31] != subb[31]) ? 1 : 0;
assign not_zero = (data2==0)? 1 : data2;


always @ ( op or data1 or data2 or not_zero or shamt) begin
			case (op[4:0])
				5'b00000 : result = data1 + data2; //add
				5'b00001 : result = data1 - data2; //sub
				5'b00010 : result = data1 < data2 ? 1 : 0 ; //slt
				5'b00011 : result= data1[15:0] * data2[15:0]; //mult
				5'b00100 : result= data1 == data2 ? 0 : 1;//beq
				5'b00101 : result= data1 / not_zero; //div
				5'b00110 : result= data1 << shamt; //shl
				5'b00111 : result= data1 >> shamt; //shr
				5'b01000 : result= ~data1; //not
				5'b01001 : result= data1 & data2; //and
				5'b01010 : result= data1 | data2; //or
				5'b01011 : result= data1 ^ data2; //xor
				default : result= 0 ;
			endcase
end
  assign zero = (result==0);
  
endmodule