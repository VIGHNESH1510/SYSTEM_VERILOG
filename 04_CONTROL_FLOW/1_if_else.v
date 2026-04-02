module control_flow;
  byte a=10,b=15;
  initial begin
    $display("if else ladder");
    if(a<20)
      $display("condition 1");
    else if(a<b)
      $display("condition 2");
    else if(a != b)
      $display("condition 3");
    else
      $display("else condition");
  end
endmodule
/*
OUTPUT
if else ladder
condition 1
*/
