module Rand_case;
  
  task write();
    $display("time =%0t , write transaction sent",$time);
    #10;
  endtask
  
  task read();
    $display("time =%0t , read transaction sent",$time);
    #10;
  endtask
  
  task error();
    $display("time =%0t , error transaction sent",$time);
    #10;
  endtask
  
  initial begin
    
    repeat(10)
      begin
        randcase
        4: write();
        5: read();
        1: error();
        endcase
      end
    
    $display();
    repeat(5)
      begin
        randcase
        1: write();
        1: read();
        0: error(); // weight is 0, so this branch is never selected
        endcase
      end
    
    $display();
        randcase
    0: write(); /// results in an error because all weights are 0
        0: read();
        0: error();
        endcase
    
  end
  
endmodule

/*
time =0 , read transaction sent
time =10 , write transaction sent
time =20 , write transaction sent
time =30 , read transaction sent
time =40 , error transaction sent
time =50 , read transaction sent
time =60 , read transaction sent
time =70 , write transaction sent
time =80 , read transaction sent
time =90 , read transaction sent
 
time =100 , write transaction sent
time =110 , read transaction sent
time =120 , write transaction sent
time =130 , read transaction sent
time =140 , read transaction sent
 
xmsim: *W,RANDNOB: The sum of the weight expressions in the randcase statement is 0.
No randcase branch was taken.
            File: ./testbench.sv, line = 338, pos = 15
           Scope: Rand_case
            Time: 150 NS + 0

xmsim: *W,RNQUIE: Simulation is complete.
xcelium> exit
*/
