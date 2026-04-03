module for_loops;
  bit[3:0] arr[2][3];
  initial 
    begin
    $display(" Nested for loop");
    for(int i=0; i<$size(arr);i++)
      begin
        for(int j=0; j<$size(arr[i]);j++)
          begin
            arr[i][j] = i+j;
            $display("arr[%0d][%0d] = %0d",i,j,arr[i][j]);
          end
      end
endmodule

/*
OUTPUT
 Nested for loop
arr[0][0] = 0
arr[0][1] = 1
arr[0][2] = 2
arr[1][0] = 1
arr[1][1] = 2
arr[1][2] = 3
*/
