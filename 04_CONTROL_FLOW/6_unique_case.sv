module control_flow;
  byte a=10,b=15;
  initial begin
    $display("unique case with mutliple conditions true");
    unique case (1)
      (a < 20): $display("case 1");
      (a < b): $display("case 2");
      (a != b): $display("case 3");
    default: $display("default case");
    endcase
  end
endmodule
/*
OUTPUT
unique case with mutliple conditions true
case 1
xmsim: *W,MCONDE: Unique case violation:  Multiple matching case item expressions at {line=143:pos=9 and line=144:pos=9}.
*/

module control_flow;
  byte a=2;
  initial begin
  $display("unique case with multiple true case");
    unique case(a)
      0: $display("value 0");
      1: $display("value 1");
      3: $display("value 3");
    endcase
  end
endmodule 
/*
OUTPUT
unique case with multiple true case
xmsim: *W,NOCOND: Unique case violation:  Every case item expression was false.
*/
