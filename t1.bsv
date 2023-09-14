import Vector::*;

function Vector#(4, Bit#(8)) get_wr_strobes( Bit#(4) b );
    	  Vector#(8, Bit#(TDiv#(32,8))) strb = replicate( 0 );
	  for(Integer i=0;i<8;i=i+1) begin
            if( b > fromInteger(i) ) begin
		    strb[i] = -1;
	    end
	  end
	  //$display($time, " Word Strobes - ", fshow(strb));
	  Bit#(TMul#(4,8)) bits = pack(strb);
	  Vector#(4, Bit#(8)) v = replicate(?);
	  for(Integer i=0;i<4;i=i+1) begin
          	  v[i] = reverseBits(bits[(i+1)*8-1:i*8]) ;
	  end
	  return v;
endfunction

function Vector#(8, Bit#(4)) get_strobe_bytes(Bit#(4) b );
         Vector#(8, Bit#(4)) strb = replicate( 0 );
	  for(Integer i=0;i<8;i=i+1) begin
            if( b > fromInteger(i) ) begin
		    strb[i] = -1;
	    end
	  end
          return strb;
endfunction

module mkTb(Empty);
  Vector#(4, Reg#(Bit#(8)))  rg <- replicateM( mkReg(?));
  Reg#(int) cycle <- mkReg(0);

  rule rl_cycle; cycle <= cycle + 1 ; endrule

  rule rl_test( cycle == 0);
	  Bit#(4) banks = 8;
	  let v = get_wr_strobes(banks) ;
	  let b = get_strobe_bytes(banks);
          $display($time, " Vector - ", fshow(v) );
 	  $display($time, " Byte strobes - ", fshow(b));
 	  $display($time, " Byte strobes packed- ", fshow(pack(b))); 
  endrule 

  rule rl_fin( cycle > 0 ); $finish(0); endrule 
endmodule
