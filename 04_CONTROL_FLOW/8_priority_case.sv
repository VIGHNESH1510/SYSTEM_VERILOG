module control_flow;
  byte a=10,b=15;
  initial begin
    $display("priority case with no true case");
    priority case (1)
      (a < 20): $display("case 1");
      (a < b): $display("case 2");
      (a != b): $display("case 3");
    endcase
  end
endmodule 
/*
OUTPUT
priority case with no true case
case 1
*/

module control_flow;
  byte a=2;
  initial begin
    $display("priority case with no true case");
    priority case(a)
      0: $display("value 0");
      1: $display("value 1");
      3: $display("value 3");
    endcase
  end
endmodule
/*
OUTPUT
priority case with no true case
xmsim: *W,NOCOND: Priority case violation:  Every case item expression was false.
*/
