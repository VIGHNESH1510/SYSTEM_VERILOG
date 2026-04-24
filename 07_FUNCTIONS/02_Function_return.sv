module function_ex;
  int a;
  function int sum(input int n);
    int a;
    $display("input value = %0d",n);
    for(int i=0; i<n ; i++) begin
        a += i;
    end
    return a;
  endfunction
  
  initial begin
    a=10;
    $display("Function call");
    $display("return value = %0d",sum(a));
  end
endmodule 

/*
# KERNEL: Function call
# KERNEL: input value = 10
# KERNEL: return value =45
*/
