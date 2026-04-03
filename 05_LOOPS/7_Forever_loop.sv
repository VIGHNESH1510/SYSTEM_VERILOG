module forever_tb;
  int i=0;
  initial
    forever
    begin
      i++;
      if(i==6)
        continue;
      else begin
      	if(i==10)
          break;
        else
          $display("count = %0d",i);
      end
    end
endmodule

/*
OUTPUT
count = 1
count = 2
count = 3
count = 4
count = 5
count = 7
count = 8
count = 9
*/
