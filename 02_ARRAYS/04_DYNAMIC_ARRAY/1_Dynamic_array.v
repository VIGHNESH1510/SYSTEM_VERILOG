module dynamic_array;
  int arr[];
  int f_arr[4];
  initial 
    begin
      arr =new[5]; // declaring array size
      // arr = '{default:99}; cannot be used in dynamic arrays 
       $display("%p",arr);
      
      // overwriting the array 
      arr = '{10,22,33,44,55}; //overwrites size
      $display("%p",arr);
      
      arr = new[7](arr);
      $display("%p",arr);
      
      foreach(arr[i])
        arr[i] = i*i;
      $display("%p",arr);
      
      for(int i=0;i<$size(arr);i++)
        arr[i] = i*4;
      $display("%p",arr);
      
      //copying from a fixed array
      f_arr ='{11,22,33,44}; //overwrites size
      arr = f_arr;
      $display("%p",arr);
      
      //deleting  a dynamic array
      arr.delete(); //retuens a empty array
      $display("%p",arr);
    end
endmodule

/*
OUTPUT 
# KERNEL: '{0, 0, 0, 0, 0}
# KERNEL: '{10, 22, 33, 44, 55}
# KERNEL: '{10, 22, 33, 44, 55, 0, 0}
# KERNEL: '{0, 1, 4, 9, 16, 25, 36}
# KERNEL: '{0, 4, 8, 12, 16, 20, 24}
# KERNEL: '{11, 22, 33, 44} */
# KERNEL: '{}
