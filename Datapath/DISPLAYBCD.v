module DISPLAYBCD(entrada, saidaBCD);
	input wire [31:0]entrada;
	output reg[6:0]saidaBCD;
	always@(*)
	
		begin	
			case (entrada)
				
				32'b0: saidaBCD = 7'b0000001; 
				32'b1: saidaBCD = 7'b1001111; 
				32'b10: saidaBCD = 7'b0010010; 
				32'b11: saidaBCD = 7'b0000110; 
				32'b100: saidaBCD = 7'b1001100; 
				32'b101: saidaBCD = 7'b0100100; 
				32'b110: saidaBCD = 7'b0100000; 
				32'b111: saidaBCD = 7'b0001111; 
				32'b1000: saidaBCD = 7'b0000000; 
				32'b1001: saidaBCD = 7'b0000100; 
				
				default: saidaBCD = 7'b1111111; 
		endcase
	end
endmodule
