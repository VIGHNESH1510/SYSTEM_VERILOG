module function_array;
  typedef int array[5];
  typedef int dynamic[];
  array a;
  function array func_arr1(int a);
    array temp;
    foreach(temp[i])
      temp[i] = (a+1)*i;
    return temp;
  endfunction
  
  function dynamic func_arr2(int a);
    dynamic temp;
    temp = new[5];
    for(int i=0; i<5;i++)
      temp[i] = (a+i)*i;
    return temp;
  endfunction
  
  initial begin
    for(int i=0;i<5;i++)
      $display("arr%0d = %p",i,func_arr1(i));
    for(int i=0;i<5;i++)
      $display("arr%0d = %p",i,func_arr2(i));
  end
endmodule

/*
#KERNEL: arr0 = '{0, 1, 2, 3, 4}
# KERNEL: arr1 = '{0, 2, 4, 6, 8}
# KERNEL: arr2 = '{0, 3, 6, 9, 12}
# KERNEL: arr3 = '{0, 4, 8, 12, 16}
# KERNEL: arr4 = '{0, 5, 10, 15, 20}
# KERNEL: arr0 = '{0, 1, 4, 9, 16}
# KERNEL: arr1 = '{0, 2, 6, 12, 20}
# KERNEL: arr2 = '{0, 3, 8, 15, 24}
# KERNEL: arr3 = '{0, 4, 10, 18, 28}
# KERNEL: arr4 = '{0, 5, 12, 21, 32}
*/
