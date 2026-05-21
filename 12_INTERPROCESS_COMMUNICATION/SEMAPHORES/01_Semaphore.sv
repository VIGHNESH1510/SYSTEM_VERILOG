module Semaphore;
  
  semaphore sem = new(1); // new() creates the semaphore object and initializes the number of keys
  
  task gen();
    sem.get(1); // get() retrives keys from the semaphore
    $display("time=%0t Generator starts",$time);
    #2;
    $display("time=%0t values randomized",$time);
    #3;
    $display("time=%0t Generator stops",$time);
    sem.put(1); // put() return keys back to the semaphore
  endtask
  
  task dri();
    sem.get(1);
    $display("time=%0t Driver starts",$time);
    #2;
    $display("time=%0t values drived",$time);
    #3;
    $display("time=%0t Driver stops",$time);
    sem.put(1);
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
time=5 Driver starts
time=7 values drived
time=10 Driver stopstime=0 Generator starts
time=2 values randomized
time=5 Generator stops
time=5 Driver starts
time=7 values drived
time=10 Driver stops
*/
