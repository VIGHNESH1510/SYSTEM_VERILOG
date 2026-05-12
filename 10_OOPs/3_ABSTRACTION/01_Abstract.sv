virtual class operands;
  
  logic [3:0] operand_A;
  logic [3:0] operand_B;
  
  
  function void display();
    operand_A = 4'd15;
    operand_B = 4'd9;
    $display("Virtual class");
    $display("A =%0d B=%0d",operand_A, operand_B,);
  endfunction
  
endclass

class adder extends operands;
  
  function void display();
    operand_A = 4'd12;
    operand_B = 4'd1;
    $display("Addition operation ,sum= %0d",operand_A+operand_B);
  endfunction
  
endclass

module tb;
  adder ad;
  operands op;
  initial begin
    // op = new(); // Error - An abstract (virtual) class cannot be instantiated.
    ad = new();
    op = ad;
    op.display();
  end
  
endmodule

/*
OUTPUT 
Virtual class
A =15 B=9 
*/
