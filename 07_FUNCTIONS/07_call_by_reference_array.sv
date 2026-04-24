module function_array();
  int a[5];
  function automatic func_arr(ref int a[5]);
    for(int i=0;i<$size(a);i++)
      a[i] = i*i;
  endfunction
  initial begin
    $display("Function  call");
    func_arr(a);
    foreach(a[i])
      $display("a[%0d] = %0d",i,a[i]);
  end
endmodule

/*
# KERNEL: Function  call
# KERNEL: a[0] = 0
# KERNEL: a[1] = 1
# KERNEL: a[2] = 4
# KERNEL: a[3] = 9
# KERNEL: a[4] = 16 
*/
