module packed_array;
  logic [3:0] arr_1D; 
  bit [3] arr; // index 0,1,2
  initial 
    begin
      
        // assigning values to the array
      for(int i=0; i<4; i++)
        begin
          arr_1D[i] = i%2;
          $display("arr_1D[%0d] =%b",i,arr_1D[i]);
        end
      
      foreach(arr_1D[i])
    begin
       arr_1D[i] = i%2;
      $display("arr_1D[%0d] =%b",i,arr_1D[i]);
    end
      
       arr_1D = 4'd15;
       $display("arr_1D = %b",arr_1D);     
    end
  
endmodule


/*OUTPUT
# KERNEL: arr_1D[0] =0
# KERNEL: arr_1D[1] =1
# KERNEL: arr_1D[2] =0
# KERNEL: arr_1D[3] =1

# KERNEL: arr_1D[3] =1
# KERNEL: arr_1D[2] =0
# KERNEL: arr_1D[1] =1
# KERNEL: arr_1D[0] =0

# KERNEL: arr_1D = 1111
*/
