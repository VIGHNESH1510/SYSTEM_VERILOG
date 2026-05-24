class Random;
  rand logic [2:0] A; // value can repeat randomly
  
  randc logic [2:0] B; // random values repeat only after all values are used
  constraint cons{
   				   A>2;
    			   B>3;
    
  				}
endclass

module tb;
  
  Random c;
  int i=0;
  
  initial begin
    
    c = new();
    
    repeat(10)
      begin
        if(c.randomize())
          $display("Cycle =%0d A=%0d B=%0d",i,c.A,c.B);
        else
          $display("Randomization Failed");
        i++;
      end
    
  end
 
endmodule

/*
OUTPUT
xcelium> run
Cycle =0 A=7 B=4
Cycle =1 A=5 B=5
Cycle =2 A=6 B=7
Cycle =3 A=5 B=6
Cycle =4 A=3 B=7
Cycle =5 A=6 B=6
Cycle =6 A=3 B=4
Cycle =7 A=5 B=5
Cycle =8 A=3 B=4
Cycle =9 A=5 B=5
xmsim: *W,RNQUIE: Simulation is complete.
xcelium> exit
*/
