module func_recursive();
  function int func_static(int a);
    if(a==1)
      return 1;
    else
      return a*func_static(a-1);
  endfunction
  
  function automatic int func_auto(int a);
    if(a==1)
      return 1;
    else
      return a*func_auto(a-1);
  endfunction
  
  initial begin
    $display("function_static");
    $display("static result =%0d",func_static(3));
    
    $display("function_automatic");
    $display("automatic result = %0d",func_auto(3));
  end
endmodule

/*
# KERNEL: function_static
# KERNEL: static result =1
# KERNEL: function_automatic
# KERNEL: automatic result = 6 */
