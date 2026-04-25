task automatic count(input logic[7:0] data , output int ones ,zeros);
  ones=0; zeros=0;
  for(int i=0; i<$bits(data); i++)
    begin
      if(data[i])
        ones ++;
      else zeros++;
    end
endtask
module task_1;
  logic [7:0] a;
  int ones,zeros;
  initial begin
    a= $random;
    count(a,ones,zeros);
    $display("In module task_1");
    $display("a=%b ones=%0d zeros=%0d",a,ones,zeros);
  end
endmodule

module parity;
  logic[7:0] a,ones,z;
  initial begin
    #1;
    a =$random;
    count(a,ones,z);
    $display("In module parity");
    if(ones%2==0) 
      $display("even parity");
    else 
      $display("odd parity");

  end
endmodule
// # KERNEL: In module task_1
// # KERNEL: a=00100100 ones=2 zeros=6
// # KERNEL: In module parity
// # KERNEL: even parity
