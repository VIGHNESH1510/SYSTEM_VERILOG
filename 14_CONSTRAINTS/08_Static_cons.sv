class transaction; //static constraint
  rand bit[3:0] data1;
  rand bit[3:0] data2;
  
  static constraint cons1{ data1 inside {[10:15]};}
  constraint cons2 { data2 inside {[1:5]}; }
endclass

module tb;
  
  transaction tr1,tr2;
  
  initial begin
    tr1 = new();
    tr2 = new();
    
    tr1.cons2.constraint_mode(0);
    $display("Disabling Non static constraint");
    
    repeat(5) begin
      assert(tr2.randomize());
      $display("object tr2, data1=%0d data2=%0d",tr2.data1,tr2.data2);
    end
    
    tr1.cons1.constraint_mode(0);
    $display("\nDisabling static constraint");
    
    repeat(5) begin
      assert(tr2.randomize());
      $display("object tr2, data1=%0d data2=%0d",tr2.data1,tr2.data2);
    end
    
  end
  
endmodule


/*
Disabling Non static constraint
object tr2, data1=10 data2=4
object tr2, data1=14 data2=4
object tr2, data1=14 data2=5
object tr2, data1=12 data2=1
object tr2, data1=11 data2=5

Disabling static constraint
object tr2, data1=9 data2=2
object tr2, data1=2 data2=3
object tr2, data1=9 data2=5
object tr2, data1=6 data2=1
object tr2, data1=1 data2=3
*/
