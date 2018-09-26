module PC(entrada,Pc,clock,reset,halt,zero,brancheq,branchneq,jump);

input clock, reset, halt, jump,branchneq,brancheq, zero;
input [31:0] entrada;
output reg[31:0] Pc;
wire [31:0] proximo,proximoinc;
assign proximo=entrada;
assign proximoinc= entrada+1;

always @ (posedge clock) begin

		 if (branchneq==1 && zero ==1)
						Pc<=proximoinc;
						else if (branchneq==1 && zero == 0)
									Pc<=proximo;
								else if (brancheq==1 && zero == 0)
									Pc<=proximoinc;
										else if (brancheq==1 && zero == 1)
													Pc<=proximo;
												else if (jump)
															Pc<=proximo;
															
												 else if(reset) begin
															Pc = 0;
															end
														else if(halt) begin
														end
																else begin
																Pc<=proximoinc;
															   end

end

endmodule