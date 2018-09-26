module Extensordebit26(entrada,saida26);

input [25:0] entrada;
output reg [31:0] saida26;

always @(*) begin

		saida26 = {{6{1'b0}}, entrada};
end

endmodule