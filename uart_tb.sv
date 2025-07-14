`timescale 1us/1us
`include "uart_module.sv"
module tb();
   logic u1_s0, u1_s1, u1_run;
   logic [7:0] u1_din;
   logic u1_done, u1_err;
   logic [7:0] u1_dout;

   logic u2_s0, u2_s1, u2_run;
   logic [7:0] u2_din;
   logic u2_done, u2_err;
   logic [7:0] u2_dout;

   wire w1, w2;

   uart_module u1( 
        .s0(u1_s0),
        .s1(u1_s1),
        .run(u1_run),
        .din(u1_din),
        .dout(u1_dout),
        .tx(w1),
        .rx(w2),
        .done(u1_done),
        .err(u1_err)
   );

   uart_module u2( 
        .s0(u2_s0),
        .s1(u2_s1),
        .run(u2_run),
        .din(u2_din),
        .dout(u2_dout),
        .tx(w2),
        .rx(w1),
        .done(u2_done),
        .err(u2_err)
   );
		
   initial begin 
     
     $dumpfile("uart_waveform.vcd");
     $dumpvars(0, tb);
      u1_s1 = 0; u1_s0 = 1; u1_run = 0; u1_din = 8'd120;
      u2_s1 = 0; u2_s0 = 1; u2_run = 0; u2_din = 8'd240;
      #(4*52);
      u1_run = 1; u2_run = 1;
      #(15*52*2);
      u1_s1 = 0; u1_s0 = 1; u1_run = 0; u1_din = 8'd22;
      u2_s1 = 0; u2_s0 = 1; u2_run = 0; u2_din = 8'd44;
      #(4*52);
      u1_run = 1; u2_run = 1;
      #(15*52*2);
      $finish();
   end

endmodule  

