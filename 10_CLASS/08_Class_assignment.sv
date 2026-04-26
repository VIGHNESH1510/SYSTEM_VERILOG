
class class_assignment;
  int constant;
endclass

module tb;
  initial begin
    class_assignment c1= new();
    class_assignment c2= new();
    c1.constant = 45;
    c2=c1; // both handles points to  same memory(object)
    $display("c1.data = %0d",c1.constant);
    $display("c2.data = %0d",c2.constant);
    c2.constant = 20;
    $display("c1.data = %0d",c1.constant);
    $display("c2.data = %0d",c2.constant);
    
  end
endmodule

/*
# KERNEL: c1.data = 45
# KERNEL: c2.data = 45
# KERNEL: c1.data = 20
# KERNEL: c2.data = 20
*/
