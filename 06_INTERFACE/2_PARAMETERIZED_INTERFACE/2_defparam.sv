interface counter_inf #(parameter N=2); //interface block
  logic clock,reset;
  logic [N-1:0] q;
endinterface

module up_counter(counter_inf i); //design module
  always @(posedge i.clock or posedge i.reset)
  begin
    if(i.reset )
      i.q <= 0;
    else
      i.q <= i.q+1;
  end
endmodule

module counter_tb;
  counter_inf inf();
  defparam inf.N=4;
  up_counter dut  (inf);
  always #5 inf.clock = ~inf.clock;
  initial begin
    $monitor("time =%0t reset= %b q=%b(%0d)",$time,inf.reset,inf.q,inf.q);
    inf.reset = 1;   inf.clock =0;
    #10 inf.reset =0;
    #20 inf.reset =1;
    #10 inf.reset =0;
    #50 $finish;
  end
endmodule
/*
OUTPUT
# KERNEL: time =0 reset= 1 q=0000(0)
# KERNEL: time =10 reset= 0 q=0000(0)
# KERNEL: time =15 reset= 0 q=0001(1)
# KERNEL: time =25 reset= 0 q=0010(2)
# KERNEL: time =30 reset= 1 q=0000(0)
# KERNEL: time =40 reset= 0 q=0000(0)
# KERNEL: time =45 reset= 0 q=0001(1)
# KERNEL: time =55 reset= 0 q=0010(2)
# KERNEL: time =65 reset= 0 q=0011(3)
# KERNEL: time =75 reset= 0 q=0100(4)
# KERNEL: time =85 reset= 0 q=0101(5)
*/
