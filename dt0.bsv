package dt0;
  
  module mkDt0( Empty );
    
    Reg#(int) cycle <- mkReg(0);

    rule rl_cycle ; cycle <= cycle + 1 ; endrule

    Bit#(32) a = -3;
    Bit#(32) b = 5;

    Int#(32) a1 = -3;
    Int#(32) b1 = 5;

    rule rl_exec( cycle  == 0 );
      $display( "Result : ", a1*b1 );
    endrule 

    rule rl_finish( cycle != 0 );
      $finish(0);
    endrule

  endmodule

endpackage
