//clock generator

module clk_gen();
bit clk;
int tp;
always #(tp/2) clk=~clk;
assign tp=104;   
endmodule
