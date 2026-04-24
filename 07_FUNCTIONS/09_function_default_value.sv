module function_default;
  function logic[3:0] func_default(int a=1,b=2);
    return (a+b)*2;
  endfunction
  initial begin
    $display("function call");
    $display("return value %0d ",func_default());
    $display("return value %0d",func_default(3,4)); // overriding the values
  end
endmodule

/*
# KERNEL: function call
# KERNEL: return value 6 
# KERNEL: return value 14
*/
