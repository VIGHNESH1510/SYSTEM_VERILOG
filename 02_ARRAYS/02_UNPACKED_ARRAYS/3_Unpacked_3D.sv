module unpacked_array;
  shortint arr_3D[2][3][4];
  initial
    begin
arr_3D[0][0][1] = 3;
      arr_3D[1][1][1] = 5;
      arr_3D[1][2][2] = 9;
      $display(arr_3D);
      
      arr_3D ='{'{default:2},'{default:3}};
      $display(arr_3D);
      
      foreach(arr_3D[i,j,k])
        arr_3D[i][j][k] = $urandom_range(5,1);
      $display("foreach\n",arr_3D);
      
      for(int i=0;i<$size(arr_3D);i++)
        begin
          arr_3D[i] = '{'{default:i*1},'{default:i*2},'{default:i*3}};
        end
      $display("forloop\n",arr_3D);
    end
endmodule
/*
OUTPUT
# KERNEL: '{'{'{0, 3, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}}, '{'{0, 0, 0, 0}, '{0, 5, 0, 0}, '{0, 0, 9, 0}}}
# KERNEL: '{'{'{2, 2, 2, 2}, '{2, 2, 2, 2}, '{2, 2, 2, 2}}, '{'{3, 3, 3, 3}, '{3, 3, 3, 3}, '{3, 3, 3, 3}}}
# KERNEL: foreach
# KERNEL: '{'{'{3, 5, 3, 3}, '{3, 2, 5, 5}, '{5, 1, 2, 4}}, '{'{4, 2, 2, 4}, '{2, 5, 3, 3}, '{4, 3, 2, 1}}}
# KERNEL: forloop
# KERNEL: '{'{'{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}}, '{'{1, 1, 1, 1}, '{2, 2, 2, 2}, '{3, 3, 3, 3}}} */
