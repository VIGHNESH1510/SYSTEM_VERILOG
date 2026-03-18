module packed_array;
  logic [3:0] [2:0] [3:0] arr_3D;  //3D packed array
  
  initial 
    begin
      arr_3D [0] = 12'h123;
      arr_3D [1] = 12'h456;
      arr_3D [2] = 12'hABC;
      arr_3D [3] = 12'hDEF;
      $display("arr_3D = %0h",arr_3D);
      
      for(int i=0;i<=3;i++)
        begin
          for(int j=0; j<=2; j++)
            begin
              arr_3D[i][j] = 4'(j);
              $display("arr_3D[%0d][%0d] = %0d",i,j,arr_3D[i][j]);
            end
        end
      
      foreach(arr_3D[i,j,k])
        begin
          arr_3D[i][j][k] = i^j^k;
          $display("arr_3D[%0d][%0d][%0d] = %0d",i,j,arr_3D[i][j][k]);
        end
    end
  
endmodule

/*OUTPUT
# KERNEL: arr_3D = defabc456123

# KERNEL: arr_3D[0][0] = 0
# KERNEL: arr_3D[0][1] = 1
# KERNEL: arr_3D[0][2] = 2
# KERNEL: arr_3D[1][0] = 0
# KERNEL: arr_3D[1][1] = 1
# KERNEL: arr_3D[1][2] = 2
# KERNEL: arr_3D[2][0] = 0
# KERNEL: arr_3D[2][1] = 1
# KERNEL: arr_3D[2][2] = 2
# KERNEL: arr_3D[3][0] = 0
# KERNEL: arr_3D[3][1] = 1
# KERNEL: arr_3D[3][2] = 2


# KERNEL: arr_3D[3][2][3] = 0
# KERNEL: arr_3D[3][2][2] = 1
# KERNEL: arr_3D[3][2][1] = 0
# KERNEL: arr_3D[3][2][0] = 1
# KERNEL: arr_3D[3][1][3] = 1
# KERNEL: arr_3D[3][1][2] = 0
# KERNEL: arr_3D[3][1][1] = 1
# KERNEL: arr_3D[3][1][0] = 0
# KERNEL: arr_3D[3][0][3] = 0
# KERNEL: arr_3D[3][0][2] = 1
# KERNEL: arr_3D[3][0][1] = 0
# KERNEL: arr_3D[3][0][0] = 1
# KERNEL: arr_3D[2][2][3] = 1
# KERNEL: arr_3D[2][2][2] = 0
# KERNEL: arr_3D[2][2][1] = 1
# KERNEL: arr_3D[2][2][0] = 0
# KERNEL: arr_3D[2][1][3] = 0
# KERNEL: arr_3D[2][1][2] = 1
# KERNEL: arr_3D[2][1][1] = 0
# KERNEL: arr_3D[2][1][0] = 1
# KERNEL: arr_3D[2][0][3] = 1
# KERNEL: arr_3D[2][0][2] = 0
# KERNEL: arr_3D[2][0][1] = 1
# KERNEL: arr_3D[2][0][0] = 0
# KERNEL: arr_3D[1][2][3] = 0
# KERNEL: arr_3D[1][2][2] = 1
# KERNEL: arr_3D[1][2][1] = 0
# KERNEL: arr_3D[1][2][0] = 1
# KERNEL: arr_3D[1][1][3] = 1
# KERNEL: arr_3D[1][1][2] = 0
# KERNEL: arr_3D[1][1][1] = 1
# KERNEL: arr_3D[1][1][0] = 0
# KERNEL: arr_3D[1][0][3] = 0
# KERNEL: arr_3D[1][0][2] = 1
# KERNEL: arr_3D[1][0][1] = 0
# KERNEL: arr_3D[1][0][0] = 1
# KERNEL: arr_3D[0][2][3] = 1
# KERNEL: arr_3D[0][2][2] = 0
# KERNEL: arr_3D[0][2][1] = 1
# KERNEL: arr_3D[0][2][0] = 0
# KERNEL: arr_3D[0][1][3] = 0
# KERNEL: arr_3D[0][1][2] = 1
# KERNEL: arr_3D[0][1][1] = 0
# KERNEL: arr_3D[0][1][0] = 1
# KERNEL: arr_3D[0][0][3] = 1
# KERNEL: arr_3D[0][0][2] = 0
# KERNEL: arr_3D[0][0][1] = 1
# KERNEL: arr_3D[0][0][0] = 0 */
