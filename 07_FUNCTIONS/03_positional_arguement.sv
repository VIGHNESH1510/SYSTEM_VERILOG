module func;
  function int product(input int a,b,c);
    $display("a=%0d b=%0d c=%0d",a,b,c);
    return a*b*c;
  endfunction
  
  initial begin
  $display("positional arguement function");
  $display("result = %0d",product(.c(4),.b(5),.a(10)));
  end
  
endmodule
/*
# KERNEL: positional arguement function
# KERNEL: a=10 b=5 c=4
# KERNEL: result = 200
*/
