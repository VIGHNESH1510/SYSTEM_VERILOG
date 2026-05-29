class base;
  
  rand bit [3:0] A;
  rand bit [3:0] B;
  
  constraint cons_A{ soft A>5; A<12; }
  constraint cons_B{ B>3; B<10; }
endclass

class derived extends base;
  
  constraint cons_A {A==10;}
  constraint cons_B {soft B inside {[1:4]};}
  
endclass

module tb;
  
  derived d;
  base b;
  
  initial 
    begin
      
      d = new();
      b = new();
      
      assert(d.randomize() with {B==11;});
      assert(b.randomize() );
      
      $display("Base , A=%0d B=%0d ", b.A,b.B);
      $display("Derived , A=%0d B=%0d ", d.A,d.B);
      
    end
  
endmodule

/*
xcelium> run
Base , A=7 B=5 
Derived , A=10 B=11 
xmsim: *W,RNQUIE: Simulation is complete.
*/
