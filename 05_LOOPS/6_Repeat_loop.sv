module repeat_tb;
  int c[3][3];
  int i = 0, j;
  initial
    begin
      repeat($size(c)) 
        begin
        j = 0;
        repeat($size(c[i])) 
          begin
          c[i][j] = i + j;
          $display("c[%0d][%0d] = %0d", i, j, c[i][j]);
          j++;
          end
        i++;
        end
  end
endmodule

/*
OUTPUT
c[0][0] = 0
c[0][1] = 1
c[0][2] = 2
c[1][0] = 1
c[1][1] = 2
c[1][2] = 3
c[2][0] = 2
c[2][1] = 3
c[2][2] = 4
*/
