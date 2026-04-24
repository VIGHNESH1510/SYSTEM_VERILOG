module  func_automatic();
  function int func_static(); // shared memory
    int count=0;
      count++;
    return count;
  endfunction
  
  function automatic int func_auto(); // individual memory allocated
    int count=0;
      count++;
    return count;
  endfunction
  
  int result1,result2;
  initial begin
    $display("func_static call");
    $display("func_static call 1 :%0d",func_static());
    $display("func_static call 2 :%0d",func_static());
    $display("func_static call 3 :%0d",func_static());
    
    $display("func_automatic");
    $display("func_automatic call 1 :%0d",func_auto());
    $display("func_automatic call 2 :%0d",func_auto());
    $display("func_automatic call 3 :%0d",func_auto());
    
  end
  
endmodule
/*
# KERNEL: func_static call
# KERNEL: func_static call 1 :1
# KERNEL: func_static call 2 :2
# KERNEL: func_static call 3 :3
# KERNEL: func_automatic
# KERNEL: func_automatic call 1 :1
# KERNEL: func_automatic call 2 :1
# KERNEL: func_automatic call 3 :1 */
