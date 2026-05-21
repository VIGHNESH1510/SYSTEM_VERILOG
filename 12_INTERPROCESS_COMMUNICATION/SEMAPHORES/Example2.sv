
module Semaphore;
  
  semaphore sem = new(2); // new() defines object and no of keys
  
  task gen();
    sem.get(1);
    $display("time=%0t Generator starts",$time);
    #2;
    $display("time=%0t values randomized",$time);
    #3;
    $display("time=%0t Generator stops",$time);
    //sem.put(1);
  endtask
  
  task dri();
    sem.get(2); // requires two keys to process,  but only one key is left
    $display("time=%0t Driver starts",$time);
    #2;
    $display("time=%0t values drived",$time);
    #3;
    $display("time=%0t Driver stops",$time);
    sem.put(2);
  endtask
  
  initial begin
    fork
      gen();
        #1;
      dri();
    join
  end
  
  
endmodule

/*
OUTPUT
time=0 Generator starts
time=2 values randomized
time=5 Generator stops
*/
