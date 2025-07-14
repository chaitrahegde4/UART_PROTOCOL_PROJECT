// Selection of clk generator to MUX 
//design
module baud_generator(s0,s1);
    input s0,s1;
    bit clk_in;
    int tp;
    always #(tp/2) clk_in=~clk_in;
    assign tp=s1?(s0?(26):(52)):(s0?(104):(208));
endmodule 

// s0 s1
// 0  0   4800   208
// 0  1   9600   104
// 1  0   19200   52
// 1  1   38400   26


//testbench

`timescale 1us/1us
module tb();
  logic s0,s1;
  baud_generator uut (s0, s1);
  initial 
    begin
          s0 = 0; s1 = 0;
      #10 s0 = 0; s1 = 1;
      #10 s0 = 1; s1 = 0;
      #10 s0 = 1; s1 = 1;
      $dumpfile("waveform.vcd");
      $dumpvars(0, tb);
      #1000; $finish();
    end
endmodule
