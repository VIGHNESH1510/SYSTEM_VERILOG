class transaction;
  
  rand bit [3:0] a;
  rand bit [3:0] b;
  rand bit [3:0] c;
  
  constraint cons{a <b+c; 
                  b<c+2; 
                  c >=10;}
  
endclass

module tb;
  
  transaction tr;
  
  initial 
    begin
      tr = new();
      
      //$display("Randomizing");
      
      for(int i=1; i<=10; i++)
        begin
          assert(tr.randomize());
          $display("Iteration=%0d A=%0d B=%0d C=%0d",i,tr.a,tr.b,tr.c);
        end
      
    end
  
endmodule

/*
Iteration=1 A=0 B=8 C=11
Iteration=2 A=8 B=3 C=10
Iteration=3 A=5 B=15 C=15
Iteration=4 A=0 B=9 C=15
Iteration=5 A=2 B=6 C=13
Iteration=6 A=14 B=3 C=12
Iteration=7 A=4 B=13 C=15
Iteration=8 A=10 B=13 C=14
Iteration=9 A=0 B=4 C=13
Iteration=10 A=8 B=1 C=12
*/
