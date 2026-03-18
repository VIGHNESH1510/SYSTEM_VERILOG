module packed_array;
  logic [3] [2] arr_2D;  //2D packed array
  
  initial 
    begin
       foreach(arr_2D[i])
        begin
          arr_2D[i] = i;
          $display("arr_2D[%0d] = %d",i,arr_2D[i]);
        end 
      
      arr_2D = 12'b1011_0111_1111;
      $display("arr_2D = %b",arr_2D);
      
      arr_2D = '{1,2,3};
      $display("arr_2D = %b",arr_2D);
      
      for(int i=0; i<$size(arr_2D);i++)
        begin
        arr_2D[i] = 3'(i);
          $display("arr_2D[%0d] = %b",i,arr_2D[i]);
        end
    end
endmodule

/*OUTPUT
# KERNEL: arr_2D[0] = 0
# KERNEL: arr_2D[1] = 1
# KERNEL: arr_2D[2] = 2
# KERNEL: arr_2D = 111111
# KERNEL: arr_2D = 011011
# KERNEL: arr_2D[0] = 00
# KERNEL: arr_2D[1] = 01
# KERNEL: arr_2D[2] = 10 */
