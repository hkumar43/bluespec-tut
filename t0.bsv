import FIFOF::*;


typedef struct{
  Bool a;
  Bool b;
} Bools;

//module mkTb(Empty);
  
//  Reg#(int) c <- mkReg(0);

//  rule rl_cycle; c <= c + 1; endrule 

//  rule t( c == 0 );
//    Maybe#(Bools) bls = tagged Invalid;
//    $display("Bools values %x, %x", bls.a, bls.b);
//  endrule 

//endmodule

module mkTb1(Empty);

  Ifc_pr p <- mkpr;
  rule rl1;
    let a <- p.get;
  endrule

  rule rl2;
    let b = p.has;
    $display(b);
  endrule  
endmodule

interface Ifc_pr;
  method Bool has;
  method ActionValue#(int) get;
endinterface

module mkpr(Ifc_pr);
  FIFOF#(int) f <- mkFIFOF;
  rule rl_wr;
    f.enq(1);
  endrule

  method ActionValue#(int) get; 
    f.deq;
    return f.first;
  endmethod

  method Bool has = f.notEmpty;  
endmodule
