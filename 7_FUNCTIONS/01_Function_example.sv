module function_ex;
  int result;
  
//   function int product(input int a,b);
//     $display("Entered Function");
//     $display("Entered Function");
//     product = a*b;
//   endfunction
  
  function int product(input int a,b); // default data type is logic
    $display("Entered Function");
    $display("a=%0d b=%0d ",a,b);
    return a*b;
  endfunction
  
  initial begin
    $display("Function called");
    result = product(5,4);
    $display(" product = %0d",result);
  end
endmodule  

/*
# KERNEL: Function called
# KERNEL: Entered Function
# KERNEL: a=5 b=4 
# KERNEL:  product = 20
*/
