module unpacked_array;
  int arr_1D[3];
  initial
    begin
      arr_1D = '{default: 0}; //set default value
      $display("arr_1D = %p",arr_1D);
      
      arr_1D = '{0:10, 2:30, default:5}; //index assignment
       $display("arr_1D = %p",arr_1D);
      
      arr_1D = '{1,2,3};
      $display("arr_1D = %p",arr_1D);
      
      foreach(arr_1D[i])
        begin
          arr_1D[i] = i*5;
          $display("arr_1D[%0d] = %0d",i, arr_1D[i]);
        end
    end
endmodule

/*
OUTPUT 
# KERNEL: arr_1D = '{0, 0, 0}
# KERNEL: arr_1D = '{10, 5, 30}
# KERNEL: arr_1D = '{1, 2, 3}
# KERNEL: arr_1D[0] = 0
# KERNEL: arr_1D[1] = 5
# KERNEL: arr_1D[2] = 10 */
