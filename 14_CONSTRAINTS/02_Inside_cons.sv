
class transaction; // inside operator
  rand logic [3:0] a;
  rand logic [3:0] b;
  rand logic [3:0] c;
  rand logic [3:0] d;
  int  arr[] = '{2,4,6,8,12,14};
  int start, stop;
  
//   constraint c1 {a inside {1,4,5,15};}
//   constraint c2 {b inside {[0:7], [13:15]};}
//   constraint c3 {c inside {2, [5:8]};}
  
  constraint cons { 
    			   start < stop;
    			   a inside {1,2,[5:8]};
                   !(b inside {[0:7], [13:15]});
                   c inside {arr};
    			   d inside {[start:stop]};
                  }
endclass

module tb;
  transaction tr;
  initial begin
    tr = new();
   // $display("Randomizing the variables");
    tr.start =2; tr.stop =10;
    for(int i=1; i<=10; i++) begin
      assert(tr.randomize());
      $display("Iteration=%0d A=%0d B=%0d C=%0d D=%0d ",i,tr.a,tr.b,tr.c,tr.d);
    end
  end
endmodule 

/*
Iteration=1 A=2 B=9 C=4 D=5 
Iteration=2 A=8 B=10 C=2 D=5 
Iteration=3 A=7 B=10 C=14 D=9 
Iteration=4 A=7 B=10 C=14 D=6 
Iteration=5 A=2 B=11 C=8 D=2 
Iteration=6 A=7 B=12 C=8 D=4 
Iteration=7 A=2 B=12 C=4 D=4 
Iteration=8 A=2 B=12 C=8 D=5 
Iteration=9 A=2 B=12 C=8 D=4 
Iteration=10 A=6 B=8 C=6 D=2 
*/
