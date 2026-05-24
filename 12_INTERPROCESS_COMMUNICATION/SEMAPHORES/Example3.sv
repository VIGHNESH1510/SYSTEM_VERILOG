module semaphore_tb;

  semaphore key = new(2);

  task master(string name, bit blocking);

    if(blocking)
    begin
      // Blocking get()
      key.get(2);

      Bus(name);

      #5;

      key.put(2);
    end

    else
    begin
      // Non-blocking try_get()
      if(key.try_get(2))
      begin
        Bus(name);
        #5;
        key.put(2);
      end

      else
        $display("time=%0t %s : Bus is Busy",$time,name);

    end
  endtask


  task Bus(string str);
    
    $display("time=%0t %s Access the bus",$time,str);
    #2;
    $display("time=%0t %s Done",$time,str);
    
  endtask


  initial
  begin

    fork

      master("Master1",0); // try_get()
      #1;
      master("Master2",0); // try_get()
      master("Master3",1); // get()

    join

  end

endmodule

/*
OUTPUT
xcelium> run
time=0 Master1 Access the bus
time=0 Master2 : Bus is Busy
time=2 Master1 Done
time=7 Master3 Access the bus
time=9 Master3 Done
xmsim: *W,RNQUIE: Simulation is complete.
xcelium> exit
*/
