interface signals;
  logic ready,valid,clk;
  logic [3:0] data;
  modport msr(input clk,ready,output data,valid);
  modport sla(input clk,data,valid,output ready);
endinterface

module master(signals.msr m);
  always_ff @(posedge m.clk)
    begin
      m.valid <= 1;
      if(m.ready) begin
       m.data <= $random;
      end
    end
endmodule

module slave(signals.sla s);
  always_ff @(posedge s.clk)
    begin
      s.ready <= $random;
      if(s.valid && s.ready)
        $display("time=%0t valid=%b data recieved = %b",$time,s.valid,s.data);
    end
endmodule

module tb;
  signals i();
  master m(i);
  slave s(i);
  always #5 i.clk =~i.clk;
  initial begin
    i.clk =0;
    #50 $finish;
  end
endmodule

/*
OUTPUT 
time=25 valid=1 data recieved = xxxx
time=35 valid=1 data recieved = 1001
time=45 valid=1 data recieved = 1101
*/
