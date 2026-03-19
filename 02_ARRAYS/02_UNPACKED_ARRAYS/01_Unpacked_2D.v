module unpacked_array;
  byte arr_2D[3][2];
  initial
    begin
      
      arr_2D = '{'{1,2},'{8'hA,8'hB},'{8'hC,8'hF}};
      $display("arr_2D =%p",arr_2D);
      
      $urandom(32'd12345);
      foreach(arr_2D[i,j])
        begin
          arr_2D[i][j] = $urandom();
          $display("arr_2D[%0d][%0d] = %0d",i,j,arr_2D[i][j]);
        end
      $display("seed foreach");
      $urandom(32'd12345);
      foreach(arr_2D[i,j])
        begin
          arr_2D[i][j] = $urandom();
          $display("arr_2D[%0d][%0d] = %0d",i,j,arr_2D[i][j]);
        end
      
      $display("for loop");
      for(int i=0;i<$size(arr_2D);i++)
        begin
          arr_2D[i] = '{i*2,i*3};
          $display("arr_2D[%0d] = %p",i,arr_2D[i]);
        end
    end
endmodule

/*
OUTPUT
# KERNEL: arr_2D ='{'{1, 2}, '{10, 11}, '{12, 15}}
# KERNEL: arr_2D[0][0] = -114
# KERNEL: arr_2D[0][1] = -101
# KERNEL: arr_2D[1][0] = -115
# KERNEL: arr_2D[1][1] = 65
# KERNEL: arr_2D[2][0] = -39
# KERNEL: arr_2D[2][1] = -81
# KERNEL: seed foreach
# KERNEL: arr_2D[0][0] = -114
# KERNEL: arr_2D[0][1] = -101
# KERNEL: arr_2D[1][0] = -115
# KERNEL: arr_2D[1][1] = 65
# KERNEL: arr_2D[2][0] = -39
# KERNEL: arr_2D[2][1] = -81
# KERNEL: for loop
# KERNEL: arr_2D[0] = '{0, 0}
# KERNEL: arr_2D[1] = '{2, 3}
# KERNEL: arr_2D[2] = '{4, 6} */
