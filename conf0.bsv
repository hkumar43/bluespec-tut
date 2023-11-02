
package conf0;

import ConfigReg::*;

  module mkConf0( Empty );
  
    Reg#(int) cycle <- mkReg(0);

    rule rl_cycle ; cycle <= cycle + 1 ; endrule
    
    ConfigReg#(int) a <- mkConfigReg(0);
    ConfigReg#(int) b <- mkConfigReg(1);

    //(* descending_urgency = "rl_wr_b , rl_wr_a" *) 
    rule rl_wr_a( cycle <= 5 );
      a <= b + 1;
    endrule    

    rule rl_wr_b( cycle <= 5);
      b <= a + 1;
    endrule

    rule rl_print( cycle <= 5);
      $display("a = %d , b = %d", a, b);
    endrule

    rule rl_finish( cycle > 5 );
      $finish(0);
    endrule



  endmodule 

endpackage
