module for_loops;
  bit[3:0] arr[2][3];
  initial
    begin
    $display("\n foreach loop ");
    foreach(arr[i,j])
      begin
        arr[i][j] = arr[i][j]*2;
        $display("arr[%0d][%0d] = %0d",i,j,arr[i][j]);
      end
endmodule
      
/*
OUTPUT
 foreach loop 
arr[0][0] = 0
arr[0][1] = 2
arr[0][2] = 4
arr[1][0] = 2
arr[1][1] = 4
arr[1][2] = 6
*/
