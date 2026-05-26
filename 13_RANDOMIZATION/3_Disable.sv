class Disable;
    
  rand logic[4:0] data;
  rand logic [1:0] opcode;
  
  constraint c1{ !(data inside {[10:15]});}
  
endclass

module tb;
  
  Disable db;
  
  initial 
    begin
      
      db = new();
      $display("Randomization applied");
      assert(db.randomize());
      
      $display("data =%0d opcode =%0d", db.data, db.opcode);
      
      $display("Randomization disabled, case 1");
      db.data = 5'h5;
      db.opcode = 3;
      db.rand_mode(0); // rand_mode(0) -> disables randomization
      assert(db.randomize()); 
      $display("data =%0d opcode =%0d", db.data, db.opcode);
      
      
      $display("Randomization disabled, case 2");
      db.data = 5'hA;
      db.opcode = 2;
      db.rand_mode(0);
      assert(db.randomize()); 
      // Even though randomization is disabled,
      // constraints are still checked on the existing values.
      // This fails because data = 10 violates constraint c1.
      $display("data =%0d opcode =%0d", db.data, db.opcode);
      
    end
  
endmodule

/*

Randomization applied
data =17 opcode =0
Randomization disabled, case 1
data =5 opcode =3
Randomization disabled, case 2
xmsim: *W,RNDOCS: These constraints and variables contribute to the set of conflicting constraints (view the extended help for this message using 'xmhelp xmsim RNDOCS' for guidelines on how debug the issue):

In ./testbench.sv
line  259:  !(data inside { [ 32'ha : 32'hf ] })


Variable  Type         Status        Current Value          Source                     
---------------------------------------------------------------------------------------
data      (bit [4:0])  STATE VAR     10 ('ha)               ./testbench.sv ; line 256


      assert(db.randomize()); // eventhough randomize() is called ,it does nothing
                        |
xmsim: *W,SVRNDF (./testbench.sv,288|24): The randomize method call failed. The unique id of the failed randomize call is 2.
Observed simulation time : 0 FS + 0.
xmsim: *E,ASRTST (./testbench.sv,288): (time 0 FS) Assertion tb.__assert_3 has failed 
data =10 opcode =2
xmsim: *W,RNQUIE: Simulation is complete.
*/
