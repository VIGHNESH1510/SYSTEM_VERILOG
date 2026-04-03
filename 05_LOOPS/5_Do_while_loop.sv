module do_while_loops;
  int i=0;
  initial 
    begin
      i=5;
    $display("\n Do while ");
    do
      begin
        $display("value of 2^%0d = %0d",i,2**i);
        i++;
      end while(i <15);
  endmodule

  /*
  OUTPUT
   Do while 
value of 2^5 = 32
value of 2^6 = 64
value of 2^7 = 128
value of 2^8 = 256
value of 2^9 = 512
value of 2^10 = 1024
value of 2^11 = 2048
value of 2^12 = 4096
value of 2^13 = 8192
value of 2^14 = 16384
*/
    
