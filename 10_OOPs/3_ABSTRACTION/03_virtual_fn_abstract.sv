virtual class operands;
  
  logic [3:0] operand_A;
  logic [3:0] operand_B;
  
  
  virtual function void display();
    operand_A = 4'd15;
    operand_B = 4'd9;
    $display("Virtual class");
    $display("A =%0d B=%0d ",operand_A, operand_B,);
  endfunction
  
endclass

class adder extends operands;
  
  function void display();
    operand_A = 4'd12;
    operand_B = 4'd1;
    $display("DERIVED CLASS");
    $display("A =%0d B=%0d ",operand_A, operand_B,);
    $display("Addition operation ,sum= %0d",operand_A+operand_B);
  endfunction
  
endclass

module tb;
  adder ad;
  operands op;
  initial begin
   // op = new(); // An abstract (virtual) class cannot be instantiated.
    ad = new();
    op = ad;
    op.display();
  end
  
endmodule

/*
OUTPUT
DERIVED CLASS
A =12 B=1  
Addition operation ,sum= 13
*/
