//parity detection 

module parity_detector();
  reg[7:0] data;
  bit even_parity;
  bit rx_parity;
  bit err;

  initial 
    begin
      data=8'b1001_1001;
      even_parity=^data;
      rx_parity=0; 
      
      err=(rx_parity ^ even_parity);
      $display("err=%0b",err);
      
      if(rx_parity == even_parity)
         $display("no error");
      else
         $display("error is present");
      #10; $finish();
    end
endmodule
