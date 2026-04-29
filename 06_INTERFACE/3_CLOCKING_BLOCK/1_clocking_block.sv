interface signals(input bit clock);
  logic d,reset;
  logic q;
  clocking clk @(posedge clock);
     // Inputs are sampled BEFORE the clock event 
    // Outputs are driven AFTER the clock event 
    default input #5step output #3;  
    output  d,reset; // driven 3 time units AFTER posedge
    input q;  // sampled 5 time units BEFORE posedge
  endclocking
endinterface

module dff(signals inf);
  always @(posedge inf.clock)
    begin
      if(inf.reset)
        inf.q <= 0;
      else
        inf.q <= inf.d;
    end
endmodule

module tb;
  bit clock;
  initial clock =0;
  signals inf(.clock(clock));
  dff dut(inf);
  always #5 clock = ~clock;
  initial begin
    $dumpfile("clocking.vcd");
    $dumpvars(0);
    $monitor("time=%0t clock=%b reset=%b d=%b q=%b",$time,clock,inf.reset,inf.d,inf.q);
    inf.clk.reset <=1; inf.clk.d <=0;
    #10;
    inf.clk.reset <=0; inf.clk.d <=1;
    #10;
    inf.clk.d<=1;
    #10;
    inf.clk.d<=0;
    #10 $finish;
  end
endmodule

/*
OUTPUT
time=0 clock=0 reset=x d=x q=x
time=5 clock=1 reset=x d=x q=x
time=8 clock=1 reset=1 d=0 q=x
time=10 clock=0 reset=1 d=0 q=x
time=15 clock=1 reset=1 d=0 q=0
time=18 clock=1 reset=0 d=1 q=0
time=20 clock=0 reset=0 d=1 q=0
time=25 clock=1 reset=0 d=1 q=1
time=30 clock=0 reset=0 d=1 q=1
time=35 clock=1 reset=0 d=1 q=1
time=38 clock=1 reset=0 d=0 q=1
*/
