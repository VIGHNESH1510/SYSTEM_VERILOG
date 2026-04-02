module control_flow;
  byte a=10,b=15;
  initial begin
    $display("case with mutliple conditions true");
    case (1)
      (a < 20): $display("case 1");
      (a < b): $display("case 2");
      (a != b): $display("case 3");
    default: $display("default case");
    endcase
    
  end
endmodule 

/*
OUTPUT
case with mutliple conditions true
case 1
*/
