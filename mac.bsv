package mac;
  
  function Bit#(32) fn_mac( Bit#(8) a, Bit#(8) b, Bit#(32) c);
    return zeroExtend(a*b) + c;
  endfunction
 
  (*synthesize*)
  module mkMac( Empty );
    
    Reg#(Bit#(8)) a <- mkReg(1);
    Reg#(Bit#(8)) b <- mkReg(3);
    Reg#(Bit#(32)) c <- mkReg(0);
    
    Reg#(int) mac <- mkReg(?);

    Reg#(int) cycle <- mkReg(0);
    
    rule rl_cycle( cycle  < 5 );
      cycle <= cycle + 1 ;
    endrule 

    rule rl_mac;
      mac <= unpack(fn_mac(a,b,c));     
    endrule

    rule rl_print_mac;
      $display( "%d  : Mac - %d", cycle , mac);
    endrule

    rule rl_finish( cycle == 5 );
      $finish(0);
    endrule 

         

  endmodule


endpackage
