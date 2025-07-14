//parity generator

module parity_gen();
  reg[70] data;
  bit even_parity=0;
  initial 
    begin
      data=8'd1001_1001;
      even_parity=^(data);
      $display(even_parity=%0b,even_parity);
      #10; $finish();
    end
endmodule
