module for_loops;
  byte b[5];
  int i=0;
  initial 
    begin
    $display("\n While Loop ");
    while(i < $size(b))
      begin
        b[i] = i*i;
        $display("b[%0d] = %0d",i,b[i]);
        i++;
      end
  endmodule

  /*
  OUTPUT
   While Loop 
b[0] = 0
b[1] = 1
b[2] = 4
b[3] = 9
b[4] = 16
 */   
