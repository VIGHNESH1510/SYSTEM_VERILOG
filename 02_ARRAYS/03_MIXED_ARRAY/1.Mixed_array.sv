// Code your testbench here
// or browse Examples
module mix_arr;
  logic [7:0]arr1[2:0];
  logic [7:0] arr2[2:0][1:0];
  logic [7:0] arr3[3:0][1:0][2:0];
  initial
    begin
      arr1 = '{8'haa,8'hbb,8'h1}; 
//       $display("arr1= %p",arr1);
      
      arr2 ='{'{default:2},'{default:3},'{default:8}};
//       $display("arr2= %p",arr2);
      
      foreach(arr3[i,j,k])
        arr3[i][j][k] = j;
      
      $display(" arr1= %p \n arr2= %p \n arr3= %p",arr1,arr2,arr3);
      
      $display(" size of arr1 = %0d \n size of arr2 = %0d \n size of arr3 = %0d ",$size(arr1),$size(arr2),$size(arr3));
//       $display("size of arr2 = %0d",$size(arr2));
//       $display("size of arr3 = %0d",$size(arr3));
      
      $display("size of dim 3 in arr3 = %0d",$size(arr3,3)); // $size(arr_name,dimension_no)  //dimension no 1->n
      
      $display("dimension of arr3 = %0d",$dimensions(arr3));// returns the dimension of the array
      
    end
endmodule

/*
OUTPUT
# KERNEL:  arr1= '{170, 187, 1} 
# KERNEL:  arr2= '{'{2, 2}, '{3, 3}, '{8, 8}} 
# KERNEL:  arr3= '{'{'{1, 1, 1}, '{0, 0, 0}}, '{'{1, 1, 1}, '{0, 0, 0}}, '{'{1, 1, 1}, '{0, 0, 0}}, '{'{1, 1, 1}, '{0, 0, 0}}}
# KERNEL:  size of arr1 = 3 
# KERNEL:  size of arr2 = 3 
# KERNEL:  size of arr3 = 4 
# KERNEL: size of dim 3 in arr3 = 3
# KERNEL: dimension of arr3 = 4 */
