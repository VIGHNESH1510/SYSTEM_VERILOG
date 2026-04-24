module function_reference;
  function automatic int func_ref(ref int a); // reference call , changes will be reflected in actual variable
    a = a+5;
  endfunction
  
  int n=1;
  initial begin
    $display("Before function call n = %0d",n);
    func_ref(n);
    $display("After function call n = %0d ",n);
  end
endmodule

/*
# KERNEL: Before function call n = 1
# KERNEL: After function call n = 6  
*/
