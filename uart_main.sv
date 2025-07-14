//main_uart 

module uart(tx, rx, run, din, dout, clk_in, err, done);
   input clk_in;
   input rx;
   input run;
   input [7:0] din;

   output reg [7:0] dout = 'dz;
   output reg tx = 1;
   output reg done = 0;
   output reg err = 0;

   bit [7:0] tx_reg = 0;  
   bit [7:0] rx_reg = 0;
   bit tx_parity_bit = 0;
   bit start_bit = 0;
   bit stop_bit = 1;
   bit [3:0] ptr = 0;
   
   always @(posedge clk_in) begin 
     if (run == 0) begin 
       tx_reg = din;
       tx_parity_bit = (^tx_reg);
       dout = 'dz;
       err = 0;
       done = 0;
     end 
     else if ((run == 1) && (!done)) begin
       uart_operation();
       ptr++;
     end 	
   end 

   function void uart_operation();
     case (ptr) 
       0: begin 
         tx = start_bit;
       end
       1: begin 
         tx = tx_reg[0]; 
       end
       2: begin 
         tx = tx_reg[1];
         rx_reg[0] = rx;
       end 
       3: begin 
         tx = tx_reg[2];
         rx_reg[1] = rx; 
       end
       4: begin 
         tx = tx_reg[3];
         rx_reg[2] = rx; 
       end
       5: begin 
         tx = tx_reg[4];
         rx_reg[3] = rx; 
       end
       6: begin 
         tx = tx_reg[5];
         rx_reg[4] = rx; 
       end
       7: begin 
         tx = tx_reg[6];
         rx_reg[5] = rx; 
       end
       8: begin 
         tx = tx_reg[7];
         rx_reg[6] = rx; 
       end
       9: begin 
         tx = tx_parity_bit;
         rx_reg[7] = rx; 
       end
       10: begin 
         tx = stop_bit;
         check_rx_parity();
         done = 1;
         dout = rx_reg;
       end 
       default: tx = 1;
     endcase 
   endfunction	 
   
   function void check_rx_parity();
     if (rx == (^rx_reg)) begin 
       err = 0;
       $display("no error during transmission");
       $display("rx_reg = %0d %b parity bit %b\n", rx_reg, rx_reg, rx);
     end 
     else begin 
       err = 1;
       $display("error during transmission");
       $display("rx_reg = %0d %b parity bit %b\n", rx_reg, rx_reg, rx);
     end 
   endfunction 

endmodule
