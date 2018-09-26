module temporizador(clockin, clockout); 

    input clockin; 
	 output wire clockout; 
	 
     
    reg [25:0] count; 

    always@(posedge clockin) 
    begin 
        count <= count + 1; 
    end 
	 
    assign clockout = count[23]; 
endmodule 